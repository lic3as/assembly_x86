; implementando a soma de 1 a x com while usando compares, jumps e labels
	        .686
	        .model	flat, c
	        .stack	100h
            scanf   PROTO arg2:Ptr Byte, inputlist:VARARG
            printf  PROTO arg1:Ptr Byte, printlist:VARARG
	        .data
in1fmt      byte "%d",0
msg1fmt     byte "%s",0
msg2fmt     byte 0Ah,"%s",0
msg3fmt     byte 0Ah,"%s%d",0
msg1        byte "Insira o valor de x: ",0
msg2        byte "Insira o valor de y: ",0
msg3        byte "Resultado: ",0
ans         sdword  ?
x           sdword  ?
y           sdword  ?
i           sdword  ?
	        .code
main	    proc
            INVOKE printf, ADDR msg1fmt, ADDR msg1
            INVOKE scanf, ADDR in1fmt, ADDR x
            INVOKE printf, ADDR msg2fmt, ADDR msg2
            INVOKE scanf, ADDR in1fmt, ADDR y
            mov ans,0 
if01:       cmp x,0
            je endif01 
            mov ecx,1 
while01:    cmp ecx,y
            jg endw01 
            mov eax,ans 
            add eax,x
            mov ans,eax 
            inc ecx 
            jmp while01 
endw01:     mov i,ecx 
endif01:    nop
            INVOKE printf, ADDR msg3fmt, ADDR msg3, ans
	        ret
main	    endp
	        end
            