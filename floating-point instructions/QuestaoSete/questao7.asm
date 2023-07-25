; programa utilizando comparações e estruturas de seleção com o tipo double
            .686
            .model flat,c
            .stack 100h
scanf       PROTO arg2:Ptr Byte, inputlist:VARARG
printf      PROTO arg1:Ptr Byte, printlist:VARARG

            .data
in1fmt      byte    "%lf", 0   
msg1e2fmt   byte    0Ah,"%s",0
msg3e4fmt   byte    0Ah,"%s",0Ah,0
msg1        byte    "Enter a double for x: ",0
msg2        byte    "Enter a double for y: ",0
msg3        byte    "x is greater than y",0
msg4        byte    "x is less than y",0
msg5        byte    "x and y are equal",0
x           real8   ?
y           real8   ?

            .code
main        proc
            INVOKE printf, ADDR msg1e2fmt, ADDR msg1
            INVOKE scanf, ADDR in1fmt, ADDR x
            INVOKE printf, ADDR msg1e2fmt, ADDR msg2
            INVOKE scanf, ADDR in1fmt, ADDR y
if01:       fld y
            fld x
            fcomip st(0), st(1)
            jna else01
then01:     INVOKE printf, ADDR msg3e4fmt, ADDR msg3
            jmp endif01
else01:     fld y
            fld x
            fcomip st(0), st(1)
if02:       jnb else02
            INVOKE printf, ADDR msg3e4fmt, ADDR msg4
            jmp endif01
else02:     INVOKE printf, ADDR msg3e4fmt, ADDR msg5
endif01:    nop
            ret
main        endp
            end
  