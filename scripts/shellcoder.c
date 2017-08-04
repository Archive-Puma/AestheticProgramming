/*     _________________     */
/*   //                 \\   */
/*  || HOW TO COMPILE IT ||  */
/*   \\_________________//   */
/*                           */

// gcc shellcoder.c -o shellcoder -fno-stack-protector -z execstack -no-pie -m32

#include <stdio.h>
#include <string.h>

unsigned char code[] = \
"\xeb\x20\x66\x31\xc0\x66\x31\xdb\x66\x31\xd2\x66\x31\xc9\xb0\x04\xb3\x01\x66\x59\xb2\x07\xcd\x80\x66\x31\xc0\xb0\x01\x66\x31\xdb\xcd\x80\xe8\xdd\xff\x48\x65\x6c\x6c\x6f\x21\x0a";
// "\x31\xc0\x50\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x50\x89\xe2\x53\x89\xe1\xb0\x0b\xcd\x80";

int main(int argc, char **argv)
{
    //printf("Shellcode Length:  %d\n", strlen(code));
    int (*execute)() = (int(*)())code;
	execute();
}