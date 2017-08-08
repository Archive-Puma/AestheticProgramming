;    _________________
;  //                 \\
; || HOW TO COMPILE IT ||
;  \\_________________//
;
; ------  x86_64  ------
; nasm -f elf64 ifelse.asm
; ld -s -o ifelse ifelse.o
;
;    _________________
;  //                 \\
; ||    DESCRIPTION    ||
;  \\_________________//
;
;       Example of
;   If - Else statement
;
; LEVEL:    03
; ASM:      NASM 64-bit
; ENVS:     Linux
; AUTHOR:   CosasDePuma
; DATE:     August, 8rd 2017

[BITS 64]                                   ; BITS directive to specify 64-bit code

section	.data                               ; CONSTANTS
    true_msg    db "It's true", 0xA         ; true message
    true_msg_l  equ $ - true_msg            
    
    false_msg   db "It's false", 0xA        ; false message
    false_msg_l equ $ - false_msg           
    
    number      db 9                        ; number to compare
    
section .bss                                ; VARIABLES
; MACROS are multi-line %define
; %macro shortcut_name num_of_params
;   ... code here ...
;   %1 = first param,
;   %2 = second param
; %endmacro

; sys_write : show msg in stdout
; params : message, message_lenght
    %macro sys_write 2
        mov rax, 1
        mov rdi, 1
        mov rsi, %1
        mov rdx, %2
        syscall
    %endmacro
    
; sys_exit : exit the program
; params : exit_status_code
    %macro sys_exit 1
        mov rax, 60
        mov rdi, %1
        syscall
    %endmacro

section	.text
	global _start

_start:
; if (number >= 10)
    mov eax, [number]                       ; compare the content of the number
    cmp eax, 10
    jae _true
    jmp _false

; if true
_true:
    sys_write true_msg, true_msg_l
    jmp _exit

; else
_false:
    sys_write false_msg, false_msg_l
    jmp _exit
    
_exit:
    sys_exit    0