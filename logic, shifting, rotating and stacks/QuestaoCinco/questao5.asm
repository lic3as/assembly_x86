; Simule o sistema de segurança de um alarme de incêndio, onde é possível que qualquer um dos três primeiros itens de alta prioridade aconteçam ao mesmo tempo. Embora os três últimos itens possam também ocorrem ao mesmo tempo, o programa deve verificar e enviar mensagens para eles somente quando nenhum dos primeiros três itens tiver ocorrido.
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
msg0        byte "Fire alarm",0
msg1        byte "Carbon monoxide",0
msg2        byte "Power outage",0
msg3        byte "Gate unlocked",0
msg4        byte "Door open",0
msg5        byte "Window open",0
dsb         sdword  ?
danger      sdword  0

            .code
main        proc
            INVOKE printf, ADDR msginfmt, ADDR msgin
            INVOKE scanf, ADDR in1fmt, ADDR dsb
            test dsb,00000001b 
            .if !ZERO? 
            INVOKE printf, ADDR msgsfmt, ADDR msg0
            inc danger
            .endif
            test dsb,00000010b
            .if !ZERO?
            INVOKE printf, ADDR msgsfmt, ADDR msg1
            inc danger
            .endif
            test dsb,00000100b
            .if !ZERO? 
            INVOKE printf, ADDR msgsfmt, ADDR msg2
            inc danger
            .endif
            .if !danger
            test dsb,00001000b
            .if !ZERO? 
            INVOKE printf, ADDR msgsfmt, ADDR msg3
            .endif
            test dsb,00010000b
            .if !ZERO? 
            INVOKE printf, ADDR msgsfmt, ADDR msg4
            .endif
            test dsb,00100000b
            .if !ZERO? 
            INVOKE printf, ADDR msgsfmt, ADDR msg5
            .endif
            .endif
            ret
main        endp
            end
