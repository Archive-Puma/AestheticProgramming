#include <string.h>

int main() {

    // define constants
	char* str = "Hello World\n";
	long len = strlen(str);
	int ret = 0;

    /*
    __asm__("assembly code"
            "more asm code"
            : "=g"(exit_status)
            : "g"(const %1), "g"(const %2)...);
    */

	__asm__("movq $1, %%rax \n\t"
            "movq $1, %%rdi \n\t"
            "movq %1, %%rsi \n\t"
            "movl %2, %%edx \n\t"
            "syscall"
            : "=g"(ret)
            : "g"(str), "g" (len));

	return 0;
}