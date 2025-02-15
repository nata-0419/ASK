; Napisa� program z procedur� obs�ugi przerwania 04. Przerwanie to odczytuje znak z klawiatury i umieszcza go w buforze cyklicznym w pami�ci.
; Wielko�� takiego bufora nale�y ustali� na 5 bajt�w. Po naci�ni�ciu przycisku �Enter� zawarto�� bufora wy�wietla
; si� na wy�wietlaczu VDU. Program wykonuje przerwanie w p�tli niesko�czonej. Bufor nigdy nie przepe�nia si�, bo
; poprzednio dodane dane zostaj� nadpisane. Je�eli wska�nik zapisu zr�wna si� ze wska�nikiem odczytu, to wska�nik 
; odczytu zostaje przesuni�ty. W takiej sytuacji nieodczytane znaki zostaj� utracone. W buforze mo�na zapisa� do
; 5 znak�w, ale standardowo zaimplementowany bufor cykliczny pozwoli na odczyt tylko 4 z nich



JMP GLOWNA
JMP ZAWIJAJ
DB 0E

GLOWNA:
	MOV DL, C0
	MOV BL, 50

ZAWIJAJ:
	MOV CL, 50 	; nadana warto�c kom�rki dla CL

Rep:
	IN 00		; wy�wietl klawiatur�
	MOV [CL], AL	; przypisz warto�� AL do kom�rki CL
	CMP AL, 0D	; por�wnaj warto�� AL do koduASCI enter
	JZ ENTER 	; je�li jest to enter przeskocz do ENTER
	INC CL		; incrementuj CL
	CMP CL, 59	; por�wnaj CL do 59 
	JZ ZAWIJAJ	; je�li tak zawi� (czyli nadpisuj od 50)
	INT 04		; procedura przerwania 04

ENTER:
	MOV CL, 50	; przypisz kom�rk� 50 pod CL
	ODCZYTUJ:	
	MOV AL, [CL]	; przypisz warto�� spod kom�wrki 50 do AL
	MOV [DL], AL	; przypisz warto�� AL do kom�rki DL
	INC CL		; inkrementuj CL (powiel o jeden)
	CMP CL, 59	; por�wnaj CL do 59
	JZ GLOWNA 	; skocz do main
	INC DL		; inkrementuj DL 
	JMP ODCZYTUJ	; skacz do odczytuj by pokoleji odczytywa� klawisze

Endl:
	END
