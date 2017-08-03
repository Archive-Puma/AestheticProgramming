;    _________________
;  //                 \\
; || HOW TO COMPILE IT ||
;  \\_________________//
;
; ------    x86   ------
; nasm -f elf pattern.asm
; ld -s -o pattern pattern.asm
;
; ------  x86_64  ------
; nasm -f elf64 pattern.asm
; ld -s -o pattern pattern.asm
;
; ------ COMPILER ------
; ./compiler.sh pattern
; ./compiler.sh pattern.asm pattern
;
; --    Always x86   ---
; nasm -f elf pattern.asm
; ld -m elf_i386 -s -o pattern pattern.o
;
;    _________________
;  //                 \\
; ||    DESCRIPTION    ||
;  \\_________________//
;
;  Show a String pattern
;
; LEVEL:    02
; ASM:      NASM
; ENVS:     Linux
; AUTHOR:   CosasDePuma
; DATE:     August, 3rd 2017

section .data                           ; CONSTANTS
    msg:    db 'Showing a pattern:',0xA ; message to show
    msg_l:  equ $-msg                   ; lenght of message
    patt:   times 9 db '* - *',10       ; pattern repeated a few times
    patt_l: equ $-patt                  ; full pattern lenght

section .text                           ; CODE
    global _start                       ; set _start as main function

_start:                                 ; define _start function
; PRINT msg
    mov eax, 4                          ; sys_write
    mov ebx, 1                          ; stdout
    mov ecx, msg                        ; text to show
    mov edx, msg_l                      ; text lenght
    int 80h                             ; call kernel

; PRINT pattern
    mov eax, 4                          ; sys_write
    mov ebx, 1                          ; stdout
    mov ecx, patt                       ; text to show
    mov edx, patt_l                     ; text lenght
    int 80h                             ; call kernel

; EXIT the program
    mov eax, 1                          ; sys_exit
    int 80h                             ; call_kernel