bits 16
org 0x7C00

start:
    mov si , msg

.puts:
    lodsb
    cmp al , 0
    je .done

    mov ah , 0x0e
    int 0x10
    jmp puts


.done:
    cli
    hlt

msg db "[boot] booted with success" , 0
times 510 - ( $ - $$ ) db 0
dw 0xAA55
