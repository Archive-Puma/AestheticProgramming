#include <stdio.h>
#include <windows.h>

int main(int argc, char *argv[])
{
	if (IsDebuggerPresent())
	{
		fprintf(stderr, "Debugger detected! Closing program!\n");
		return 1;
	}

	fprintf(stdout, "Good job!");
	return 0;
}

