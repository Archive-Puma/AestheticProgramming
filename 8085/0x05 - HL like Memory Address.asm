// Load a value in 00FF Memory Address

MVI A, 12
STA BEEF

// Set the Memory Address with HL Register
; HL - Pointer to a Memory Address

MVI H, BE
MVI L, EF

// Copy the value of the Memory Address in the Accumulator (Similar to LDA BEEF because BEEF is the value of the HL Register)

MOV A,M

// Modify the value

SUI 13

// Store the new value in the Memory Address (Similar to STA BEEF because BEEF is the value of the HL Register)

MOV M,A

// Stop the program

HLT