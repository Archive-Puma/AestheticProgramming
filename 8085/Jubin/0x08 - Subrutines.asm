; Starter Point
#begin E000h

; Locate code in this address
#org E000h

; Call the subrutines
CALL CLEAR
CALL VALUES

; Stop the program
HLT

; Locate subrutines in this address
.org AAAAh

; Create CLEAR subrutine
CLEAR:
  XRA A
  LXI B,0000H
  LXI D,0000H
  LXI H,0000H
  RET

; Create VALUES subrutine
VALUES:
  MVI A,12h
  LXI B,CAFEh
  LXI D,CEB0h
  LXI H,B0CAh
  RET

; End Code Section
#end
