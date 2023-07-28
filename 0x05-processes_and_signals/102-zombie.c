#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int main(void)
{
	int i;
	pid_t pid = 1;

	for (i = 0; i <= 5; i++)
	{
		if (pid > 0)
			pid = fork();
		else if (pid == 0)
		{
			printf("Zombie process created, PID: %d\n", getpid());
			while (1)
				;
		}
	}

	return (0);
}
