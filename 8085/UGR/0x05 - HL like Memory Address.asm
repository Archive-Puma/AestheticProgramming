; Locate code in this address
.org E000h

; Load a value in BEEF Memory Address
MVI A,12h
STA BEEFh

; Set the Memory Address with HL Register
; HL - Pointer to a Memory Address
MVI H,BEh
MVI L,EFh
; --or--
LXI H,BEEFh

; Copy the value of the Memory Address in the Accumulator (Similar to LDA BEEF because BEEF is the value of the HL Register)
MOV A,M

; Modify the value
SUI 13h

; Increment the Memory Address Pointer
INX H

; Store the new value in the Memory Address (Similar to STA BEF0 because BEF0 is the value of the HL Register)
MOV M,A

; Stop the program
HLT