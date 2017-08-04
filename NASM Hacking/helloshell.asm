;    _________________
;  //                 \\
; || HOW TO COMPILE IT ||
;  \\_________________//
;
; -------- x86 ---------
; nasm -f elf helloshell.asm
; ld -s -o helloshell helloshell.asm
;
; ------- x86_64 -------
; nasm -f elf64 helloshell.asm
; ld -s -o helloshell helloshell.asm
;
; ------ COMPILER ------
; ./compiler.sh helloshell
; ./compiler.sh helloshell.asm helloshell
;
; ----- Always x86 -----
; nasm -f elf helloshell.asm
; ld -m elf_i386 -s -o helloshell helloshell.o
;
;    _________________
;  //                 \\
; ||   DUMP HEX CODE   ||
;  \\_________________//
;
; ------ ObjDump ------
; objdump -d ./helloshell
;
;    _________________
;  //                 \\
; ||    DESCRIPTION    ||
;  \\_________________//
;
;      Print messages
;  without null characters
;
; LEVEL:    01
; ASM:      NASM
; ENVS:     Linux (Hacking)
; AUTHOR:   CosasDePuma
; DATE:     August, 4rd 2017

[SECTION .text]                 ; CODE
global _start                   ; set _start as main function

_start:                         ; define start
        jmp short _beggining    ; jump to _beggining

_shellcode:
; CLEAN UP the registers
        xor eax, eax            ; XOR avoid null chars
        xor ebx, ebx
        xor edx, edx
        xor ecx, ecx

; PRINT the message using 8-bit lower registers
        mov al, 4               ; sys_write
        mov bl, 1               ; stdout
        pop ecx                 ; get the message using stack
        mov dl, 14              ; length of the message
        int 0x80                ; call kernel

; EXIT the shellcode
        xor eax, eax            
        mov al, 1               ; clean up the accumulator
        xor ebx, ebx            ; exit status
        int 0x80                ; call kernel

_beggining:
        call _shellcode	        ; put the address of the string on the stack
        db 'Hello, Shell!',0xA  ; the string
