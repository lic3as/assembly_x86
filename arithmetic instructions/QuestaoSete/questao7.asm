; solicitar e inserir a temperatura em Fahrenheit, calcular e imprimir os graus em Celsius
; o programa ainda deve ser corrigido porque está dividindo 9 por 5 e, na fórmula, é o contrário
	.386
	.model	flat, c
	.stack	100h
printf	PROTO	arg1:Ptr Byte, printlist:VARARG
scanf	PROTO	arg2:Ptr Byte, inputlist:VARARG
	.data
infmt	byte	"%d",0
msg1fmt	byte	0Ah,"%s",0
msg2fmt	byte	"%s%d",0
msg1	byte	"Enter the degrees in Fahrenheit: ",0
msg2	byte	"The degrees in Celsius is: ",0
farenheit	sdword	?
celsius	sdword	?
	.code
main	proc
	INVOKE printf, ADDR msg1fmt, ADDR msg1
	INVOKE scanf, ADDR infmt, ADDR farenheit
	mov eax, 9
	mov ebx, 5
	cdq
	idiv ebx
	imul farenheit
	sub eax, 32
	mov celsius, eax
	INVOKE printf, ADDR msg2fmt, ADDR msg2, celsius
	ret
main	endp
	end