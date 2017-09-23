// Set the Memory Address with HL Register

MVI H, BE
MVI L, EF

// Initialize a Loop Counter (we can use any Register)

MVI C, 05

// Set a value to the Accumulator

 MVI A, FF

// Set the Label and do the Loop
; LABEL: - A Label can be used to name an address

LOOP:
MOV M,A
INR L

// Modify the Loop Counter

DCR C

// Check if the Counter is equal to Zero
; JNZ (C2 xx xx) - Jump Not Zero: Jump if the Zero Flag is not set to the Address (Little Endian)

JNZ LOOP

// Stop the program

HLT