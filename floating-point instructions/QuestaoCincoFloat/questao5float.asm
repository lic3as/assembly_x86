; programa utilizando o tipo float
            .686
            .model flat,c
            .stack 100h
scanf       PROTO arg2:Ptr Byte, inputlist:VARARG
printf      PROTO arg1:Ptr Byte, printlist:VARARG

            .data
in1fmt      byte    "%f", 0   
msg1fmt     byte    0Ah,"%s",0
msg2fmt     byte    0Ah,"%s%6.4f",0Ah,0Ah,0
msg1        byte    "Enter a float for x: ",0
msg2        byte    "The float in y is: ",0
x           real4  ?
y           real8  ?

            .code
main        proc
            INVOKE printf, ADDR msg1fmt, ADDR msg1
            INVOKE scanf, ADDR in1fmt, ADDR x
            fld x
            fstp y
            INVOKE printf, ADDR msg2fmt, ADDR msg2, y
            ret
main        endp
            end
            