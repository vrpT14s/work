#include <stdio.h>
#include <stdbool.h>

bool check_colour(float x, float y)
{
	int max = 10000;
	float x1 = 0;
	float y1 = 0;
	for (int i = 0; i < max; i++){
		//z = z^2 + c
		x1 = x1*x1 - y1*y1 + x;
		y1 = 2*x1*y1 + y;
		if (x1*x1 + y1*y1 > 4) {
			return 1;
		}
	}
	return 0;
}

char output[100][100];

int main()
{
	for (int i = 0; i < 100; i++){
		for (int j = 0; j < 100; j++){
			output[i][j] = check_colour((float)j/100, (float) i/100) ? '#' : ' ';
			printf("%c", output[i][j]);
		}
		printf("\n");
	}
	return 0;
}

