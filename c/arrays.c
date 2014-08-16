#include <stdio.h>

int main()
{
	int x, y;
	int array[8][8];

	for (x = 0; x < 8; x++) {
		for (y = 0; y < 8; y++) {
			array[x][y] = x * y;
		}
	}

	printf("ArrayIndices: \n");
	for (x = 0; x < 8; x++) {
		for (y = 0; y < 8; y++) {
			printf("[%d][%d]=%d\n", x, y, array[x][y]);
		}
		printf("\n");
	}
	getchar();
}