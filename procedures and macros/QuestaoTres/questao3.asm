; implementando a sequência de Fibonacci como um procedimento
            .686
            .model flat,c
            .stack 100h
scanf       PROTO arg2:Ptr Byte, inputlist:VARARG
printf      PROTO arg1:Ptr Byte, printlist:VARARG

            .data
in1fmt      byte "%d",0
msg1fmt     byte "%s",0
msg2fmt     byte 0Ah,"%s%d",0Ah,0
msg1        byte "Insira um valor: ",0
msgerro     byte "Erro!",0
msg2        byte "Resultado = ",0
n           sdword  ?
fib         sdword  ?
a           sdword  0
b           sdword  1

            .code
main        proc
            INVOKE printf, ADDR msg1fmt, ADDR msg1
            INVOKE scanf, ADDR in1fmt, ADDR n
            call fibonacci
            ret
main        endp
fibonacci   proc
            pushad
            .if n < 0
            INVOKE printf, ADDR msg1fmt, ADDR msgerro
            .else
            .if n == 0
            mov fib,0
            INVOKE printf, ADDR msg2fmt, ADDR msg2, fib
            .else
            .if n == 1
            mov fib,1
            INVOKE printf, ADDR msg2fmt, ADDR msg2, fib
            .else
            mov ecx,2
            .while ecx <= n
            mov eax, a 
            add eax, b 
            mov fib, eax 
            mov eax, b 
            mov a, eax 
            mov eax, fib 
            mov b, eax 
            inc ecx
            .endw
            INVOKE printf, ADDR msg2fmt, ADDR msg2, fib
            .endif
            .endif
            .endif
            popad
            ret
fibonacci   endp
            end
