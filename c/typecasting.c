#include <stdio.h>

int main() 
{
	printf("%c\n", (char)65 );

	for(int x = 0; x < 128; x++) {
		printf("%d - %c\n", x, (char)x );
	}

	int age = 10;
	int pain_visits = 52;

	float visits_per_year = (float)pain_visits / age;

	printf("%f\n", visits_per_year );
	getchar();
}