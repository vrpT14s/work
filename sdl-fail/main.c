#include "lib/app.h"
#include <SDL2/SDL.h>
#include <stdio.h>
#include <unistd.h>
#include <stdbool.h>
#include <time.h>
#include <math.h>
#include <complex.h>
#include <tgmath.h>
#include "graph.c"

int no_of_nodes = 0;
node_t nodes[100];
int no_of_edges = 0;

typedef struct context_t {
	//bool deletion_mode;
	bool edge_half_chosen;
	node_t* edge_start_node;
	node_t* touched_node;

	node_t* start_node;
	node_t* end_node;
} context_t;

context_t* context(Application* app)
{
	return (context_t*)(app->user_pointer);
}

void startup(Application* app)
{
	app->user_pointer = malloc(sizeof(context_t));
	if (context(app) == NULL) {
		printf("Malloc fail?\n");
		exit(1);
	}
	context(app)->edge_half_chosen = false;
	context(app)->touched_node = NULL;
	context(app)->start_node = NULL;
	context(app)->end_node = NULL;
}

void print_adj_list(Application* app, node_t* n)
{
	if (n->adj_list == NULL) {
		printf("%d - EMPTY\n", n->key);
		return;
	}
	printf("%d - [%d", n->key, ((node_t*) n->adj_list->data)->key);
	for (link_t* l = n->adj_list->next; l != NULL; l = l->next){
		node_t* adj = (node_t*) l->data;
		printf(", %d", adj->key);
	}
	printf("]\n");
}

void draw_arrowed_line(Application* app, int x1, int y1, int x2, int y2)
{
		SDL_RenderDrawLine(app->renderer, x1, y1, x2, y2);
		int dx = (x1 - x2);
		int dy = (y1 - y2);
		complex dz = dx + I*dy;
		dz /= cabs(dz);
		dz *= 20;
		float PI = 3.14159;
		complex dz_20cc = dz * exp( I * (PI / 9));
		complex dz_20c  = dz * exp(-I * (PI / 9));
		SDL_RenderDrawLine(app->renderer, x2, y2, x2 + creal(dz_20cc), y2 + cimag(dz_20cc));
		SDL_RenderDrawLine(app->renderer, x2, y2, x2 + creal(dz_20c),  y2 + cimag(dz_20c));
}

void draw_edge(Application* app, node_t* node1, node_t* node2) { draw_arrowed_line(app, node1->x, node1->y, node2->x, node2->y); }

void draw_adj_list(Application* app, node_t* n)
{
	for (link_t* l = n->adj_list; l != NULL; l = l->next){
		node_t* n2 = (node_t*) l->data;
		draw_edge(app, n, n2);
		/*
		SDL_RenderDrawLine(app->renderer, n->x, n->y, n2->x, n2->y);
		int dx = (n->x - n2->x);
		int dy = (n->y - n2->y);
		complex dz = dx + I*dy;
		dz /= cabs(dz);
		dz *= 20;
		float PI = 3.14159;
		complex dz_20cc = dz * exp( I * (PI / 9));
		complex dz_20c  = dz * exp(-I * (PI / 9));
		SDL_RenderDrawLine(app->renderer, n2->x, n2->y, n2->x + creal(dz_20cc), n2->y + cimag(dz_20cc));
		SDL_RenderDrawLine(app->renderer, n2->x, n2->y, n2->x + creal(dz_20c),  n2->y + cimag(dz_20c));
		*/
	}
}

void draw_path(Application* app, node_t* goal){
	SDL_SetRenderDrawColor(app->renderer, 0xf0, 0xf0, 0x2f, 0xff);
	for (node_t* z = goal; (z != NULL) && (z->parent != NULL); z = z->parent){
		draw_edge(app, z->parent, z);
	}
}

void draw_nodes(Application* app)
{
	SDL_SetRenderDrawColor(app->renderer, 0xff, 0xff, 0xff, 0xff);
	for (int i = 0; i < no_of_nodes; i++){
		draw_adj_list(app, nodes + i);
	}
	SDL_SetRenderDrawColor(app->renderer, 0xf5, 0, 0, 0xff);
	node_t* touched_node = context(app)->touched_node;
	if (touched_node != NULL) draw_adj_list(app,touched_node);
	for (int i = 0; i < no_of_nodes; i++){
		node_t n = nodes[i];
		SDL_SetRenderDrawColor(app->renderer, n.r, n.g, n.b, 0xff);
		if (context(app)->touched_node == (nodes + i)) {
			SDL_SetRenderDrawColor(app->renderer, 0xf5, 0, 0, 0xff);
		}
		SDL_Rect rect = {n.x - n.halfwidth, n.y - n.halfheight,
		                 2*n.halfwidth, 2*n.halfheight};
		SDL_RenderFillRect(app->renderer, &rect);
	}
}

