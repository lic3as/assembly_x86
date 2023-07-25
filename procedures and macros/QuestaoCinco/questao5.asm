; implementando a sequenência de Fibonacci como uma macro
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
fibonacci   macro num1:REQ ;;tem que digitar um valor pra num1, sen�o d� erro
            pushad
            .if num1 < 0 ;;num1 < 0 -> erro
            INVOKE printf, ADDR msg1fmt, ADDR msgerro
            .else
            .if num1 == 0 ;;num1 = 0 -> 0
            mov fib,0
            INVOKE printf, ADDR msg2fmt, ADDR msg2, fib
            .else
            .if num1 == 1 ;;num1 = 1 -> 1
            mov fib,1
            INVOKE printf, ADDR msg2fmt, ADDR msg2, fib
            .else
            mov ecx,2
            .while ecx <= num1 ;;num1 >= 2  -> faz o c�lculo
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
            endm
main        proc
            INVOKE printf, ADDR msg1fmt, ADDR msg1
            INVOKE scanf, ADDR in1fmt, ADDR n
            fibonacci n
            ret
main        endp
            end
