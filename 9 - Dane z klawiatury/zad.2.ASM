MOV DL,50		; DEKLARACJA miejsca do zapisywanie w RAM
MOV BL,0		; 

PETLA:
	IN 00 		; nacisniecie klawisza zapisz jego kod w AL.
CMP AL,0D 		; por�wnanie czy jest to klawisz ENTER
	JZ WYSWIETL	; je�li TAK przejdz do wyswietl
	MOV [DL],AL 	; je�li NIE zapisz dane w komurkach DL
	INC DL		; powi�kszaj DL(zapisywanie w pami�ci)
	INC BL		; powi�kszaj BL ??
CMP BL,30		; -- ? ? --
	JNZ PETLA	; je�li .... (flaga zera) skocz do PETLA
	MOV DL,50	; je�li .... naspisuj wprowadzane klawisz (zapisuj od pocz�tku)
	JMP PETLA

WYSWIETL: 
	MOV DL,50	; wr�� do poczatku zapisanych danch by odczyta� ODPOCZ�TKU
	MOV BL,C0	; BL przechowuje warto�ci kod�w asci 
	MOV AL,0	; AL r�wne 0 by zako�czy� program

LICZBA:
	MOV CL,[DL]	; warto�ci z DL skopiuj do CL
	MOV [BL],CL	; CL skopiuj do komurki BL
	INC BL		; powi�ksz BL (odczytywanie) 
	INC DL		; powi�ksz DL (odczytywanie)
CMP CL,0		; por�wnaj CL do 0
	JZ KONIEC	; je�li jest R�WNY zako�cz
CMP AL,3F		; je�li NIE (por�wnaj rozmiar wy�wietlacza 3F
	JZ KONIEC	; je�li jest r�wny zako�cz 
	INC AL  	; je�li NIE powi�ksz i sprawdzaj dalej
	JMP LICZBA
KONIEC:
END

