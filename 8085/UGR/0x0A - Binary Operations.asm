; Locate code in this address
.org E000h

; Set a value in the Accumulator
MVI A,EAh

; Set 0Fh mask in B Register and
; set F0h mask in C Register
LXI B,0FF0h

; Binary AND with Accumulator
ANI 8Fh ; 8Ah
ANA B   ; 0Ah

; Binary OR with Accumulator
ORI 44h ; 4Eh
ORA C   ; FEh

; Binary XOR with Accumulator
XRI FFh ; 01h
XRA A   ; 00h

; Stop the program
HLT
