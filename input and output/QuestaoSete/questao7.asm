; usando a função scanf e printf do C para entrada e saída de dados
	.386
	.model	flat, c
	.stack	100h
printf	PROTO	arg1:Ptr Byte, printlist:VARARG
scanf	PROTO	arg2:Ptr Byte, inputlist:VARARG
	.data
infmt	byte	"%d",0
msg1fmt	byte	0Ah,"%s",0
msg2fmt	byte	"%s",0
msg3fmt	byte	0Ah,"%d %s %d %s %d",0Ah,0
msg1	byte	"Enter a number: ",0
msg2	byte	"Enter a larger number: ",0
msg3	byte	"Enter an even larger number: ",0
msg4	byte	" < ",0
msg5	byte	" > ",0
num	sdword	?
lnum	sdword	?
elnum	sdword	?
	.code
main	proc
	INVOKE printf, ADDR msg1fmt, ADDR msg1
	INVOKE scanf, ADDR infmt, ADDR num
	INVOKE printf, ADDR msg2fmt, ADDR msg2
	INVOKE scanf, ADDR infmt, ADDR lnum
	INVOKE printf, ADDR msg2fmt, ADDR msg3
	INVOKE scanf, ADDR infmt, ADDR elnum
	INVOKE printf, ADDR msg3fmt, num, ADDR msg4, lnum, ADDR msg4, elnum
	INVOKE printf, ADDR msg3fmt, elnum, ADDR msg5, lnum, ADDR msg5, num
	ret
main	endp
	end