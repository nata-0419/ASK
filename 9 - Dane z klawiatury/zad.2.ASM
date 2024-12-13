MOV DL,50		; DEKLARACJA miejsca do zapisywanie w RAM
MOV BL,0		; 

PETLA:
	IN 00 		; nacisniecie klawisza zapisz jego kod w AL.
CMP AL,0D 		; porównanie czy jest to klawisz ENTER
	JZ WYSWIETL	; jeœli TAK przejdz do wyswietl
	MOV [DL],AL 	; jeœli NIE zapisz dane w komurkach DL
	INC DL		; powiêkszaj DL(zapisywanie w pamiêci)
	INC BL		; powiêkszaj BL ??
CMP BL,30		; -- ? ? --
	JNZ PETLA	; jeœli .... (flaga zera) skocz do PETLA
	MOV DL,50	; jeœli .... naspisuj wprowadzane klawisz (zapisuj od pocz¹tku)
	JMP PETLA

WYSWIETL: 
	MOV DL,50	; wróæ do poczatku zapisanych danch by odczytaæ ODPOCZ¥TKU
	MOV BL,C0	; BL przechowuje wartoœci kodów asci 
	MOV AL,0	; AL równe 0 by zakoñczyæ program

LICZBA:
	MOV CL,[DL]	; wartoœci z DL skopiuj do CL
	MOV [BL],CL	; CL skopiuj do komurki BL
	INC BL		; powiêksz BL (odczytywanie) 
	INC DL		; powiêksz DL (odczytywanie)
CMP CL,0		; porównaj CL do 0
	JZ KONIEC	; jeœli jest RÓWNY zakoñcz
CMP AL,3F		; jeœli NIE (porównaj rozmiar wyœwietlacza 3F
	JZ KONIEC	; jeœli jest równy zakoñcz 
	INC AL  	; jeœli NIE powiêksz i sprawdzaj dalej
	JMP LICZBA
KONIEC:
END

