;    _________________
;  //                 \\
; || HOW TO COMPILE IT ||
;  \\_________________//
;
; -------   x86  -------
; nasm -f elf nice2meet.asm
; ld -s -o nice2meet nice2meet.asm
;
; ------- x86_64 -------
; nasm -f elf64 nice2meet.asm
; ld -s -o nice2meet nice2meet.asm
;
;    _________________
;  //                 \\
; ||    DESCRIPTION    ||
;  \\_________________//
;
; Nice2Meet is an improved
; "Hello World!"
;
; LEVEL:    01
; ASM:      NASM
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
    global _main                        ; set _main as main function

_main:
; PRINT QUESTION
    mov eax, 4                          ; WRITE: EAX=4
    mov ebx, 1                          ; WRITE: EBX=1
    mov ecx, question                   ; set message to print
    mov edx, question_l                 ; set lenght of the message
    int 80h                             ; end command

; READ INPUT
    mov eax, 3                          ; READ: EAX=3
    mov ebx, 0                          ; READ: EBX=0
    mov ecx, name                       ; set locaton to save
    mov edx, 255                        ; set maximum lenght
    int 80h                             ; end command

; PRINT RESPONSE
    mov eax, 4                          ; WRITE: EAX=4
    mov ebx, 1                          ; WRITE: EBX=1
    mov ecx, response                   ; set message to print
    mov edx, response_l                 ; set lenght of the message
    int 80h                             ; end command
    
; PRINT NAME
    mov eax, 4                          ; WRITE: EAX=4
    mov ebx, 1                          ; WRITE: EBX=1
    mov ecx, name                       ; set message to print
    mov edx, 255                        ; set lenght of the message
    int 80h                             ; end command

; AVOIDING SEGMENTATION ERROR
    mov eax, 1                          ; EXIT: EAX=1
    mov ebx, 0                          ; EXIT: EBX=Exit Status
    int 80h                             ; end command