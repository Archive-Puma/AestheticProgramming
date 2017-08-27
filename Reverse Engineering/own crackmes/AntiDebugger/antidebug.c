#include <stdio.h>
#include <sys/ptrace.h>

int main(int argc, char *argv[])
{
	if (ptrace (PTRACE_TRACEME, 0, 1, 0) < 0)
	{
		fprintf(stderr, "Debugger detected! Closing program!\n");
		return 1;
	}

	fprintf(stdout, "Good job!\n");
	return 0;
}

