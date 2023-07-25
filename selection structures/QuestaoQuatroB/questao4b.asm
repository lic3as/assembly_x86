; implementando um if-then-if aninhado sem diretivas, usando compares, jumps e labels
	            .386
	            .model	flat, c
	            .stack	100h
	            .data
a	            sdword	?
b	            sdword	?
c1              sdword  ?
d               sdword  ?
	            .code
main	        proc
                mov eax,b
if01:           cmp a,eax
                jg else01
if02:           cmp eax, c1
                jge else02
                mov eax,d
if03:           cmp c1, eax
                jg else03
then03:         mov ebx,2
                cdq
                idiv ebx
                mov d, eax
                jmp endif01
else03:         add c1,eax 
                jmp endif01
else02:         sub b,2
                jmp endif01
else01:         dec a
endif01:        nop
	            ret
main	        endp
	            end
