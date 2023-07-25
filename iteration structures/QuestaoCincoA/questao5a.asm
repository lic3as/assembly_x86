; implementando a divisão sem sinal como uma sequência de subtrações usando a diretiva .while
	    .686
	    .model	flat, c
	    .stack	100h
        scanf   PROTO arg2:Ptr Byte, inputlist:VARARG
        printf  PROTO arg1:Ptr Byte, printlist:VARARG
	    .data
in1fmt  byte "%d",0
msg1fmt byte "%s",0
msg2fmt byte 0Ah,"%s",0
msg3fmt byte 0Ah,"%s%d",0Ah,0
msg1    byte "Dividendo: ",0
msg2    byte "Divisor: ",0
msg3    byte "Quociente: ",0
msg4    byte "Resto: ",0
divd    sdword	?
divs    sdword	?
quoc    sdword  0
resto   sdword  0
	    .code
main	proc
        INVOKE printf, ADDR msg1fmt, ADDR msg1
        INVOKE scanf, ADDR in1fmt, ADDR divd
        INVOKE printf, ADDR msg2fmt, ADDR msg2
        INVOKE scanf, ADDR in1fmt, ADDR divs
	mov eax,divd
        mov ebx,divs
        mov edx,eax 
        mov eax,0 
        .while edx>=ebx
        sub edx,ebx 
        inc eax 
        .endw
        mov quoc,eax
        mov resto,edx
        INVOKE printf, ADDR msg3fmt, ADDR msg3, quoc
        INVOKE printf, ADDR msg3fmt, ADDR msg4, resto
	    ret
main	endp
	    end