; usando a função scanf e printf do C para entrada e saída de dados
	.386
	.model	flat, c
	.stack	100h
printf	PROTO	arg1:Ptr Byte, printlist:VARARG
scanf	PROTO	arg2:Ptr Byte, inputlist:VARARG
	.data
infmt	byte	"%d",0
msg1fmt	byte	"%s",0
msg2fmt	byte	0Ah,"%s",0
numfmt	byte	0Ah,"   %d",0
msg1	byte	"Enter a number: ",0
msg2	byte	"Numbers",0
num1	sdword	?
num2	sdword	?
	.code
main	proc
	INVOKE printf, ADDR msg1fmt, ADDR msg1
	INVOKE scanf, ADDR infmt, ADDR num1
	INVOKE printf, ADDR msg1fmt, ADDR msg1
	INVOKE scanf, ADDR infmt, ADDR num2
	INVOKE printf, ADDR msg2fmt, ADDR msg2
	INVOKE printf, ADDR numfmt, num1
    INVOKE printf, ADDR numfmt, num2
	ret
main	endp
	end