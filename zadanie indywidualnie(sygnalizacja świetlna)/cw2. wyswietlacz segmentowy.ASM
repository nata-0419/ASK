;JMP START
;DB 50 

START:

STI
REP:

LIST6:
MOV AL,FD
OUT 02
MOV AL,DD
OUT 02

LIST4:
MOV AL,4F
OUT 02
MOV AL,9F
OUT 02

LIST2:
MOV AL,B7
OUT 02
MOV AL,B
OUT 02
MOV AL,1
OUT 02

JMP REP


;ORG 50 

;PUSH al 	; Zapisanie AL na stos.
;PUSH bl 	; Zapisanie BL na stos.
;PUSHF 		; Zapisanie flag na stos.



;POPF 		; Przywrocenie flag
;POP bl 		; Przywrocenie BL
;POP al 		; Przywrocenie AL
IRET

END