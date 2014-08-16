// hello world
#include <stdio.h>

int mult ( int x, int y);

int main()
{
	int this_is_a_number;
	int a, age;
	int k = 0;
	int j = 0;
	int x, y;
	
	printf("Hello World!\n");

	// printf("Please enter a number: ");
	// scanf("%d", &this_is_a_number);
	// printf("You entered %d \n", this_is_a_number);

	/* Modifying variables */
	// printf("Modifying variables\n");
	// a = 4 * 6;
	// printf("%d\n", a);
	// a = a + 5;
	// printf("%d\n", a);
	// printf("%d\n", a == 5);
	// printf("%d\n", a > 5);
	// printf("%d\n", a < 5);

	/* If Statements */
	// printf("%s\n", "If statements");

	// if (5 < 10)
	// 	printf ("Five is now less than ten\n");

	// printf( "Please enter your age: " );
	// scanf("%d", &age);
	// if (age < 100) {
	// 	printf("You are pretty young!\n");
	// }
	// else if (age == 100) {
	// 	printf("You are old\n");
	// }
	// else {
	// 	printf("You are really old\n");
	// }

	/* Loops */
	// for (x=0; x < 10; x++) {
	// 	printf("%d\n", x);
	// }

	// while (k < 10) {
	// 	printf("%d\n", k);
	// 	k++;
	// }

	// do {
	// 	printf("Hello, world\n");
	// } while (j != 0);

	/* Functions */
	printf("Please input two numbers to be multipled: \n");
	scanf("%d", &x);
	scanf("%d", &y);
	printf("The product of your two numbers is %d\n", mult(x,y) );

	getchar();

	return 0;
}

int mult (int x, int y)
{
	return x * y;
}
