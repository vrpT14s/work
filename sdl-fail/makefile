OBJS = main.c lib/app.c
OBJ_NAME = main
CC = gcc
DEBUG_COMPILER_FLAGS = -g -Wimplicit-function-declaration
COMPILER_FLAGS = -O3
LINKER_FLAGS = -lSDL2 -lm

debug: $(OBJS)
	$(CC) $(OBJS) $(DEBUG_COMPILER_FLAGS) $(LINKER_FLAGS) -o $(OBJ_NAME)
all: $(OBJS)
	$(CC) $(OBJS) $(COMPILER_FLAGS) $(LINKER_FLAGS) -o $(OBJ_NAME)
