#include <stdio.h>
#include <string.h>

void strip_newline(char *str, int size)
{
	int i;

	for (i=0; i < size; i++) {
		if (str[i] == '\n') {
			str[i] = '\0';
			return;
		}
	}
}


int main()
{
	char string[256];
	char name[50];
	char lastname[50];
	char fullname[100];

	printf("Please enter a long string: \n");

	fgets(string, 256, stdin);
	printf("You entered a very long string %s\n", string );

	printf("Please enter your name: \n");
	fgets(name, 50, stdin);
	strip_newline(name, 50);

	if (strcmp(name, "Alex") == 0) {
		printf("That's my name too\n");
	}
	else {
		printf("That's not my name\n");
	}

	printf("Your name is %lu letters long\n", strlen(name));
	printf("Enter your last name: \n");
	fgets(lastname, 50, stdin);
	strip_newline(lastname, 50);

	fullname[0] = '\0';
	strcat(fullname, name);
	strcat(fullname, " ");
	strcat(fullname, lastname);
	printf("Your full name is %s\n", fullname );

	getchar();

	return 0;
}
