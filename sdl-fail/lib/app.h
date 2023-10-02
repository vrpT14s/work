#pragma once
#include <SDL2/SDL.h>
#include <stdio.h>
#include <unistd.h>
#include <stdbool.h>

#define SCREEN_WIDTH 640
#define SCREEN_HEIGHT 480

typedef struct Application {
	void (*startup)(struct Application*);
	void (*render)(struct Application*);
	void (*shutdown)(struct Application*);
	void (*event_handling)(struct Application*, SDL_Event*);
	void (*key_handling)(struct Application*, SDL_Keycode);
	//int width, height;
	void* user_pointer;

//protected:
	//set to null at startup
	SDL_Window* window;
	SDL_Renderer* renderer;
	SDL_Surface* screen_surface;
	bool should_quit;
} Application;


void init_sdl(Application* app);
void close_sdl(Application* app);

void init_app(Application* app);
int run(Application* app);
void print_error(const char* msg);

