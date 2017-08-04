;    _________________
;  //                 \\
; || HOW TO COMPILE IT ||
;  \\_________________//
;
; ------    x86   ------
; nasm -f elf calculator.asm
; ld -s -o calculator calculator.asm
;
; ------  x86_64  ------
; nasm -f elf64 calculator.asm
; ld -s -o calculator calculator.asm
;
; ------ COMPILER ------
; ./compiler.sh calculator
; ./compiler.sh calculator.asm calculator
;
; --    Always x86   ---
; nasm -f elf calculator.asm
; ld -m elf_i386 -s -o calculator calculator.o
;
;    _________________
;  //                 \\
; ||    DESCRIPTION    ||
;  \\_________________//
;
;     One digit adder
; with labels and constants
;
; LEVEL:    03
; ASM:      NASM 32-bit
; ENVS:     Linux
; AUTHOR:   CosasDePuma
; DATE:     August, 3rd 2017

STDIN       equ 0                       ; DEFINED CONSTANTS
STDOUT      equ 1
SYS_EXIT    equ 1
SYS_READ    equ 3
SYS_WRITE   equ 4
CALL_KERNEL equ 80h

INPUT_L     equ 2

section .data                           ; CONSTANTS
    msg1:   db 'Enter a number: '       ; first message
    msg1_l: equ $-msg1                  ; lengh of first message

    msg2:   db 'Enter another number: ' ; second message
    msg2_l: equ $-msg2                  ; lenght of second message

    msg3:   db 'The sum is: '           ; third message
    msg3_l: equ $-msg3                  ; lenght of third

    br:     db 0xA,0                    ; End of line

section .bss                            ; VARIABLES
    nmbr1:  resb INPUT_L                ; first input number
    nmbr2:  resb INPUT_L                ; second input number
    result: resb INPUT_L                ; result

section .text                           ; CODE
    global _start                       ; set _start as main function

_start:                                 ; define _start function
; PRINT the first message
    mov eax, SYS_WRITE                  
    mov ebx, STDOUT
    mov ecx, msg1
    mov edx, msg1_l
    int CALL_KERNEL

; SCAN the first number
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, nmbr1
    mov edx, INPUT_L
    int CALL_KERNEL

; PRINT the second message
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg2
    mov edx, msg2_l
    int CALL_KERNEL

; SCAN the second number
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, nmbr2
    mov edx, INPUT_L
    int CALL_KERNEL

; SUM the numbers
    mov eax, [nmbr1]
    mov ebx, [nmbr2]
    sub eax, '0'
    sub ebx, '0'
    add eax, ebx
    add eax, '0'
    mov [result], eax

; PRINT the third message
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg3
    mov edx, msg3_l
    int CALL_KERNEL

; PRINT the result
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, result
    mov edx, INPUT_L
    int CALL_KERNEL

; PRINT the end of line
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, br
    mov edx, INPUT_L
    int CALL_KERNEL

; EXIT the program
    mov eax, SYS_EXIT
    int CALL_KERNEL