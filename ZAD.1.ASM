; Napisa� program, kt�ry w p�tli niesko�czonej odczytuje znaki z klawiatury i umieszcza 
; je na kolejnych pozycjach wy�wietlacza VDU. W przypadku,
; gdy zostan� zape�nione wszystkie pozycje, nale�y rozpocz�� zapisywanie od
; pocz�tku, nadpisuj�c umieszczone wcze�niej znaki.

CLO 
MOV [B0],AL 
Rep:
	IN 00 ; Czekaj na nacisniecie klawisza - zapisz jego kod w AL.
	MOV [B0],AL 
	CMP AL,0D ; Czy to byl klawisz Enter? (ASCII 0D)

	JNZ Rep ; Nie - skocz do poczatku. Tak - zakoncz.
	INC [B0]
	MOV [B0],AL

END