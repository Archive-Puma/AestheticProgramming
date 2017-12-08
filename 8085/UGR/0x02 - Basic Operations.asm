; Locate code in this address
.org E000h

; Setting the value of some Registers
MVI H,BEh
MVI L,EFh

; Operate with the Accumulator
ADD H
SUB L

ADI 30h
SUI FFh

; INR - Increment Register by one
INR A

; DCR - Decrement Register by one
DCR A

; Stop the program
HLT
