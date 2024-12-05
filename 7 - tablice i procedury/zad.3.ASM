JMP start

DB "Hello"
DB 0

start:
MOV AL, 02
CALL 40

ORG 40
	MOV CL, C0
	Rep: 
		MOV DL, [AL]
		CMP DL, 0
		JZ koniec
		MOV [CL], DL
		INC AL
		INC CL
		JMP Rep
koniec:
RET

END