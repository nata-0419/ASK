MOV BL,0		; BL komórka w której wpisuje kody asci cyfry

PETLA:
	IN 00		; wpisuje liczbê
	SUB AL,30	; dodaje do liczby 30 (mam kod asci liczby)
	ADD BL,AL	; BL ma moj¹ liczbê
	JS WYJDZ
	CALL 30		; przejdz do 30
	JMP PETLA
ORG 30
PUSH BL			; rzucam na stos BL
POP DL			; pobieram ze stosu DL
	MOD DL,A	; reszta z dzielenia liczby przez 10 zapisana w dl
	ADD DL,30	; dodaje do reszty 30 by usyzkaæ kod asci
	MOV [C5],DL	; wypisuje na wyœwietlaczu C2 liczbê JEDNOŒÆI
PUSH BL
POP DL
	DIV DL,A	; liczbê dzielê przez 10 pobieram liczbê do DL 
	JZ KONIEC	
	MOD DL,A	; resztê z dzielenia przez 10 pobieram do DL 
	ADD DL,30	; dodaje 30 by uzyskaæ kod ASCI
	MOV [C4],DL	; wyspisuje na wyœwietlaczu C1 liczbê DZIESIÊTN¥ 
PUSH BL
POP DL
	DIV DL,64	; liczbê dzielê przez 100(system 16) pobieram liczbê do DL
	JZ KONIEC
	ADD DL,30	; dodaje 30 by uzyskaæ kod ASCI
	MOV [C3],DL	; wyspisuje na wyœwietlaczu C0 liczbê SETN¥

KONIEC: 
RET

WYJDZ:
END

