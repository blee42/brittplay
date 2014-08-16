#include <stdio.h>

int main()
{
	int x;
	int *p;

	p = &x;
	printf("Enter a number: \n");
	scanf("%d", &x);
	printf("%d\n", *p );

	getchar();
}