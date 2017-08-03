;    _________________
;  //                 \\
; || HOW TO COMPILE IT ||
;  \\_________________//
;
; ------    x86   ------
; nasm -f elf family.asm
; ld -s -o family family.asm
;
; ------  x86_64  ------
; nasm -f elf64 family.asm
; ld -s -o family family.asm
;
; ------ COMPILER ------
; ./compiler.sh family
; ./compiler.sh family.asm family
;
; --    Always x86   ---
; nasm -f elf family.asm
; ld -m elf_i386 -s -o family family.o
;
;    _________________
;  //                 \\
; ||    DESCRIPTION    ||
;  \\_________________//
;
;  Write different names
;  with similar surnames
;
; LEVEL:    03
; ASM:      NASM
; ENVS:     Linux
; AUTHOR:   CosasDePuma
; DATE:     August, 3rd 2017

section .data
    name:   db 'Arya Stark',0xA
    name_l: equ $-name

section .text
    global _start

_start:
; PRINT Arya's name
    mov eax, 4
    mov ebx, 1
    mov ecx, name
    mov edx, name_l
    int 80h

; CHANGE the name using indirect addresses
    mov [name], DWORD 'John'

; PRINT John's name
    mov eax, 4
    mov ebx, 1
    mov ecx, name
    mov edx, name_l
    int 80h

; EXIT the program
    mov eax, 1
    int 80h