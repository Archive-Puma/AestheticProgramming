;    _________________
;  //                 \\
; || HOW TO COMPILE IT ||
;  \\_________________//
;
; ------  x86_64  ------
; nasm -f elf64 meaning.asm
; ld -s -o meaning meaning.o
;
;    _________________
;  //                 \\
; ||    DESCRIPTION    ||
;  \\_________________//
;
; Modify the registry content
;  using indirect directions
;
; LEVEL:    04
; ASM:      NASM 64-bit
; ENVS:     Linux
; AUTHOR:   CosasDePuma
; DATE:     August, 8rd 2017

[BITS 64]

section .data
    name    db 'Pink Panter', 0xA
    name_l  equ $ - name
    
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
    sys_write   name, name_l
    mov [name + 5], DWORD 'Panz'  ; modify the following 4 bits in
                                  ; [name + 5] direction
                                  ;
                                  ; P I N K   P A N T E R
                                  ; ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^
                                  ; | | | | | | | | | | |
                                  ; 0 1 2 3 4 5 6 7 8 9 10
                                  ;           (______)
                                  ;       4-bit [name + 5]
    sys_write   name, name_l
    sys_exit    0