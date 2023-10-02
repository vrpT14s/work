#include <ncurses.h>

int main()
{
	initscr();
	noecho();


	printw("Hello all.\n\nYeah, we gaming.");
	refresh();
	getch();
	printw("Test all.\n\nYeah, we gaming.");
	refresh();
	getch();
	endwin();

	return 0;
}

