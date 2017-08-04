/*     _________________     */
/*   //                 \\   */
/*  || HOW TO COMPILE IT ||  */
/*   \\_________________//   */
/*                           */

// gcc shellcoder.c -o shellcoder -fno-stack-protector -z execstack -no-pie -m32
// gcc shellcoder.c -o shellcoder -fno-stack-protector -z execstack -no-pie -m64

#include <stdio.h>
#include <string.h>

unsigned char code[] = \
"\xb8\x01\x00\x00\x00\xbf\x01\x00\x00\x00\x48\x69\x21\x0a\xba\x04\x00\x00\x00\x0f\x05";
// "\x31\xc0\x50\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x50\x89\xe2\x53\x89\xe1\xb0\x0b\xcd\x80";

int main(int argc, char **argv)
{
    //printf("Shellcode Length:  %d\n", strlen(code));
    int (*execute)() = (int(*)())code;
	execute();
}