#include <stdio.h>

int main()
{
	char msg[8] = "Hello.\n";
	write(1, msg, 80);
	printf();
	return 0;
}

