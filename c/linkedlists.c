#include <stdlib.h>
#include <stdio.h>

struct node {
	int val;
	struct node *next;
};

int main()
{
	struct node *head;
	// points to each node as it traverses the list
	struct node *conductor;

	head = malloc(sizeof(struct node));
	head->next = 0;
	head->val = 12;

	conductor = head;

	if(conductor != 0)
	{
		while(conductor->next != 0)
		{
			conductor = conductor->next;
		}
	}

	conductor->next = malloc(sizeof(struct node));

	conductor = conductor->next;

	if (conductor == 0)
	{
		printf("Out of memory\n");
		return 0;
	}

	conductor->next = 0;
	conductor->val = 42;

	conductor = head;
	if (conductor != 0) {
		printf("%d\n", conductor->val);
		conductor = conductor->next;
	}
	printf("%d\n", conductor->val);


	return 0;
}