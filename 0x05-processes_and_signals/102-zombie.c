#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

/**
 * infinite_while - runs an inginite loop
 *
 * Return: always 0
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - entry point
 *
 * Return: always 0
 */
int main(void)
{
	int i;
	pid_t pid = 1;

	for (i = 0; i < 5; i++)
	{
		pid = fork();
		if (pid > 0) /* if main process */
			printf("Zombie process created, PID: %d\n", pid);
		else /* if child, break */
			break;
	}

	infinite_while();
	return (0);
}
