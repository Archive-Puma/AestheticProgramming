; Starter Point
#begin E000h

; Locate code in this address
#org E000h

; MVI - Set the value of a Register
MVI A,DBh
MVI B,EEh
MVI C,AEh
MVI D,DFh

; MOV - Copy the value of a Register to another
MOV E,A
MOV H,B
MOV L,C
MOV M,D

; HLT (76) - Stop the program
HLT

; End Code Section
#end
