; implementando a estrutura switch case usando compares, jumps e labels 
	    .386
	    .model	flat, c
	    .stack	100h
	    .data
number  sdword	?
count   sdword	?
	    .code
main	proc
switch: cmp number, 0
        je case1
        cmp number, 1
        je case1
        cmp number, 2
        je case3
        cmp number, 3
        je case3
        jmp endswi
case1:  add count, 2
        jmp endswi
case3:  sub count, 2
        jmp endswi
endswi: nop
	    ret
main	endp
	    end
