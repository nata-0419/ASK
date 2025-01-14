; Napisaæ program, który posiada procedurê do dzielenia. Dzielna przekazywana jest w rejestrze AL, a dzielnik w rejestrze BL. 
; Wynik dzielenia zapisywany bêdzie do rejestru AL. Je¿eli jako dzielnik zostanie przekazane 0,
; to program uruchamia przerwanie 0D. Procedura obs³ugi tego przerwania wyœwietli czerwone œwiat³o na sygnalizacji drogowej i 
; ustawi flagê „O”(overflow). Rejestr flag nie mo¿e byæ modyfikowany bezpoœrednio, dlatego trzeba tego
; dokonaæ za poœrednictwem stosu (instrukcja POPF).

MOV AL,12		; przekazujê dzieln¹ 12 pod adres AL  
MOV BL,6		; przekazujê dzielnik "0" pod adres BL jesli chcê by uruchomilo siê przerwanie 0D 
			; ale mogê przekaaæ tak¿ê inna liczbê i procedura siê nie uruchomi

CMP BL,0		; porównujê wartoœæ w BL do 0
	JZ CALL2	; jeœli prawda skacz do CALL2 i urychom procedurê
	CALL 40		; jeœli nie skocz do "ORG 40"
DB 47			; PRZEJDZ DO adresu 47 i wykonuj dalej

ORG 40			; podziel AL przez BL i wyjdz
	DIV AL,BL	
	JMP KONIEC

CALL2:			; uruchom przerwanie 0D
	INT 0D
MOV AL,90		; swiatlo czerwone 
OUT 01
ADD AL,90
PUSHF			; odkladamy wartoœc rejestru na stos


KONIEC: 
END

