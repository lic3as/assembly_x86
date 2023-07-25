; implementando uma macro para carregar o acumulador com o operando (LOADACC) e outra para multiplicar o acumulador pelo ocperando de forma iterativa (MULTACC), além de um procedimento para imprmir o resultado (OUTACC)
            .686
            .model  flat, c
            .stack  100h
printf      PROTO   arg1:Ptr Byte, printlist:VARARG
scanf       PROTO   arg2:Ptr Byte, inputlist:VARARG
            .data
msg1fmt     byte   0Ah, "%s%d", 0Ah, 0Ah, 0
msg1        byte   "The contents of the accumulator are: ", 0
temp        sdword ?
            .code
LOADACC     macro operand           ;; coloca o operando em eax
            mov eax, operand   
            endm
MULTACC     macro operand           ;; multiplica��o entre operando e acumulador 
	        push ebx           
            push ecx
            mov ebx, eax            ;; ebx = eax (valor que estava no acumulador e ser� somado)
            mov eax, 0          ;; acumulador = 0 pra fazer o c�lculo
            if (operand eq 0)           ;; se o operando for 0, o resultado vai ser 0
            nop
            else
            if (operand eq 1)           ;; se o operando for 1, o resultado � o pr�prio acumulador
            mov eax, ebx
            else
            mov ecx, operand        ;; ecx = operando (repete operando vezes)
            if (operand LT 0)    ;; apenas se operando for negativo, ele vai torn�-lo positivo pra fazer o c�lculo
            neg ecx           
            endif   
            .while ecx > 0          ;; repete a soma enquanto ecx for maior que 0
            add eax, ebx            ;; adiciona ebx ao acumulador
            dec ecx             ;; decrementa ecx
            .endw    
            if (operand LT 0)             ;; se o operando era negativo, volta o resultado pra negativo
            neg eax          
            endif
            endif
            endif
            pop ecx       
            pop ebx 
            endm
main        proc 
            LOADACC 0
            MULTACC 3
            call OUTACC             ;; = 0
            LOADACC 4
            MULTACC 0
            call OUTACC             ;; = 0
            LOADACC 1
            MULTACC 5
            call OUTACC             ;; = 5
            LOADACC 6
            MULTACC 1
            call OUTACC             ;; = 6
            LOADACC 8
            MULTACC 4
            call OUTACC             ;; = 32
            ret
main        endp
OUTACC      proc            ;; imprimir o resultado
	        push eax           
            push ecx
            push edx
            mov temp, eax
            INVOKE printf, ADDR msg1fmt, ADDR msg1, temp
	        pop edx           
            pop ecx
            pop eax
            ret       
OUTACC      endp
            end          
