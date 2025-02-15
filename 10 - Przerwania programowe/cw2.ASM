; Napisa� program zawieraj�cy procedur� obs�ugi przerwania o numerze 03, realizuj�c� odczyt cyfry z klawiatury. 
; W rejestrze CL zostanie zapisana warto�� cyfry (nale�y przekszta�ci� znak ASCII). Je�eli wprowadzony znak z
; klawiatury nie b�dzie cyfr�, to w rejestrze CL powinna znale�� si� liczba -1.
; Wyj�tkiem jest litera �Q� (ma�a lub wielka), dla kt�rej rejestr CL przyjmuje 3 warto�� -2. Program dzia�a w p�tli, 
; wywo�uj�c przerwanie i sygnalizuj�c jego wynik za pomoc� �wiate� drogowych, wed�ug poni�szego schematu:
; � wykonuje x migni�� zielonym �wiat�em (x - wprowadzona cyfra),
; � dla zwr�conej warto�ci -1 zapala si� czerwone �wiat�o.
; P�tla (a tak�e program) ko�czy si� po napotkaniu liczby -2 w rejestrze CL po wykonaniu przerwania.


JMP Start
DB 04		; miejsce na tablicy od kt�rego zostane uruchamiany program
DB 21		; jak powy�ej

Start:

MOV DL, A0 	; tutaj zapisywane s� kody ASCI danego klawisza 
IN 00		; wy�wietl klawiature
SUB AL, 30	; 
MOV [DL], AL	; przypisuje pod komurk� DL warto�� AL
MOV CL, [DL]	; pod CL przypisuje warto�� komurki DL
CMP CL, 21	; por�wnuje warto�� spod CL do warto�ci kom�rki 21
JZ q
CMP CL, 41
JZ q
CMP CL, A
JNS litera
	
For:			; p�tla wykona si� tyle razy ile przedstawiala liczba
	MOV AL, 24	; zielone �wiatlo
	OUT 01	
	DEC CL		; decrementacja CL
	MOV AL, 0	; swiatlo ga�nie
	OUT 01
	CMP CL, 0	; por�wnaj liczb� do 0
	JZ Start	; jesli s� ju� sobie r�wne rozpocznij od pocz�tku
	INT 03		; je�li nie przeskocz do p�tli 

litera:			; wykonaj funkcje jesli wpisali�my liter�
	MOV BL, 0
	SUB BL, 1
	MOV CL, [BL]	
	MOV AL, 90	; czerwone �wiatlo
	OUT 01 		; wyj�cie do sygnalizacji swietlenej
	INT 02		; przeskocz do 2 kom�rki

q:			; wykonaj funkcje je�li wpisali�my Q,q i zako�cz program
	MOV CL, 0
	SUB CL, 2	
	MOV AL, 90	; czerwone swiatlo
	OUT 01		; wyj�cie do sygnalizacji �wietlnej
	END		; koniec programu

