;    _________________
;  //                 \\
; || HOW TO COMPILE IT ||
;  \\_________________//
;
; -------- x86 ---------
; nasm -f elf exitcall.asm
; ld -s -o exitcall exitcall.asm
;
; ------- x86_64 -------
; nasm -f elf64 exitcall.asm
; ld -s -o exitcall exitcall.asm
;
; ------ COMPILER ------
; ./compiler.sh exitcall
; ./compiler.sh exitcall.asm exitcall
;
; ----- Always x86 -----
; nasm -f elf exitcall.asm
; ld -m elf_i386 -s -o exitcall exitcall.o
;
;    _________________
;  //                 \\
; ||   DUMP HEX CODE   ||
;  \\_________________//
;
; ------ ObjDump ------
; objdump -d ./exitcall
;    _________________
;  //                 \\
; ||    DESCRIPTION    ||
;  \\_________________//
;
;   Improving exit_call
;  to execute shellcodes
;
; LEVEL:    00
; ASM:      NASM
; ENVS:     Linux (Hacking)
; AUTHOR:   CosasDePuma
; DATE:     August, 4rd 2017

SYS_EXIT    equ 1
EXIT_CODE   equ 0

[SECTION .text]
global _start

_start:
    ; Normal Exit Call is as follows ...
    ;
    ; mov eax, SYS_EXIT
    ; mov ebx, EXIT_CODE
    ; int 80h
    ;
    ; ... with the following hex code, ...
    ;
    ; 08048060 <.text>:
    ;  8048060:       b8 01 00 00 00          mov    $0x1,%eax
    ;  8048065:       bb 00 00 00 00          mov    $0x0,%ebx
    ;  804806a:       cd 80                   int    $0x80
    ;
    ; ... but the next one avoids null characters

    mov al, 1
    xor ebx, ebx
    int 80h

    ; Here is the hex code ...
    ;
    ; 08048060 <.text>:
    ;  8048060:       b0 01                   mov    $0x1,%al
    ;  8048062:       31 db                   xor    %ebx,%ebx
    ;  8048064:       cd 80                   int    $0x80
    ;
    ; ... without null chars!


