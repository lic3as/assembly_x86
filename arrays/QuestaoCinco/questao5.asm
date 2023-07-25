; transferir o conteúdo de um array de 20 inteiros para outro array de 20 inteiros
            .686
            .model flat,c
            .stack 100h
scanf       PROTO arg2:Ptr Byte, inputlist:VARARG
printf      PROTO arg1:Ptr Byte, printlist:VARARG

            .data
msgfmt      byte    0Ah,"%s",0Ah,0
arrayfmt    byte    " %d ",0
brfmt       byte    0Ah,0
msg1        byte    "Primeiro array:",0
msg2        byte    "Segundo array:",0
array1      sdword  0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9
array2      sdword  20 dup(?)
temp        sdword  ?

            .code
main        proc
            INVOKE printf, ADDR msgfmt, ADDR msg1
            mov ecx, 20     ;; repetir 20 vezes
            lea esi, array1+0       ;; esi = endere�o do primeiro elemento de array1
            .repeat
            push ecx
            mov eax, [esi]
            mov temp, eax           ;; o elemento atual vai pra temp
            INVOKE printf, ADDR arrayfmt, temp      ;; imprimir os elementos de array1
            add esi, 4      ;; passa pro pr�ximo elemento de array1
            pop ecx
            .untilcxz
            INVOKE printf, ADDR brfmt
            mov ecx, 20     ;; repetir 20 vezes
            lea esi, array1+0       ;; esi = endere�o do primeiro elemento de array1
            lea edi, array2+0       ;; edi = ender�o do primeiro elemento de array2
            .repeat
            mov eax, [esi]        ;; eax = array1[i]
            mov [edi], eax        ;; array2[i] = array1[i]
            add esi, 4      ;; passa pro pr�ximo elemento de array1
            add edi, 4      ;; passa pro pr�ximo elemento de array2
            .untilcxz
            INVOKE printf, ADDR msgfmt, ADDR msg2
            mov ecx, 20     ;; repetir 20 vezes
            lea esi, array2+0       ;; esi = endere�o do primeiro elemento de array2
            .repeat
            push ecx
            mov eax, [esi]
            mov temp, eax           ;; o elemento atual vai pra temp
            INVOKE printf, ADDR arrayfmt, temp      ;; imprimir os elementos de array2
            add esi, 4      ;; passa pro pr�ximo elemento de array2
            pop ecx
            .untilcxz
            INVOKE printf, ADDR brfmt
            ret
main        endp
            end