void render(Application* app)
{
	SDL_SetRenderDrawColor(app->renderer, 0x3f,0x3f,0x3f, 0xff);
	SDL_RenderClear(app->renderer);
	SDL_SetRenderDrawColor(app->renderer, 0xf, 0xff, 0x20, 0xff);
	SDL_Rect rect = {10, 10, SCREEN_WIDTH - 20, SCREEN_HEIGHT - 20};
	SDL_RenderDrawRect(app->renderer, &rect);

	SDL_SetRenderDrawColor(app->renderer, 0xff, 0xff, 0xff, 0xff);
	draw_nodes(app);
	draw_path(app, context(app)->end_node);
	SDL_RenderPresent(app->renderer);
}

void print_distances()
{
	printf("DISTANCES\n");
	for (int i = 0; i < no_of_nodes; i++){
		printf("%d - %d\n", i, nodes[i].distance);
	}
	printf("\n");
}

bool touches_node(int x, int y, node_t* n)
{
	return ((abs(x - n->x) < 2 * n->halfwidth) && (abs(y - n->y) < 2 * n->halfheight));
}

void update_touched_node(Application* app, int mouse_x, int mouse_y)
{
	for (int i = 0; i < no_of_nodes; i++){
		if (touches_node(mouse_x, mouse_y, &(nodes[i]))) {
			context(app)->touched_node = &nodes[i];
			return;
		}
	}
	context(app)->touched_node = NULL;
}


//SDL_Keycode is an enum
//I don't bother with modifiers currently, check docu for e->key.keysym
void key_handling(Application* app, SDL_Keycode keycode)
{
	switch(keycode){
	//case SDLK_ESCAPE:
	case SDLK_q:
		app->should_quit = true;
		break;
	case SDLK_p:
		printf("ADJ LISTS:\n");
		for (int i = 0; i < no_of_nodes; i++){
			print_adj_list(app, nodes + i);
		}
		printf("\n");
		break;
	//wipe all
	case SDLK_d: //delete
		no_of_nodes = 0;
		break;

	case SDLK_b: //bfs
		bfs(nodes + 0, nodes, no_of_nodes);
		print_distances();
		break;
	case SDLK_s: //start
		int x, y;
		SDL_GetMouseState(&x, &y);
		update_touched_node(app, x, y);
		node_t* touched_node = context(app)->touched_node;
		if (touched_node == NULL) break;
		context(app)->start_node = touched_node;
		bfs(context(app)->start_node, nodes, no_of_nodes); //change of source requires recomputing paths
		break;
	case SDLK_g: //goal
	case SDLK_e: //end
		SDL_GetMouseState(&x, &y);
		update_touched_node(app, x, y);
		touched_node = context(app)->touched_node;
		if (touched_node == NULL) break;
		context(app)->end_node = touched_node;
		break;
	case SDLK_w:
		save_node_array(nodes, no_of_nodes, no_of_edges, "test.txt");
		break;
	default:
		print_error("key pressed but don't care.\n");
		break;
	}
}

void node_set_defaults(int index)
{
	nodes[index].halfwidth = 5;
	nodes[index].halfheight = 5;
	nodes[index].r = 0xff;
	nodes[index].g = 0xff;
	nodes[index].b = 0xff;
	nodes[index].adj_list = NULL;
	nodes[index].key = index;
}

void event_handling(Application* app, SDL_Event* e)
{
	switch(e->type){
		case SDL_QUIT:
			app->should_quit = true;
			break;
		case SDL_KEYDOWN:
			(*app->key_handling)(app, /*SDL_Keycode (enum)*/ e->key.keysym.sym);
			break;
		case SDL_MOUSEBUTTONDOWN:
			int x, y;
			SDL_GetMouseState(&x, &y);
			update_touched_node(app, x, y);
			node_t* touched_node = context(app)->touched_node;
			if (e->button.button == SDL_BUTTON_LEFT){
				//(*app->mouse_handling)(app, x, y)
				if (no_of_nodes >= 100 - 1){
					print_error("Too many nodes!");
					break;
				}
				nodes[no_of_nodes].x = x;
				nodes[no_of_nodes].y = y;
				nodes[no_of_nodes].name = no_of_nodes;
				node_set_defaults(no_of_nodes);
				context(app)->touched_node = nodes + no_of_nodes;
				no_of_nodes++;
				bfs(context(app)->start_node, nodes, no_of_nodes);
			} else if (e->button.button == SDL_BUTTON_RIGHT && touched_node != NULL) {
				if (context(app)->edge_half_chosen){
					if (context(app)->edge_start_node == touched_node) break;
					add_to_adj_list(context(app)->edge_start_node, touched_node);
					context(app)->edge_half_chosen = false;
					context(app)->edge_start_node = NULL;
					bfs(context(app)->start_node, nodes, no_of_nodes);
					no_of_edges++;
				} else {
					context(app)->edge_start_node = touched_node;
					context(app)->edge_half_chosen = true;
				}
			}
			break;
		case SDL_MOUSEMOTION:
			SDL_GetMouseState(&x, &y);
			update_touched_node(app, x, y);
			break;
	}
}

void shutdown(Application* app){}

int main()
{
	Application app;
	app.startup = &startup;
	app.render = &render;
	app.event_handling = &event_handling;
	app.key_handling = &key_handling;
	app.shutdown = &shutdown;

	run(&app);
	return 0;
}

