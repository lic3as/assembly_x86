; implementando a expressão number = 7 - number*3
	.386
	.model	flat, c
	.stack	100h
printf	PROTO	arg1:Ptr Byte, printlist:VARARG
scanf	PROTO	arg2:Ptr Byte, inputlist:VARARG
	.data
infmt	byte	"%d",0
msg1fmt	byte	0Ah,"%s",0
msg2fmt	byte	0Ah,"%s%d",0Ah,0Ah,0
msg1	byte	"Enter an integer: ",0
msg2	byte	"The integer is: ",0
number	sdword	?
	.code
main	proc
	INVOKE printf, ADDR msg1fmt, ADDR msg1
	INVOKE scanf, ADDR infmt, ADDR number
	mov eax, number
	mov ebx, 3
	imul ebx
	mov number, 7
	sub number,eax
	INVOKE printf, ADDR msg2fmt, ADDR msg2, number
	ret
main	endp
	end