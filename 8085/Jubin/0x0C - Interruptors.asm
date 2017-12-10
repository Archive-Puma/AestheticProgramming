; Starter Point
#begin E000h

; Locate code in this address
#org E000h

; Get the interruptors state
IN 00H

; Move it into some low-registry
MOV C,A

; Push it into the Stack
PUSH B

; Modify flags from top of the Stack
POP PSW

; Stop the program
HLT

; End Code Section
#end
