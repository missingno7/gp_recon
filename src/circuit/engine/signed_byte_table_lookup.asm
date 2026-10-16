.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
EXTRN _g_cir_5d52:BYTE
PUBLIC _signed_byte_table_lookup
_signed_byte_table_lookup PROC NEAR
    push bx
    or ax, ax
    jg short positive
    neg ax
    mov bx, ax
    mov al, ds:_g_cir_5d52[bx]
    xor ah, ah
    neg ax
    pop bx
    ret
positive:
    mov bx, ax
    mov al, ds:_g_cir_5d52[bx]
    xor ah, ah
    pop bx
    ret
_signed_byte_table_lookup ENDP
_TEXT ENDS
END
