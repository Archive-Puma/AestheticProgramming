;    _________________
;  //                 \\
; || HOW TO COMPILE IT ||
;  \\_________________//
;
; ------    x86   ------
; nasm -f elf even.asm
; ld -s -o even even.asm
;
; ------  x86_64  ------
; nasm -f elf64 even.asm
; ld -s -o even even.asm
;
; ------ COMPILER ------
; ./compiler.sh even
; ./compiler.sh even.asm even
;
; --    Always x86   ---
; nasm -f elf even.asm
; ld -m elf_i386 -s -o even even.o
;
;    _________________
;  //                 \\
; ||    DESCRIPTION    ||
;  \\_________________//
;
;     Check if is an
;    even or odd digit
;
; LEVEL:    04
; ASM:      NASM
; ENVS:     Linux
; AUTHOR:   CosasDePuma
; DATE:     August, 3rd 2017

STDIN       equ 0                       ; DEFINED CONSTANTS
STDOUT      equ 1
SYS_EXIT    equ 1
SYS_READ    equ 3
SYS_WRITE   equ 4
CALL_KERNEL equ 80h

section .data                           ; CONSTANTS
    msg1:   db 'Write a digit: '        ; first message
    msg1_l: equ $-msg1                  ; lenght of the first message

    even:   db 'The digit is EVEN',10   ; message when it's is even
    even_l: equ $-even                  ; lenght of even message

    odd:    db 'The digit is ODD',10   ; message when it's is odd
    odd_l:  equ $-odd                   ; lenght of odd message

    chcker: db 1                        ; digit one checks if it's even or odd

section .bss                            ; VARIABLES
    digit: resb 2                       ; input digit

section .text                           ; CODE
    global _start                       ; set _start as main function

_start:                                 ; define _start function
; PRINT the first message
    mov eax, SYS_WRITE                  
    mov ebx, STDOUT
    mov ecx, msg1
    mov edx, msg1_l
    int CALL_KERNEL

; SCAN the digit
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, digit
    mov edx, 2
    int CALL_KERNEL

; CHECK if is EVEN or ODD
    mov ax, [digit]
    and ax, [chcker]
    jz  _even
    jmp  _odd

; EVEN SEGMENT
    _even:
        mov eax, SYS_WRITE                  
        mov ebx, STDOUT
        mov ecx, even
        mov edx, even_l
        int CALL_KERNEL
        jmp  _exit

; ODD SEGMENT
    _odd:
        mov eax, SYS_WRITE                  
        mov ebx, STDOUT
        mov ecx, odd
        mov edx, odd_l
        int CALL_KERNEL

; EXIT SEGMENT
    _exit:
        mov eax, SYS_EXIT
        int CALL_KERNEL