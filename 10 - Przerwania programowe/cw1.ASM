; Napisa� program, kt�ry posiada procedur� do dzielenia. Dzielna przekazywana jest w rejestrze AL, a dzielnik w rejestrze BL. 
; Wynik dzielenia zapisywany b�dzie do rejestru AL. Je�eli jako dzielnik zostanie przekazane 0,
; to program uruchamia przerwanie 0D. Procedura obs�ugi tego przerwania wy�wietli czerwone �wiat�o na sygnalizacji drogowej i 
; ustawi flag� �O�(overflow). Rejestr flag nie mo�e by� modyfikowany bezpo�rednio, dlatego trzeba tego
; dokona� za po�rednictwem stosu (instrukcja POPF).

MOV AL,12		; przekazuj� dzieln� 12 pod adres AL  
MOV BL,6		; przekazuj� dzielnik "0" pod adres BL jesli chc� by uruchomilo si� przerwanie 0D 
			; ale mog� przekaa� tak�� inna liczb� i procedura si� nie uruchomi

CMP BL,0		; por�wnuj� warto�� w BL do 0
	JZ CALL2	; je�li prawda skacz do CALL2 i urychom procedur�
	CALL 40		; je�li nie skocz do "ORG 40"
DB 47			; PRZEJDZ DO adresu 47 i wykonuj dalej

ORG 40			; podziel AL przez BL i wyjdz
	DIV AL,BL	
	JMP KONIEC

CALL2:			; uruchom przerwanie 0D
	INT 0D
MOV AL,90		; swiatlo czerwone 
OUT 01
ADD AL,90
PUSHF			; odkladamy warto�c rejestru na stos


KONIEC: 
END

