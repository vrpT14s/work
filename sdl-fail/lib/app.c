#include "app.h"
#include <SDL2/SDL.h>
#include <stdio.h>
#include <unistd.h>
#include <stdbool.h>

void init_sdl(Application* app)
{
	if (SDL_Init(SDL_INIT_VIDEO) < 0) {
		print_error("SDL initialization failed.");
		exit(1);
	}
	app->window = SDL_CreateWindow("Test Window", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_SHOWN);
	if (app->window == NULL) {
		print_error("Window creation failed.");
		exit(1);
	}

	app->renderer = SDL_CreateRenderer(app->window, -1, SDL_RENDERER_ACCELERATED);
	if(app->renderer == NULL ) {
		print_error("Renderer could not be created!");
		exit(1);
	}
	//app->screen_surface = SDL_GetWindowSurface(app->window);
}

void init_app(Application* app)
{
	app->window = NULL;
	app->renderer = NULL;
	app->screen_surface = NULL;
	app->should_quit = false;
}

void close_sdl(Application* app)
{
	SDL_DestroyWindow(app->window);
	SDL_DestroyRenderer(app->renderer);
	SDL_Quit();
}

int run(Application* app)
{
	init_app(app);
	init_sdl(app);
	(*app->startup)(app);

	SDL_Event e;
	while (!(app->should_quit)){
		while (SDL_PollEvent(&e) != 0){
			(*app->event_handling)(app, &e);
		}
		(*app->render)(app);
	}
	(*app->shutdown)(app);
	close_sdl(app);

	printf("Program done.\n");
	return 0;
}

void print_error(const char* msg) {
	fprintf(stderr, "%s - Error: %s\n", msg, SDL_GetError());
}

