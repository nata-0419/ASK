MOV DL,50		; DEKLARACJA miejsca do zapisywanie w RAM
MOV BL,0		; 

PETLA:
	IN 00 		; nacisniecie klawisza zapisz jego kod w AL.
	CMP AL,0D 	; por�wnanie czy jest to klawisz ENTER
	JZ WYSWIETL	; je�li TAK przejdz do wyswietl
	MOV [DL],AL 	; je�li NIE zapisz dane w komurkach DL
	INC DL		; powi�kszaj DL(zapisywanie w pami�ci)
	INC BL		; powi�kszaj BL
	CMP BL,30	; je�li dane b�d� mialy miejsce na wy�wietlaczu zapisuj je dalej (wy�wietlacz ma miejsca na 3 linijki )
	JNZ PETLA	; je�li miejsce b�dzie (flaga zera) skocz do PETLA
	MOV DL,50	; je�li linijka si� zapelni naspisuj wprowadzane klawisz (zapisuj od pocz�tku)
	JMP PETLA

WYSWIETL: 
	MOV DL,7F	; pod DL zapisujemy oststnie miejsce gdzie mo�e znajdowa� si� litera (oststnie miejsce w linni 50->5F )
	MOV BL,C0	; BL przechowuje warto�ci kod�w asci 
	MOV AL,0	; AL r�wne 0 by zako�czy� program

LICZBA:
	MOV CL,[DL]	; warto�ci z DL skopiuj do CL
	CMP CL,0	;por�wnaj CL do 0 
	JZ POMIN	; jesli r�wne przejdz do pomin
	MOV [BL],CL	; jesli nie to CL wpisz do 
	INC BL		; dodawaj 1 by nie nadpisywa� danych
POMIN:
	DEC DL		; odczytuj OD KO�CA
	CMP AL,3F	; je�li NIE (por�wnaj rozmiar wy�wietlacza 3F
	JZ KONIEC	; je�li jest r�wny zako�cz 
	INC AL  	; je�li NIE powi�ksz i sprawdzaj dalej
	JMP LICZBA
KONIEC:
END

