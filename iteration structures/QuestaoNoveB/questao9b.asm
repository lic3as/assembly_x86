; implementando a função fatorial (n!) usando .repeat - .until
            .686
            .model flat,c
            .stack 100h
scanf       PROTO arg2:Ptr Byte, inputlist:VARARG
printf      PROTO arg1:Ptr Byte, printlist:VARARG

            .data
in1fmt      byte "%d",0
msg1fmt     byte "%s",0
msg2fmt     byte 0Ah,"%s",0Ah,0
msg3fmt     byte 0Ah,"%s%d",0Ah,0
msg1        byte "Insira um valor: ",0
msgerro     byte "Erro!",0
msg2        byte "Resultado = 1",0
msg3        byte "Resultado = ",0
n           sdword  ?
fat         sdword  1

            .code
main        proc
            INVOKE printf, ADDR msg1fmt, ADDR msg1
            INVOKE scanf, ADDR in1fmt, ADDR n
            .if n < 0
            INVOKE printf, ADDR msg2fmt, ADDR msgerro
            .else
            .if n == 0 || n == 1
            INVOKE printf, ADDR msg2fmt, ADDR msg2
            .else
            .repeat
            mov ebx, n
            mov eax,fat 
            imul ebx
            mov fat,eax
            dec n
            .until n < 2
            INVOKE printf, ADDR msg3fmt, ADDR msg3, fat
            .endif
            .endif
            ret
main        endp
            end
