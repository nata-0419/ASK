CALL 2A
CALL 7
CALL 4A

ORG 7
MOV BL,70
MOV CL,40
Petla2:
MOV AL, [BL]
CMP AL, 60
JS Zmien
Wroc:
INC BL
DEC CL
CMP CL,0
JNZ Petla2
JMP Koniec7
Zmien:
ADD AL,20
MOV [BL], AL
JMP Wroc
Koniec7:
RET

ORG 2A
MOV BL, 70
MOV CL,0
Rep:
IN 00 ; Czekaj na nacisniecie klawisza - zapisz jego kod w AL.
CMP AL,0D ; Czy to byl klawisz Enter? (ASCII 0D)
JZ Koniec20
MOV [BL], AL
INC BL
INC CL
CMP CL,40
JNZ Rep
MOV BL, 70
JMP Rep
Koniec20:
RET

ORG 4A
MOV BL, 70
MOV CL, C0
MOV AL,0
Petla:
MOV DL, [BL]
MOV [CL], DL
INC CL
INC BL
CMP DL,0
JZ Koniec
CMP AL,3F
JZ Koniec
INC AL
JMP Petla
Koniec:
RET

END