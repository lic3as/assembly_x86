; implementando um if-then-if aninhado com diretivas MASM
	    .model	flat, c
	    .stack	100h
	    .data
a	    sdword	?
b	    sdword	?
c1      sdword  ?
d       sdword  ?
	    .code
main	proc
	mov eax,b
        .if a <= eax 
        .if eax < c1 
        mov eax,d
        .if c1 <= eax 
        mov ebx,2
        cdq
        idiv ebx
        mov d,eax 
        .else
        add c1,eax 
        .endif
        .else
        sub b,2 
        .endif
        .else
        dec a
        .endif
	    ret
main	endp
	    end
