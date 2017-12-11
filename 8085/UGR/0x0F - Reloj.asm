; Bits correspondientes
; al display 7 segmentos
;
;          b
;        -----
;       |     |
;     a |     | c
;       |-----|
;       |  d  | g
;     e |     |
;        ----- o h
;          f
;

; Locate code in this address
.org E000h

; Program
 CALL CLEAR
BUCLE:
 CALL DELAY
 CALL SHOW
 JMP BUCLE

; Locate subrutines in this address
.org C0DEh

; Initializate Registers and Segments
CLEAR:
  LXI B,DA7Ah
  LXI D,DA7Bh
  LXI H,DA7Bh
  LDAX B
  OUT 07h
  OUT 06h
  ORI 80h  ; Include h-bit to turn on the dot
  OUT 05h
  INX B
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

; Show less-significant seconds
SHOW:
  LDAX B
  CPI 00h
  JZ SEC
  OUT 07H
  INX B
  RET

; Modify more-significant seconds
SEC:
  LXI B,DA7Ah
  LDAX B
  OUT 07h
  INX B
  LDAX D
  CPI 7Bh
  JZ MIN
  OUT 06H
  INX D
  RET

; Modify minutes
MIN:
  LXI D,DA7Ah
  LDAX D
  OUT 06h
  INX D
  MOV A,M
  CPI 00h
  JZ FIN
  ORI 80H
  OUT 05H
  INX H
  RET

; Stop the program
FIN:
  HLT

; Numbers in the display
.data DA7Ah
  cero:   db 77h
  uno:    dB 44h
  dos:    dB 3Eh
  tres:   dB 6Eh
  cuatro: dB 4Dh
  cinco:  dB 6Bh
  seis:   db 7Bh
  siete:  db 46h
  ocho:   db 7Fh
  nueve:  db 4Fh
          db 00h
