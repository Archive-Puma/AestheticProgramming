; Starter Point
#begin E000h

; Locate code in this address
#org E000h

; Set the Memory Address with HL Register
LXI H,BEEFh

; Initialize a Loop Counter (we can use any Register)
; C Register is usually used for this
MVI C,05h

; Set a value to the Accumulator
 MVI A,FFh

; Set the Label and do the Loop
; LABEL: - A Label can be used to name an address
LOOP:
  MOV M,A
  INX H

; Modify the Loop Counter
DCR C

; Check if the Counter is equal to Zero
; JNZ (C2 xx xx) - Jump Not Zero: Jump if the Zero Flag is not set to the Address (Little Endian)
JNZ LOOP

; Stop the program
HLT

; End Code Section
#end
