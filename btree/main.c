#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#define MAX_BRANCHES 20
//MIN_BRANCHES := MAX_BRANCHES / 2

typedef struct node_t {
	bool is_leaf;
	int no_of_keys;
	int key[MAX_BRANCHES - 1];
	struct node_t* child[MAX_BRANCHES];
} node_t;

typedef struct { node_t* root; } btree_t;


//dummy function to simulate real disk read
//supposed to bring a page-size to memory, and the size of node_t struct should be the same so no wasted reading
int total_disk_reads = 0;
void disk_read(void* address_to_read) { total_disk_reads++; }
void print_disk_reads() { printf("\nTOTAL DISK READS - %d\n", total_disk_reads); }
int total_disk_writes = 0;
void disk_write(void* address_to_write) { total_disk_writes++; }
void print_disk_writes() { printf("\nTOTAL DISK WRITES - %d\n", total_disk_writes); }



//TODO: explain that leaves are one step above lowest

//assuming node already in ram
node_t* search_node(node_t* node, int key)
{
	//sets i to index of lub of key or last index + 1 (same if you include -/+ inf like the book does)
	//returns if key found in keylist
	int i;
	for (i = 0; (i < node->no_of_keys) && (key > node->key[i]); i++){
		if (key == node->key[i]) return node;
	};
	if (node->is_leaf) return NULL;
	disk_read(node->child[i]);
	return search_node(node->child[i], key);
}

node_t* search_node_while(node_t* node, int key)
{
	node_t* z = node;
	while (true){
		int i;
		for (i = 0; (i < node->no_of_keys) && (key > z->key[i]); i++){
			if (key == z->key[i]) return z;
		};
		if (z->is_leaf) return NULL;
		z = z->child[i];
		disk_read(z);
	}
}

btree_t* create_empty_btree()
{
	node_t* root = malloc(sizeof(node_t));
	root->is_leaf = true;
	root->no_of_keys = 0;
	disk_write(root);
	btree_t* bt = malloc(sizeof(btree_t));
	bt->root = root;
	return bt;
}

//assuming both node and child in memory
//and child is full
//and parent isn't full
void split_child(node_t* parent, int child_index)
{
#ifdef DEBUG
	if (parent->no_of_keys >= MAX_BRANCHES - 1){
		printf("split_child: parent should not be full\n");
		exit(1);
	}
	if (parent->child[child_index]->no_of_keys < MAX_BRANCHES){
		printf("split_child: cannot split un-full node\n");
		exit(1);
	}
#endif /*DEBUG*/

	//make place for new index in parent
	for (int i = parent->no_of_keys - 1; i >= child_index; i--){
		parent->child[i+1] = parent->child[i];
		parent->key[i] = parent->key[i-1];
	}
	parent->no_of_keys++;
	//parent->child[child_index] = NULL;
	//parent->key[child_index] = NULL;

	node_t* child = parent->child[child_index];
	//max_branches should be even
	int median_index = (MAX_BRANCHES / 2) - 1;
	parent->key[child_index] = child->key[median_index];

	node_t* second_child = allocate_new_node();
	second_child->no_of_keys = median_index;
	for (int i = 0; i < median_index; i++){
		second_child->key[i] = child->key[i + median_index];
		second_child->child[i] = child->child[i+median_index-1];
	}
}

//assuming node in memory and not full
void insert_key_into_node(node_t* node, int key)
{

}

//node_t*

int main()
{
	printf("Hello all.\n");
	return 0;
}

