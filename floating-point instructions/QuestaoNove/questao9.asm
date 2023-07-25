; implementando um array de doubles
            .686
            .model flat,c
            .stack 100h
scanf       PROTO arg2:Ptr Byte, inputlist:VARARG
printf      PROTO arg1:Ptr Byte, printlist:VARARG

            .data
in1fmt      byte    "%lf", 0   
msg1fmt     byte    0Ah,"%s",0
msg2fmt     byte    0Ah,"%s",0Ah,0Ah,0
msg3fmt     byte    " %3.1f",0Ah,0
msg1        byte    "Enter a double: ",0
msg2        byte    "Array",0
n           sdword  5
array       real8   5 dup (?)

            .code
main        proc
            lea esi,array           ;esi = endere�o inicial do array
            mov ecx,n               ;ecx = n = 5
            .repeat
            push ecx
            INVOKE printf, ADDR msg1fmt, ADDR msg1
            INVOKE scanf, ADDR in1fmt, ADDR real8 ptr [esi]
            add esi,8               ;adiciona 8 por ser double
            pop ecx
            .untilcxz
            INVOKE printf, ADDR msg2fmt, ADDR msg2
            lea esi,array
            mov ecx,n
            .repeat
            push ecx
            INVOKE printf, ADDR msg3fmt, real8 ptr [esi]
            pop ecx
            add esi,8
            .untilcxz
            ret
main        endp
            end
  