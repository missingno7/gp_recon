.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
EXTRN _g_7548:BYTE
EXTRN _g_cir_718a:WORD
PUBLIC _clamp_integrated_offset
_clamp_integrated_offset PROC NEAR
    mov ah, ds:_g_7548
    xor al, al
    sar ax, 1
    sar ax, 1
    add ax, ds:_g_cir_718a
    cmp ax, 5800h
    jg short set_high
    cmp ax, 0A800h
    jge short store_value
    mov ax, 0A800h
    jmp short store_value
    nop
set_high:
    mov ax, 5800h
store_value:
    mov ds:_g_cir_718a, ax
    ret
_clamp_integrated_offset ENDP
_TEXT ENDS
END
