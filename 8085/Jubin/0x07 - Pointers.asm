; Starter Point
#begin E000h

; Locate code in this address
#org E000h

; Save some value in the Memory
MVI A,FFh
STA BEEFh

; Set some Memory Addresses in the BC and DE Registers
LXI B,BEEFh
LXI D,DEADh

; Copy in the Accumulator the value of the Memory Address that is stored in the BC Register
; LDAX -Indirect Load in the Accumulator of the value stored in the Address referred to in the Register (B = BC Register)
LDAX B

; Store the value of the Accumulator in the Memory Address that is stored in the DE Register
; STAX - Indirect Storage of the Accumulator in the Address stored in the Registry (D = DE Register)
STAX D

; Stop the program
HLT

; End Code Section
#end
