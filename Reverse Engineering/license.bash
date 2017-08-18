#! /bin/bash

echo -e '\033[0;32m[x] Writing   "license.c" program in ./out\033[0m'
mkdir out 2>/dev/null
cat << PROGRAM > out/license.c
#include <stdio.h>
#include <string.h>

int main (int argc, char *argv[])
{
if (argc != 2)
        printf("Usage: ./license <key>\n");
else {
    if(strcmp(argv[1],"MSTR.KEY-AA12"))
        printf("WRONG KEY!\n");
    else
        printf("CONGRATS!\n");
}
return 0;
}
PROGRAM

echo -e '\033[0;32m[x] Compiling "license.c" usign gcc. Command: gcc -o license license.c\033[0m'
gcc -o out/license out/license.c

echo -e "\033[0;35m"
cat << HOWTO
  ______________________________________
//                                      \\\\
||  HOW TO FIND KEY LICENSE VALIDATION   ||
\\\\______________________________________//

HOWTO
echo -e "\033[0m"

echo -e '\033[0;32m[0] Use a text reader to view the binary file in ascii\033[0m'
cat out/license > out/license.ascii

echo -e '\033[0;32m[1] Use "strings" command to view only alphanumeric and important strings in the binary file\033[0m'
strings out/license > out/license.str

echo -e '\033[0;32m[2] Use "hexdump" command to view hex and ascii code from binary file\033[0m'
hexdump -C out/license > out/license.hex

echo -e '\033[0;34m[?] KEY LICENSE: MSTR.KEY-AA12\033[0m'

echo -e "\033[0;35m"
cat << HOWTO
  ______________________________________
//                                      \\\\
|| HOW TO BYPASS KEY LICENSE VALIDATION ||
\\\\______________________________________//

HOWTO
echo -e "\033[0m"

echo -e '\033[0;32m[0] Executing "license" without arguments and checking output. Command: ./license\033[0m'
./out/license

echo -e '\033[0;32m[1] Executing "license" with a bad key and checking output. Command: ./license BAD.KEY-AA12\033[0m'
./out/license BAD.KEY-AA12

echo -e '\033[0;32m[2] Executing "license" with the good key and checking output. Command: ./license MSTR.KEY-AA12\033[0m'
./out/license MSTR.KEY-AA12

echo -e '\033[0;34m[?] Now we are trying to disassemble the binary file and get the "CONGRATS!" message without the good key\033[0m'

echo -e '\033[0;32m[3] Dumping the ASM code in ./out/license.dump. Command: objdump -d license > license.dump\033[0m'
objdump -d out/license > out/license.dump

cat << CMD > out/commands.txt
set disassembly-flavor intel
run
break *0x000000000040059f
run BAD-KEY.WW12
ni
ni
ni
ni
run BAD-KEY.WW12
set \$eax=0
ni
ni
ni
ni
q
y
CMD

echo -e '\033[0;32m[4] Debugging binary file with "gdb". Command: gdb -q license < commands.txt\033[0m'
gdb -q out/license < out/commands.txt
