; implementando uma macro para solicitar e inserir um inteiro no acumulador (INACC), outra para colocar o valor do acumulador no operando (STOREACC), outra para subtrair o operando do acumulador (SUBACC) e outra para dividir o acumulador pelo operando de forma iterativa (DIVACC), além de um procedimento para imprmir o resultado (OUTACC)
            .686
            .model  flat, c
            .stack  100h
printf      PROTO   arg1:Ptr Byte, printlist:VARARG
scanf       PROTO   arg2:Ptr Byte, inputlist:VARARG
            .data
msg1fmt     byte   0Ah, "%s%d", 0Ah, 0
errofmt     byte   0Ah, "%d", 0Ah, 0
msg1        byte   "The contents of the accumulator are: ", 0
temp        sdword ?
erro        sdword -1
            .code
INACC       macro value:REQ           ;; solicita e insere valor no acumulador
            mov eax, value
            endm
STOREACC    macro           ;; coloca valor de acumulador no operando
            mov temp, eax
            endm
SUBACC      macro operand:REQ          ;; subtrai operando do acumulador
            sub eax, operand
            endm
DIVACC      macro operand:REQ, acc:REQ       ;; divide acumulador pelo operando (loop das subtra��es)
            if (operand eq 0) or (acc eq 0)
            pushad
            INVOKE printf, ADDR errofmt, erro
            popad
            mov eax, -1
            else
            mov ebx,operand
            mov eax, acc
            if (operand lt 0) and (acc gt 0)
            neg ebx
            elseif (operand gt 0) and (acc lt 0)
            neg eax
            elseif (operand lt 0) and (acc lt 0)
            neg ebx
            neg eax
            endif
            mov edx,eax 
            mov eax,0 
            .while edx>=ebx
            sub edx,ebx 
            inc eax 
            .endw
            if (operand lt 0) and (acc gt 0)
            neg eax    
            elseif (operand gt 0) and (acc lt 0)
            neg eax
            endif
            endif
            endm
main        proc 
            INACC 47
            SUBACC 3
            call OUTACC             ; acc = 44
            INACC 21
            SUBACC 7
            call OUTACC             ; acc = 14
            INACC 2
            SUBACC 4
            call OUTACC             ; acc = -2
            INACC 9
            SUBACC 25
            call OUTACC             ; acc = -16
            INACC 3
            SUBACC 3
            call OUTACC             ; acc = 0
            DIVACC 2, 4
            call OUTACC             ; acc = 2
            DIVACC 4, 4
            call OUTACC             ; acc = 1
            DIVACC 2, 15
            call OUTACC             ; acc = 7 e sobra 1
            DIVACC 0, 15
            call OUTACC             ; erro -1
            DIVACC 2, -4
            call OUTACC             ; acc = -2
            DIVACC -1, 5
            call OUTACC             ; acc = -5
            DIVACC -1, 0
            call OUTACC             ; erro -1
            ret
main        endp
OUTACC      proc            ; imprimir o resultado
	        push eax           
            push ecx
            push edx
            STOREACC
            INVOKE printf, ADDR msg1fmt, ADDR msg1, temp
	        pop edx           
            pop ecx
            pop eax
            ret       
OUTACC      endp
            end              
