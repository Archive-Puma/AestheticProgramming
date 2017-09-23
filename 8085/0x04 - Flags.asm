// Load some value in the Accumulator

MVI A, F0

; CY - Carry Flag: If the number we got is higher than 2 BYTES (Example: FF + 10 -> 00 + CY)

ADI 11

; AC - Auxiliary Carry Flag: If the less important byte of the number we got is higher than a BYTE (Example: 1F + 01 -> 20 + AC)

ADI 0F

; P - Parity Flag: If the number of 0s or 1s in the Accumulator is even (Examples: 0000b 0011b 0101b)

ADI 01
ADI 01
ADI 02

; Z - Zero Flag: If the number we got is Zero (Z bit always activate P bit)

SUI 14

; S- Sign Flag: If the number we got is negative (Example: 00 - 01 -> FF + S)

SUI 02

// Stop the program

HLT