/*     _________________     */
/*   //                 \\   */
/*  || HOW TO COMPILE IT ||  */
/*   \\_________________//   */
/*                           */

// gcc shellcoder.c -o shellcoder -fno-stack-protector -z execstack -no-pie -m32

#include <stdio.h>
#include <string.h>

unsigned char code[] = \
"SHELLCODE HERE";

int main(int argc, char **argv)
{
    //printf("Shellcode Length:  %d\n", strlen(code));
    int (*ret)() = (int(*)())code;
	ret();
}