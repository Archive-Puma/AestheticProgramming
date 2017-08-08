;    _________________
;  //                 \\
; || HOW TO COMPILE IT ||
;  \\_________________//
;
; ------  x86_64  ------
; nasm -f elf64 nice2meet64.asm
; ld -s -o nice2meet64 nice2meet64.o
;
;    _________________
;  //                 \\
; ||    DESCRIPTION    ||
;  \\_________________//
;
; The NASM "Hello, World!"
;  with SYS_READ function
;
; LEVEL:    02
; ASM:      NASM 64-bit
; ENVS:     Linux
; AUTHOR:   CosasDePuma
; DATE:     August, 8rd 2017

[BITS 64]                                   ; BITS directive to specify 64-bit code

section	.data                               ; CONSTANTS
    msg     db 'Who are you?: '             ; message
    msg_l   equ $ - msg                     ; lenght of the message
    
    nice    db 'Nice to meet you, '         ; response
    nice_l  equ $ - nice                    ; response lenght
    
section .bss                                ; VARIABLES
    name    resb 10                         ; res space to name var
    
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
    
; sys_read : read from stdin
; params : var, max_lenght
    %macro  sys_read 2
        xor rax, rax
        xor rdi, rdi
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
    sys_write   msg, msg_l
    sys_read    name, 10
    sys_write   nice, nice_l
    sys_write   name, 10
    sys_exit    0