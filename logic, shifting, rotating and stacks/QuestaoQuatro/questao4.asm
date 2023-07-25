; Assuma que um registrador de status em um processador indica o estado atual de uma copiadora. Para cada bit, emita uma mensagem apropriada indicando o status da máquina. Embora possa haver mais de um bit definido ao mesmo tempo, apenas uma mensagem de erro pode ser gerado, onde o bit 0 tem a prioridade mais alta, seguido pelo bit 1, e assim por diante.
; Bit Message:
; 0 - Paper jam
; 1 - Paper misfeed
; 2 - Paper tray empty
; 3 - Toner low
; 4 - Toner empty
            .686
            .model flat,c
            .stack 100h
scanf       PROTO arg2:Ptr Byte, inputlist:VARARG
printf      PROTO arg1:Ptr Byte, printlist:VARARG

            .data
in1fmt      byte "%x",0
msginfmt    byte "%s",0
msgsfmt     byte 0Ah,"%s",0Ah,0
msgin       byte "Enter a hexadecimal number: ",0
msg0        byte "Paper jam",0
msg1        byte "Paper misfeed",0
msg2        byte "Paper tray empty",0
msg3        byte "Toner low",0
msg4        byte "Toner empty",0
dsb         sdword  ?

            .code
main        proc
            INVOKE printf, ADDR msginfmt, ADDR msgin
            INVOKE scanf, ADDR in1fmt, ADDR dsb
            test dsb,00000001b 
            .if !ZERO? 
            INVOKE printf, ADDR msgsfmt, ADDR msg0
            .else
            test dsb,00000010b
            .if !ZERO?
            INVOKE printf, ADDR msgsfmt, ADDR msg1
            .else
            test dsb,00000100b
            .if !ZERO? 
            INVOKE printf, ADDR msgsfmt, ADDR msg2
            .else
            test dsb,00001000b
            .if !ZERO? 
            INVOKE printf, ADDR msgsfmt, ADDR msg3
            .else
            test dsb,00010000b
            .if !ZERO? 
            INVOKE printf, ADDR msgsfmt, ADDR msg4
            .endif
            .endif
            .endif
            .endif
            .endif
            ret
main        endp
            end
