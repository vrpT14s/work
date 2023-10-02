#include <stdio.h>
#include <math.h>
#include <stdbool.h>
#include <assert.h>
#include <unistd.h>

typedef struct link_t {
	struct link_t* next;
	void* data;
	//float weight;
} link_t;

typedef enum {WHITE, GRAY, BLACK} color_t;

typedef struct node_t {
	link_t* adj_list;
	int x, y, halfwidth, halfheight;
	char r,g,b;
	int name;
	int key;

	color_t color;
	struct node_t* parent;
	int distance;
} node_t;


/*
Here is the idea:
First save all the adj lists, using a (link_t*)[no_of_nodes] array to save what it should be later, starting from zero...?
We do it this way so it can be one pass, so we can mmap the correct amount of memory later. The other buffer can be whatever
size you'd like, it can be on stack, as long as of course it's divisible by sizeof(link_t). Hmm. Okay, so pseudocode:

open file
*/
void save_node_array(node_t* nodes, int no_of_nodes, int no_of_edges, const char* pathname)
{
       FILE *fp = fopen(pathname, "w");
       if (fp == NULL){
	       fprintf(stderr, "Error opening %s. Does it exist?\n", pathname);
	       exit(1);
       }
       size_t bytes_written = fwrite(nodes, sizeof(node_t), no_of_nodes, fp);
       if (byte_writtens != no_of_nodes*sizeof(node_t)){
	       fprintf(stderr, "save_node_array: Error writing to %s.\n", pathname);
	       exit(1);
       }
       link_t** adj_list_addresses = (link_t**) malloc(no_of_nodes * sizeof(link_t*));
       link_t fwrite_buffer[64];
       int buffer_index = 0
       size_t current_addr = 0;
       for (int i = 0; i < no_of_nodes; i++){
	       adj_list_addresses[i] = current_addr;
	       for (link_t* l = nodes[i]->adj_list; l != NULL; l = l->next){
		       fwrite_buffer[buffer_index] = *l;
		       current_addr += sizeof(link_t);
		       if (++buffer_index >= 64){
			       size_t bytes_written = fwrite(fwrite_buffer,
					       sizeof(link_t),
					       buffer_index,
					       fp);
			       if (bytes_written != buffer_index * sizeof(link_t)){
				       fprintf(stderr, "Error writing into %s.\n", pathname);
				       exit(1);
			       }
			       buffer_index = 0;
		       }
	       }
	}
       size_t bytes_written = fwrite(fwrite_buffer,
		       sizeof(link_t),
		       buffer_index,
		       fp);
       if (bytes_written != buffer_index * sizeof(link_t)){
	       fprintf(stderr, "Error writing into %s.\n", pathname);
	       exit(1);
       }
       truncate(pathname, current_addr + no_of_nodes * sizeof(node_t));
}

link_t* make_new_link(void* data)
{
	link_t* new_link = malloc(sizeof(link_t*));
	new_link->next = NULL;
	new_link->data = data;
	return new_link;
}

//adds node2 to node1's adj list
void add_to_adj_list(node_t* n, node_t* adj)
{
	link_t* new_link = make_new_link(adj);
	new_link->next = n->adj_list;
	n->adj_list = new_link;
}

typedef struct queue_link_t{
	struct queue_link_t* next;
	node_t* node;
} queue_link_t;

typedef struct queue_t{
	queue_link_t* front;
	queue_link_t* back;
} queue_t;

queue_link_t* make_queue_link(node_t* node)
{
	queue_link_t* ql = (queue_link_t*) malloc(sizeof(queue_link_t));
	ql->next = NULL;
	ql->node = node;
	return ql;
}

void enqueue(queue_t* queue, node_t* node)
{
	queue_link_t* new_link = make_queue_link(node);
	if (queue->front == NULL) {
		assert(queue->back == NULL);
		queue->front = new_link;
	} else {
		queue->back->next = new_link;
	}
	queue->back = new_link;
}

node_t* dequeue(queue_t* queue)
{
	if (queue->front == NULL){
		assert(queue->back == NULL);
		return NULL;
	}
	queue_link_t* link_to_be_freed = queue->front;
	node_t* first_node = queue->front->node;
	queue->front = queue->front->next;
	if (queue->front == NULL) queue->back = NULL;
	free(link_to_be_freed);
	return first_node;

}

queue_t* make_new_queue()
{
	queue_t* new_queue = malloc(sizeof(queue_t));
	new_queue->front = NULL;
	new_queue->back = NULL;
	return new_queue;
}

bool is_queue_empty(queue_t* queue)
{
	assert((queue->front == NULL) == (queue->back == NULL));
	return (queue->front == NULL);
}

void print_queue(queue_t* queue)
{
	if (queue->front == NULL) {
		printf("[]\n");
		return;
	}
	printf("[");
	queue_link_t* l;
	for (l = queue->front; l->next != NULL; l = l->next)
	{
		printf("%d, ", l->node->name);
	}
	//assert(l == queue->back);
	printf("%d]\n", l->node->name);
}

void bfs(node_t* source, node_t* nodes, int no_of_nodes)
{
	printf("bfs search happened\n");
	if (source == NULL) return;
	for (int i = 0; i < no_of_nodes; i++){
		nodes[i].color = WHITE;
		nodes[i].parent = NULL;
		nodes[i].distance = -1;
	}

	queue_t* queue = make_new_queue();
	source->color = GRAY;
	source->parent = NULL;
	source->distance = 0;
	enqueue(queue, source);

	while (true){
		print_queue(queue);
		node_t* n = dequeue(queue);
		if (n == NULL) break;
		for (link_t* l = n->adj_list; l != NULL; l = l->next){
			node_t* neighbour = (node_t*) l->data;
			if (neighbour->color != WHITE) continue;
			neighbour->color = GRAY;
			neighbour->parent = n;
			neighbour->distance = n->distance + 1;
			enqueue(queue, neighbour);
		}
	}
	free(queue);
}

