CLO
JMP Start
	DB 1 	;pierwsza wartosc [02]
	DB 9 
	DB 5
	DB 7
	DB AA 	;trzecia wartosc [06]
Start:

MOV DL,02
CALL 50 

ORG 40
	ADD AL,30
	RET
ORG 50
	MOV CL,C0
	REP:

	MOV AL,[DL]
	CMP AL,AA
	JZ KONIEC
	CALL 40
	MOV [CL],AL
	INC DL
	INC CL
	JMP REP

KONIEC:
RET
END 
