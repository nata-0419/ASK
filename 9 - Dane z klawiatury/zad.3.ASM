MOV DL,50		; DEKLARACJA miejsca do zapisywanie w RAM
MOV BL,0		; 

PETLA:
	IN 00 		; nacisniecie klawisza zapisz jego kod w AL.
	CMP AL,0D 	; porównanie czy jest to klawisz ENTER
	JZ WYSWIETL	; jeœli TAK przejdz do wyswietl
	MOV [DL],AL 	; jeœli NIE zapisz dane w komurkach DL
	INC DL		; powiêkszaj DL(zapisywanie w pamiêci)
	INC BL		; powiêkszaj BL
	CMP BL,30	; jeœli dane bêd¹ mialy miejsce na wyœwietlaczu zapisuj je dalej (wyœwietlacz ma miejsca na 3 linijki )
	JNZ PETLA	; jeœli miejsce bêdzie (flaga zera) skocz do PETLA
	MOV DL,50	; jeœli linijka siê zapelni naspisuj wprowadzane klawisz (zapisuj od pocz¹tku)
	JMP PETLA

WYSWIETL: 
	MOV DL,7F	; pod DL zapisujemy oststnie miejsce gdzie mo¿e znajdowaæ siê litera (oststnie miejsce w linni 50->5F )
	MOV BL,C0	; BL przechowuje wartoœci kodów asci 
	MOV AL,0	; AL równe 0 by zakoñczyæ program

LICZBA:
	MOV CL,[DL]	; wartoœci z DL skopiuj do CL
	CMP CL,0	;porównaj CL do 0 
	JZ POMIN	; jesli równe przejdz do pomin
	MOV [BL],CL	; jesli nie to CL wpisz do 
	INC BL		; dodawaj 1 by nie nadpisywaæ danych
POMIN:
	DEC DL		; odczytuj OD KOÑCA
	CMP AL,3F	; jeœli NIE (porównaj rozmiar wyœwietlacza 3F
	JZ KONIEC	; jeœli jest równy zakoñcz 
	INC AL  	; jeœli NIE powiêksz i sprawdzaj dalej
	JMP LICZBA
KONIEC:
END

