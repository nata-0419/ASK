IN 03			;pobiera dane z portu 03
AND AL,1 		;JESLI al jest na 1 nic siê nie zmieni
JZ WARM			;jeœli ponie¿ej to przejdz do pêtli warm
JNZ COLD		;jeœli powy¿ej to idz do pêtli ccols 
WARM:
	MOV AL,80	;wl¹cza grzejnik
	OUT 03		;po tym porcie sprawdzamy stan grzejnika
	IN 03 		;po pobrani z portu sprawdzamy:
	AND AL,1 	;jeœli jest 1 nic sie nie dzieje
	JZ WARM		;jeœli jest ponizej wróæ do pêtli warm
	JNZ COLD	;jeœli jest powy¿ej idz do pêtli cols
COLD:
	MOV AL,0 
	OUT 03 
	IN 03
	AND AL,1
	JZ WARM
	JNZ COLD
END