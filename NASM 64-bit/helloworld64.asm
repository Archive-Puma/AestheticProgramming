;    _________________
;  //                 \\
; || HOW TO COMPILE IT ||
;  \\_________________//
;
; ------  x86_64  ------
; nasm -f elf64 helloworld64.asm
; ld -s -o helloworld64 helloworld64.o
;
;    _________________
;  //                 \\
; ||    DESCRIPTION    ||
;  \\_________________//
;
; The NASM "Hello, World!"
;
; LEVEL:    00
; ASM:      NASM 64-bit
; ENVS:     Linux
; AUTHOR:   CosasDePuma
; DATE:     August, 3rd 2017

section .data
    msg:    db 'Hello, 64-bit World!', 0Ah
    msg_l:  equ $-msg

section .text
    global _start

_start:
;     PRINT
; =============
; rax - sys_write (1)
; rdi - file descriptor
; rsi - text
; rdx - lenght of the text
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, msg_l
    syscall

;     EXIT
; =============
; rax - sys_exit (60)
; rdi - exit status
    mov rax, 60
    mov rdi, 0
    syscall