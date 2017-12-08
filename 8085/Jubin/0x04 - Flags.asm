; Starter Point
#begin E000h

; Locate code in this address
#org E000h

; Load some value in the Accumulator
MVI A,F0h

; CY - Carry Flag: If the number we got is higher than 2 BYTES (Example: FF + 10 -> 00 + CY)
ADI 11h

; AC - Auxiliary Carry Flag: If the less important byte of the number we got is higher than a BYTE (Example: 1F + 01 -> 20 + AC)
ADI 0Fh

; P - Parity Flag: If the number of 0s or 1s in the Accumulator is even (Examples: 0000b 0011b 0101b)
ADI 04h

; Z - Zero Flag: If the number we got is Zero (Z bit always activate P bit)
SUI 14h

; S- Sign Flag: If the number we got is negative (Example: 00 - 01 -> FF + S)
SUI 02h

; Stop the program
HLT

; End Code Section
#end
