#include <SDL2/SDL.h>
#include <stdio.h>
#include <unistd.h>
#include <stdbool.h>

#define SCREEN_WIDTH 1280
#define SCREEN_HEIGHT 900

const char* image_path = "test.bmp";

SDL_Window* window = NULL;
SDL_Surface* screen_surface = NULL;
SDL_Surface* image_surface = NULL;
SDL_Renderer* renderer = NULL;

void print_error(const char* msg) {
	fprintf(stderr, "%s - Error: %s\n", msg, SDL_GetError());
}
void init_sdl() {
	if (SDL_Init(SDL_INIT_VIDEO) < 0) {
		print_error("SDL initialization failed.");
		exit(1);
	}
	window = SDL_CreateWindow("Test Window", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_SHOWN);
	if (window == NULL) {
		print_error("Window creation failed.");
		exit(1);
	}

	renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED );
	if( renderer == NULL ) {
		print_error("Renderer could not be created!");
		exit(1);
	}
	screen_surface = SDL_GetWindowSurface(window);
}
void color_window(int r, int g, int b) {
	SDL_FillRect(screen_surface, NULL, SDL_MapRGB(screen_surface->format, r, g, b));
	//SDL_UpdateWindowSurface(window);
}
void close_sdl() {
	SDL_FreeSurface(image_surface);
	image_surface = NULL;
	SDL_DestroyWindow(window);
	window = NULL;
	SDL_Quit();
}

void load_image()
{
	image_surface = SDL_LoadBMP(image_path);
	if (image_surface == NULL){
		printf("BMP \"%s\" failed to load.\n", image_path);
		print_error("");
	}
}

void draw_lines()
{
	SDL_RenderDrawLine(renderer, 10, 10, SCREEN_WIDTH, SCREEN_HEIGHT);
	SDL_Rect rect = {300, 200, 230, 250};
	SDL_RenderFillRect(renderer, &rect);
	print_error("");
}

int main(int argc, char** argv)
{
	init_sdl();

	load_image();

	SDL_Event e;
	int r = 100, g = 100, b = 100;
	bool quit = false;
	SDL_SetRenderDrawColor(renderer, 0xFF, 0x00, 0xF1, 0x2F );
	while (!quit){
		while (SDL_PollEvent(&e) != 0){
			if (e.type == SDL_QUIT){
				quit = true;
				continue;
			} else if (e.type == SDL_KEYDOWN) {
				switch(e.key.keysym.sym){
					case SDLK_f:
						r++;
						//color_window(r, g, b);
						//SDL_UpdateWindowSurface(window);
						break;
					default:
						//quit = true;
						break;
				}
			} else if( e.type == SDL_MOUSEMOTION || e.type == SDL_MOUSEBUTTONDOWN || e.type == SDL_MOUSEBUTTONUP ) {
				int x, y;
				SDL_GetMouseState( &x, &y );
				if (x != 0){
					r++;
			//		SDL_UpdateWindowSurface(window);
				}
			}
		}

		SDL_SetRenderDrawColor(renderer, r, g,b,0xff );
		draw_lines();
		//SDL_UpdateWindowSurface(window);
		SDL_RenderPresent(renderer);
		//print_error("Test.");
	}

	//sleep(10);
	printf("Hello all.\n");

	close_sdl();
	return 0;
}

