; Napisaæ program z procedur¹ obs³ugi przerwania 04. Przerwanie to odczytuje znak z klawiatury i umieszcza go w buforze cyklicznym w pamiêci.
; Wielkoœæ takiego bufora nale¿y ustaliæ na 5 bajtów. Po naciœniêciu przycisku „Enter” zawartoœæ bufora wyœwietla
; siê na wyœwietlaczu VDU. Program wykonuje przerwanie w pêtli nieskoñczonej. Bufor nigdy nie przepe³nia siê, bo
; poprzednio dodane dane zostaj¹ nadpisane. Je¿eli wskaŸnik zapisu zrówna siê ze wskaŸnikiem odczytu, to wskaŸnik 
; odczytu zostaje przesuniêty. W takiej sytuacji nieodczytane znaki zostaj¹ utracone. W buforze mo¿na zapisaæ do
; 5 znaków, ale standardowo zaimplementowany bufor cykliczny pozwoli na odczyt tylko 4 z nich



JMP GLOWNA
JMP ZAWIJAJ
DB 0E

GLOWNA:
	MOV DL, C0
	MOV BL, 50

ZAWIJAJ:
	MOV CL, 50 	; nadana wartoœc komórki dla CL

Rep:
	IN 00		; wyœwietl klawiaturê
	MOV [CL], AL	; przypisz wartoœæ AL do komórki CL
	CMP AL, 0D	; porównaj wartoœæ AL do koduASCI enter
	JZ ENTER 	; jeœli jest to enter przeskocz do ENTER
	INC CL		; incrementuj CL
	CMP CL, 59	; porównaj CL do 59 
	JZ ZAWIJAJ	; jeœli tak zawiñ (czyli nadpisuj od 50)
	INT 04		; procedura przerwania 04

ENTER:
	MOV CL, 50	; przypisz komórkê 50 pod CL
	ODCZYTUJ:	
	MOV AL, [CL]	; przypisz wartoœæ spod komówrki 50 do AL
	MOV [DL], AL	; przypisz wartoœæ AL do komórki DL
	INC CL		; inkrementuj CL (powiel o jeden)
	CMP CL, 59	; porównaj CL do 59
	JZ GLOWNA 	; skocz do main
	INC DL		; inkrementuj DL 
	JMP ODCZYTUJ	; skacz do odczytuj by pokoleji odczytywaæ klawisze

Endl:
	END
