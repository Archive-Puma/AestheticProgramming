; Locate code in this address
.org E000h

; Set a LED patron
MVI A,AAh

; Call the subrutines
BUCLE:
  CALL LED
  CALL DELAY
  JMP BUCLE

; Locate subrutines in this address
.org C0DEh

; Create LED subrutine
LED:
; Switch the lights LEDs
  XRI FFh
  OUT 00h
  RET

; One second delay
DELAY:
  PUSH B
  MVI B,4BH
  L1: MVI C,FFH
  L2: DCR C
  JNZ L2
  DCR B
  JNZ L1
  POP B
  RET
