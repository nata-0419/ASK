IN 03			;pobiera dane z portu 03
AND AL,1 		;JESLI al jest na 1 nic si� nie zmieni
JZ WARM			;je�li ponie�ej to przejdz do p�tli warm
JNZ COLD		;je�li powy�ej to idz do p�tli ccols 
WARM:
	MOV AL,80	;wl�cza grzejnik
	OUT 03		;po tym porcie sprawdzamy stan grzejnika
	IN 03 		;po pobrani z portu sprawdzamy:
	AND AL,1 	;je�li jest 1 nic sie nie dzieje
	JZ WARM		;je�li jest ponizej wr�� do p�tli warm
	JNZ COLD	;je�li jest powy�ej idz do p�tli cols
COLD:
	MOV AL,0 
	OUT 03 
	IN 03
	AND AL,1
	JZ WARM
	JNZ COLD
END