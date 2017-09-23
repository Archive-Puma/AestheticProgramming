// Save some value in the Memory

MVI A,FF
STA BEEF

// Set some Memory Addresses in the BC and DE Registers

MVI B,BE
MVI C,EF

MVI D,DE
MVI E,AD

// Copy in the Accumulator the value of the Memory Address that is stored in the BC Register
; LDAX -Indirect Load in the Accumulator of the value stored in the Address referred to in the Register (B = BC Register) 

LDAX B

// Store the value of the Accumulator in the Memory Address that is stored in the DE Register
; STAX - Indirect Storage of the Accumulator in the Address stored in the Registry (D = DE Register)

STAX D

// Stop the program

HLT