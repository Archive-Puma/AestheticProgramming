; Starter Point
#begin E000h

; Locate code in this address
#org E000h

; Load a value in the Accumulator
MVI A,FFh

; STA - Store the Accumulator value in a Memory Address
STA BEEFh

; Clear the Accumulator
ANI 00h

; LDA - Load a Memory Address value in the Accumulator
LDA BEEFh

; HLT - Stop the program
HLT

; End Code Section
#end
