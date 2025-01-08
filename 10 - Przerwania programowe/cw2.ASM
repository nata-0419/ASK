; Napisaæ program zawieraj¹cy procedurê obs³ugi przerwania o numerze 03, realizuj¹c¹ odczyt cyfry z klawiatury. 
; W rejestrze CL zostanie zapisana wartoœæ cyfry (nale¿y przekszta³ciæ znak ASCII). Je¿eli wprowadzony znak z
; klawiatury nie bêdzie cyfr¹, to w rejestrze CL powinna znaleŸæ siê liczba -1.
; Wyj¹tkiem jest litera „Q” (ma³a lub wielka), dla której rejestr CL przyjmuje 3 wartoœæ -2. Program dzia³a w pêtli, 
; wywo³uj¹c przerwanie i sygnalizuj¹c jego wynik za pomoc¹ œwiate³ drogowych, wed³ug poni¿szego schematu:
; — wykonuje x migniêæ zielonym œwiat³em (x - wprowadzona cyfra),
; — dla zwróconej wartoœci -1 zapala siê czerwone œwiat³o.
; Pêtla (a tak¿e program) koñczy siê po napotkaniu liczby -2 w rejestrze CL po wykonaniu przerwania.


JMP Start
DB 04		; miejsce na tablicy od którego zostane uruchamiany program
DB 21		; jak powy¿ej

Start:

MOV DL, A0 	; tutaj zapisywane s¹ kody ASCI danego klawisza 
IN 00		; wyœwietl klawiature
SUB AL, 30	; 
MOV [DL], AL	; przypisuje pod komurkê DL wartoœæ AL
MOV CL, [DL]	; pod CL przypisuje wartoœæ komurki DL
CMP CL, 21	; porównuje wartoœæ spod CL do wartoœci komórki 21
JZ q
CMP CL, 41
JZ q
CMP CL, A
JNS litera
	
For:			; pêtla wykona siê tyle razy ile przedstawiala liczba
	MOV AL, 24	; zielone œwiatlo
	OUT 01	
	DEC CL		; decrementacja CL
	MOV AL, 0	; swiatlo gaœnie
	OUT 01
	CMP CL, 0	; porównaj liczbê do 0
	JZ Start	; jesli s¹ ju¿ sobie równe rozpocznij od pocz¹tku
	INT 03		; jeœli nie przeskocz do pêtli 

litera:			; wykonaj funkcje jesli wpisaliœmy literê
	MOV BL, 0
	SUB BL, 1
	MOV CL, [BL]	
	MOV AL, 90	; czerwone œwiatlo
	OUT 01 		; wyjœcie do sygnalizacji swietlenej
	INT 02		; przeskocz do 2 komórki

q:			; wykonaj funkcje jeœli wpisaliœmy Q,q i zakoñcz program
	MOV CL, 0
	SUB CL, 2	
	MOV AL, 90	; czerwone swiatlo
	OUT 01		; wyjœcie do sygnalizacji œwietlnej
	END		; koniec programu

