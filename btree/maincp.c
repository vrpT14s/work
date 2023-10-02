#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#define MAX_BRANCHES 20
//MIN_BRANCHES := MAX_BRANCHES / 2

typedef struct {
	bool leaf;
	int no_of_keys;
	int keys[MAX_BRANCHES - 1];
	struct node_t* children[MAX_BRANCHES];
} node_t;

typedef struct {
	node_t* root;
} btree_t;

node_t* search_node(node_t* node, int key)
{
	for (int i = 0;
	    (i < node->no_of_keys) && (node->keys[i] < key);
	    i++);
	//i is the first key that is larger than our search key,
	//or it's the last key + 1
	//(we can imagine this value as +infinity)
	//either way we go to the left of it
	return search_node(node->children[i], key);
}

int main()
{
	printf("Hello all.\n");
	return 0;
}

