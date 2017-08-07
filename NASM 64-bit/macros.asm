;    _________________
;  //                 \\
; || HOW TO COMPILE IT ||
;  \\_________________//
;
; ------  x86_64  ------
; nasm -f elf64 macros.asm
; ld -s -o macros macros.o
;
;    _________________
;  //                 \\
; ||    DESCRIPTION    ||
;  \\_________________//
;
; The NASM "Hello, World!"
;   using defined macros
;
; LEVEL:    01
; ASM:      NASM 64-bit
; ENVS:     Linux
; AUTHOR:   CosasDePuma
; DATE:     August, 7rd 2017

[BITS 64]                                   ; BITS directive to specify 64-bit code

section	.data                               ; CONSTANTS
    msg db 'Hello, World!', 0xA             ; message
    msg_l equ $ - msg                       ; lenght of the message
    
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
    sys_write   msg, msg_l
    sys_exit    0