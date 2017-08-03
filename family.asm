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

section .data                   ; CONSTANTS
    name:   db 'Arya Stark',0xA ; name to display
    name_l: equ $-name          ; lenght of the name

section .text                   ; CODE
    global _start               ; set _start as main function

_start:                         ; define _start function
; PRINT Arya's name
    mov eax, 4                  ; sys_write
    mov ebx, 1                  ; stdout
    mov ecx, name               ; text to show
    mov edx, name_l             ; lenght of text
    int 80h                     ; call kernel

; CHANGE the name
    mov [name], DWORD 'John'    ; change name using indirect addresses

; PRINT John's name
    mov eax, 4                  ; sys_write
    mov ebx, 1                  ; stdout
    mov ecx, name               ; text to show
    mov edx, name_l             ; lenght of text
    int 80h                     ; call kernel

; EXIT the program
    mov eax, 1
    int 80h