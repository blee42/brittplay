#include <stdio.h>

struct database {
	int id_number;
	int age;
	float salary;
};

struct xampl {
	int x;
};

int main()
{
	struct database employee;
	struct xampl structure;
	struct xampl *ptr;
	{
		/* data */
	};

	employee.age = 22;
	employee.id_number = 1;
	employee.salary = 12000.21;

	structure.x = 12;
	ptr = &structure;

	printf("%d\n", ptr->x );
}

