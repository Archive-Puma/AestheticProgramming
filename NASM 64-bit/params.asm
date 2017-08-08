;    _________________
;  //                 \\
; || HOW TO COMPILE IT ||
;  \\_________________//
;
; ------  x86_64  ------
; nasm -f elf64 params.asm
; ld -s -o params params.o
;
;    _________________
;  //                 \\
; ||    DESCRIPTION    ||
;  \\_________________//
;
;  Get the program name and
; the command-line arguments
;
; LEVEL:    05
; ASM:      NASM 64-bit
; ENVS:     Linux
; AUTHOR:   CosasDePuma
; DATE:     August, 8rd 2017

[BITS 64]

section .data
    wrong_msg   db 'You need to write ONLY one console, param',0xA
    wrong_l     equ $ - wrong_msg
    
    name        db 'Program name: '
    name_l      equ $ - name
    
    arg         db 'Argument: '
    arg_l       equ $ - arg
    
    br          db 0xA
    
section .bss
    %macro sys_write 2
        mov rax, 1
        mov rdi, 1
        mov rsi, %1
        mov rdx, %2
        syscall
    %endmacro

    %macro sys_exit 1
        mov rax, 60
        mov rdi, %1
        syscall
    %endmacro
    
section .text
    global _start
    
_start:

;   =STACK
;  _________
; |  argc   | << Number of arguments
; |_________|
; | argv[0] | << Program name
; |_________|
; | argv[1] | << First argument
; |_________|
; |   ...   |
; |         |

    pop rsi
    cmp rsi, 2
    jne wrong
    
    sys_write   name, name_l
    pop rsi
    sys_write   rsi, 7
    sys_write   br, 1
    
    sys_write   arg, arg_l
    pop rsi
    sys_write   rsi, 3
    sys_write   br, 1
    jmp exit
    
    wrong: sys_write wrong_msg, wrong_l
    exit: sys_exit    0