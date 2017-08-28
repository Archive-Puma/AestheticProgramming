;    _________________
;  //                 \\
; || HOW TO COMPILE IT ||
;  \\_________________//
;
; -------- x86 ---------
; nasm -f elf exitcall.asm
; ld -s -o exitcall.elf exitcall.asm
;
; ----- Always x86 -----
; nasm -f elf exitcall.asm
; ld -m elf_i386 -s -o exitcall.elf exitcall.o
;
;    _________________
;  //                 \\
; ||   DUMP HEX CODE   ||
;  \\_________________//
;
; ------ ObjDump ------
; objdump -d ./exitcall.elf
;
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
; DATE:     August, 28th 2017
;
;    _________________
;  //                 \\
; ||     SHELLCODE    ||
;  \\_________________//
;
; "\x31\xc0\x31\xdb\xb0\x01\xcd\x80"

[BITS 32]

sys_exit equ 1

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

    xor eax, eax
    xor ebx, ebx
    mov al,  sys_exit
    int 80h

    ; Here is the hex code ...
    ;
    ; 08048060 <.text>:
    ;  8048060:       31 c0                   xor    %eax,%eax
    ;  8048062:       31 db                	  xor    %ebx,%ebx
    ;  8048064:	      b0 01                	  mov    $0x1,%al
    ;  8048066:	      cd 80                	  int    $0x80
    ;
    ; ... without null chars!


