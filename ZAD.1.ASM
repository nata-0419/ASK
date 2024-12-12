; Napisaæ program, który w pêtli nieskoñczonej odczytuje znaki z klawiatury i umieszcza 
; je na kolejnych pozycjach wyœwietlacza VDU. W przypadku,
; gdy zostan¹ zape³nione wszystkie pozycje, nale¿y rozpocz¹æ zapisywanie od
; pocz¹tku, nadpisuj¹c umieszczone wczeœniej znaki.

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