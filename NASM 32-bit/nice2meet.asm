;    _________________
;  //                 \\
; || HOW TO COMPILE IT ||
;  \\_________________//
;
; ------    x86   ------
; nasm -f elf nice2meet.asm
; ld -s -o nice2meet nice2meet.asm
;
; ------  x86_64  ------
; nasm -f elf64 nice2meet.asm
; ld -s -o nice2meet nice2meet.asm
;
; ------ COMPILER ------
; ./compiler.sh nice2meet
; ./compiler.sh nice2meet.asm nice2meet
;
; --    Always x86   ---
; nasm -f elf nice2meet.asm
; ld -m elf_i386 -s -o nice2meet nice2meet.o
;
;    _________________
;  //                 \\
; ||    DESCRIPTION    ||
;  \\_________________//
;
; Nice2Meet is an improved
; "Hello World!"
;
; LEVEL:    02
; ASM:      NASM 32-bit
; ENVS:     Linux
; AUTHOR:   CosasDePuma
; DATE:     August, 3rd 2017


section .data                           ; CONSTANTS
    question:   db "What's your name? " ; question
    question_l: equ $-question          ; question lenght
    response:   db "Nice to meet you, " ; response
    response_l: equ $-response          ; response lenght

section .bss                            ; VARIABLES
    name:   resb 255                    ; name variable

section .text                           ; CODE
    global _start                       ; set _start as main function

_start:                                 ; define _start function
; PRINT QUESTION
    mov eax, 4                          ; eax=4 >> sys_write
    mov ebx, 1                          ; ebx=1 >> in stdout
    mov ecx, question                   ; set message to print
    mov edx, question_l                 ; set lenght of the message
    int 80h                             ; execute command (call kernel)

; READ INPUT
    mov eax, 3                          ; eax=3 >> sys_read
    mov ebx, 0                          ; ebx=0 >> from stdin
    mov ecx, name                       ; set locaton to save
    mov edx, 255                        ; set maximum lenght
    int 80h                             ; execute command (call kernel)

; PRINT RESPONSE
    mov eax, 4                          ; eax=4 >> sys_write
    mov ebx, 1                          ; ebx=1 >> in stdout
    mov ecx, response                   ; set message to print
    mov edx, response_l                 ; set lenght of the message
    int 80h                             ; execute command (call kernel)
    
; PRINT NAME
    mov eax, 4                          ; eax=4 >> sys_write
    mov ebx, 1                          ; ebx=1 >> in stdout
    mov ecx, name                       ; set message to print
    mov edx, 255                        ; set lenght of the message
    int 80h                             ; execute command (call kernel)

; AVOIDING SEGMENTATION ERROR
    mov eax, 1                          ; EXIT: EAX=1
    mov ebx, 0                          ; EXIT: EBX=Exit Status
    int 80h                             ; execute command (call kernel)