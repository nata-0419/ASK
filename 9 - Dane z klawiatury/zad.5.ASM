MOV BL,0		; BL kom�rka w kt�rej wpisuje kody asci cyfry

PETLA:
	IN 00		; wpisuje liczb�
	SUB AL,30	; dodaje do liczby 30 (mam kod asci liczby)
	ADD BL,AL	; BL ma moj� liczb�
	JS WYJDZ
	CALL 30		; przejdz do 30
	JMP PETLA
ORG 30
PUSH BL			; rzucam na stos BL
POP DL			; pobieram ze stosu DL
	MOD DL,A	; reszta z dzielenia liczby przez 10 zapisana w dl
	ADD DL,30	; dodaje do reszty 30 by usyzka� kod asci
	MOV [C5],DL	; wypisuje na wy�wietlaczu C2 liczb� JEDNO��I
PUSH BL
POP DL
	DIV DL,A	; liczb� dziel� przez 10 pobieram liczb� do DL 
	JZ KONIEC	
	MOD DL,A	; reszt� z dzielenia przez 10 pobieram do DL 
	ADD DL,30	; dodaje 30 by uzyska� kod ASCI
	MOV [C4],DL	; wyspisuje na wy�wietlaczu C1 liczb� DZIESI�TN� 
PUSH BL
POP DL
	DIV DL,64	; liczb� dziel� przez 100(system 16) pobieram liczb� do DL
	JZ KONIEC
	ADD DL,30	; dodaje 30 by uzyska� kod ASCI
	MOV [C3],DL	; wyspisuje na wy�wietlaczu C0 liczb� SETN�

KONIEC: 
RET

WYJDZ:
END

