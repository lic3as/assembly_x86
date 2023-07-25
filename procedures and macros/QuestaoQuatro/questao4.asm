; implementando a função fatorial como uma macro
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
fatorial    macro num1:REQ ;;tem que digitar um valor pra num1, sen�o d� erro
            pushad
            .if num1 < 0 ;;num1 < 0 -> erro
            INVOKE printf, ADDR msg2fmt, ADDR msgerro
            .else
            .if num1 == 0 || num1 == 1 ;;num1 = 0 ou num1 = 1 -> 1
            INVOKE printf, ADDR msg2fmt, ADDR msg2
            .else
            .while num1 >= 2 ;;num1 >= 2 -> faz o c�lculo
            mov ebx, num1
            mov eax,fat 
            imul ebx
            mov fat,eax
            dec num1
            .endw
            INVOKE printf, ADDR msg3fmt, ADDR msg3, fat
            .endif
            .endif
            popad
            endm
main        proc
            INVOKE printf, ADDR msg1fmt, ADDR msg1
            INVOKE scanf, ADDR in1fmt, ADDR n
            fatorial n
            ret
main        endp
            end
