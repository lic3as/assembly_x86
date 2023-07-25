; programa que soma valores até que um 0 seja inserido usando do-while
            .686
            .model flat,c
            .stack 100h
scanf       PROTO arg2:Ptr Byte, inputlist:VARARG
printf      PROTO arg1:Ptr Byte, printlist:VARARG

            .data
in1fmt      byte    "%lf", 0   
msg0fmt     byte    0Ah,"%s",0
msg1fmt     byte    0Ah,"%s%6.1f",0Ah,0
msg0        byte    "Enter a positive double for x: ",0
msg1        byte    "The sum is: ",0
x           real8   ?
sum         real8   ?
zero        real8   0.0

            .code
main        proc
            fld zero
            fstp sum            ;sum = 0.0
do01:       INVOKE printf, ADDR msg0fmt, ADDR msg0
            INVOKE scanf, ADDR in1fmt, ADDR x
            fld zero
            fld x
            fcomi st(0), st(1)  ;pilha = x, zero
            jbe endw01          ;adiciona somente se for maior que 0
            fld sum             ;pilha = sum, x, zero
            fadd x              ;sum = sum + x
            fstp sum            ;pilha = x, zero
            fcomip st(0), st(1)
            ja do01             ;while x > 0.0
endw01:     INVOKE printf, ADDR msg1fmt, ADDR msg1, sum
            ret
main        endp
            end
  