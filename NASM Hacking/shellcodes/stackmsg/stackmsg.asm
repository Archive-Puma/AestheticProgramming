;    _________________
;  //                 \\
; || HOW TO COMPILE IT ||
;  \\_________________//
;
; -------- x86 ---------
; nasm -f elf stackmsg.asm
; ld -s -o stackmsg.elf stackmsg.asm
;
; ----- Always x86 -----
; nasm -f elf stackmsg.asm
; ld -m elf_i386 -s -o stackmsg.elf stackmsg.o
;
;    _________________
;  //                 \\
; ||   DUMP HEX CODE   ||
;  \\_________________//
;
; ------ ObjDump ------
; objdump -d ./stackmsg.elf
;
;    _________________
;  //                 \\
; ||    DESCRIPTION    ||
;  \\_________________//
;
;     Print a message
;     using the stack
;
; LEVEL:    01
; ASM:      NASM
; ENVS:     Linux (Hacking)
; AUTHOR:   CosasDePuma
; DATE:     August, 28th 2017
;
;    _________________
;  //                 \\
; ||     SHELLCODE    ||
;  \\_________________//
;
; "\xeb\x19\x31\xc0\x31\xdb\x31\xc9\x31\xd2\xb0\x04\xb3\x01\x59\xb2\x0e\xcd\x80\x31\xc0\xb0\x01\x31\xdb\xcd\x80\xe8\xe2\xff\xff\xff\x46\x75\x63\x6b\x20\x53\x75\x6e\x64\x61\x79\x73\x21\x0a"

[BITS 32]

[SECTION .text]
global _start

; Our variables, like the message, must be in the shellcode
; We can't use the .bss or .data section in this case, but
; we can get the variables using calls and the stack

_start:
    jmp short _trick

_main:
    ; clean all registers
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx

    ; print msg
    ; avoid null chars using 8-low bit regs
    mov al, 4
    mov bl, 1
    ; get the msg popping the stack
    pop ecx
    mov dl, 14
    int 80h

    ; exit function
    xor eax, eax
    xor ebx, ebx
    mov al, 1
    int 80h

_trick:
    call _main
    db "Fuck Sundays!", 0xA

