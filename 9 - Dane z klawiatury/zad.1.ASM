CLO 

PETLA:
MOV BL,C0
	REP:
	IN 00 			; nacisniecie klawisza - zapisz jego kod w AL.
	CMP AL,0D		; por�wnanie czy AL jest enterem 
	JZ KONIEC		; je�li tak to koniec
	MOV [BL],AL		; JE�LI NIE zapisz wci�ni�ty klawisz do BL 
	INC BL			; zwi�ksz BL o 1 by nie nadpisywa� wprowadzonych danych
	CMP BL,FF		; por�wnaj czy BL osi�gn�lo ju� oststnie wolne mejsce czyli FF
	JZ PETLA		; je�li TAK zacznij NADPISYWANIE 
	JMP REP			; je�li NIE wr�c do REP i kontynuj 
KONIEC:
END