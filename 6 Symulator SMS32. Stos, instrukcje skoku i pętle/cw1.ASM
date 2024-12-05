CLO

MOV AL,b
PETLA:
	CMP AL,0
	JS end_label
	SUB AL,2
	JMP PETLA
end_label:
END