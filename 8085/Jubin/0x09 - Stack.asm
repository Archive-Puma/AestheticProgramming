; Starter Point
#begin E000h

; Locate code in this address
#org E000h

; Set a BC value
LXI B,CAFEh

; Push BC in the top of the Stack
PUSH B

; Call a subrutine (and automatically push
; the return address in the top of the stack)
CALL SUBRUTINE

; Pop BC value from the top of the Stack
POP B

; Set Z and P flags
MOV A,B
CPI CAh

; Push current flags to the top of the Stack
PUSH PSW

; Change current flags
CPI FEh

; Restore Z and P flags from the top of the Stack
POP PSW

; Stop the program
HLT


; Locate subrutines in this address
#org C0DEh
SUBRUTINE:

; Pop return address from the top of the Stack
  POP B

; Pop BC value from top of the Stack
  POP D

; Modify the Stack Pointer (SP) to point BC value
  DCX SP
  DCX SP

; Push return address from the top of the Stack
  PUSH B

; Return and pop address from top of the Stack
  RET

; End Code Section
#end
