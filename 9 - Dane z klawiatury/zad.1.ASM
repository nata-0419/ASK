CLO 

PETLA:
MOV BL,C0
	REP:
	IN 00 			; nacisniecie klawisza - zapisz jego kod w AL.
	CMP AL,0D		; porównanie czy AL jest enterem 
	JZ KONIEC		; jeœli tak to koniec
	MOV [BL],AL		; JEŒLI NIE zapisz wciœniêty klawisz do BL 
	INC BL			; zwiêksz BL o 1 by nie nadpisywaæ wprowadzonych danych
	CMP BL,FF		; porównaj czy BL osi¹gnêlo ju¿ oststnie wolne mejsce czyli FF
	JZ PETLA		; jeœli TAK zacznij NADPISYWANIE 
	JMP REP			; jeœli NIE wróc do REP i kontynuj 
KONIEC:
END