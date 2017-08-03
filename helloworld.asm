;    _________________
;  //                 \\
; || HOW TO COMPILE IT ||
;  \\_________________//
;
; ------    x86   ------
; nasm -f elf helloworld.asm
; ld -s -o helloworld helloworld.asm
;
; ------  x86_64  ------
; nasm -f elf64 helloworld.asm
; ld -s -o helloworld helloworld.asm
;
; ------ COMPILER ------
; ./compiler.sh helloworld
; ./compiler.sh helloworld.asm helloworld
;
;    _________________
;  //                 \\
; ||    DESCRIPTION    ||
;  \\_________________//
;
; The NASM "Hello, World!"
;
; LEVEL:    00
; ASM:      NASM
; ENVS:     Linux
; AUTHOR:   CosasDePuma
; DATE:     August, 3rd 2017


section .data                           ; CONSTANTS
    message:   db "Hello, World!",10    ; message + new line (10)
    message_l: equ $-message            ; message lenght

section .text                           ; CODE
    global _start                       ; set _start as main function

_start:                                 ; define _start function
; PRINT message
    mov eax, 4                          ; WRITE: EAX=4
    mov ebx, 1                          ; WRITE: EBX=1
    mov ecx, message                    ; set message to print
    mov edx, message_l                  ; set lenght of the message
    int 80h                             ; end command

; AVOIDING SEGMENTATION ERROR
    mov eax, 1                          ; EXIT: EAX=1
    mov ebx, 0                          ; EXIT: EBX=Exit Status
    int 80h                             ; end command