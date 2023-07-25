; implementar a versão modificada do algoritmo Bubble Sort, que termina a ordenção caso não tenham ocorrido trocas na última passagem pelo array
            .686
            .model  flat, c
            .stack  100h
printf      PROTO   arg1:Ptr Byte, printlist:VARARG
scanf       PROTO   arg2:Ptr Byte, inputlist:VARARG
            .data
msg1fmt     byte    0Ah, "%s", 0
msg2fmt     byte    "%s", 0
msg3fmt     byte    0Ah, "%s", 0Ah, 0Ah, 0
msg4fmt     byte    "   %d", 0Ah, 0
msg5fmt     byte    0Ah, 0
in1fmt      byte    "%d", 0
msg1        byte    "Enter the number of integers to be input: ", 0
msg2        byte    "Enter a integer: ", 0
msg3        byte    "Sorted", 0
n           sdword  ?
array       sdword  100 dup(?)
temp        sdword  ?          
troca       sdword  ?
            .code
main        proc
            INVOKE printf, ADDR msg1fmt, ADDR msg1
            INVOKE scanf, ADDR in1fmt, ADDR n
            INVOKE printf, ADDR msg5fmt
            .if n > 0     ; s� continua se o tamanho for maior que 0
            mov ecx, n  
            mov edi, offset array + 0 
            .repeat       ;; loop para pegar os elementos do array
            push ecx  
            INVOKE printf, ADDR msg2fmt, ADDR msg2
            INVOKE scanf, ADDR in1fmt, ADDR [edi]
            add edi, 4        ;; incrementa pro pr�ximo elemento
            pop ecx 
            .untilcxz 
            .if n > 1         ;; s� vai ordenar se o tamanho for pelo menos 2
            mov ecx, n 
            dec ecx           ;; ecx = tamanho-1
            mov esi, offset array + 0     ;; esi = endere�o do primeiro elemento
            mov troca, 1
            .repeat       ;; loop do BubbleSort
iftroca:    cmp troca, 1        ;; s� vai pro bubblesort se tiver tido troca
            jne endiftr         ;; se n�o vai pro final
thentr:     push ecx
            push esi 
            mov troca, 0      ;; n�o houve trocas ainda
            mov edi, esi      ;; edi = endere�o do primeiro elemento do array
            add edi, 4        ;; edi = endere�o do segundo elemento do array
            .repeat 
            mov eax, [esi]        ;; eax = vet[0]
            .if [edi] > eax       ;; vet[1] > vet[0]?
            mov ebx, [edi]        ;; ebx = vet[1]
            mov [edi], eax        ;; vet[1] = vet[0]
             mov [esi], ebx        ;; vet[0] = vet[1]
            mov troca, 1          ;; houve troca
            .endif
            add esi, 4            ;; passa pro pr�ximo
            add edi, 4
            .untilcxz 
            mov edi, esi              ; edi points to smallest element
            pop esi                   ; esi points to the start element
            mov eax, [esi]            ; move start element to temp
            xchg eax, [edi]           ; exchange start and smallest
            mov [esi], eax            ; move smallest back to start 
            add esi, 4                ; move start index to next
            pop ecx                   ; restore ecx to be decremented
            .untilcxz 
endiftr:    .endif      ;; aqui j� vai come�ar a impress�o
            INVOKE printf, ADDR msg3fmt, ADDR msg3
            mov ecx, n   
            mov esi, offset array + 0 
            .repeat       ;; loop para immprimir array ordenado
            push ecx
            mov eax, [esi]  
            mov temp, eax
            INVOKE printf, ADDR msg4fmt, temp 
            add esi, 4        ;; incrementa pro pr�ximo elemento
            pop ecx 
            .untilcxz
            INVOKE printf, ADDR msg5fmt
            .endif
            ret
main        endp
            end
