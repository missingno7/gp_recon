.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
EXTRN _g_cir_8b44:WORD
PUBLIC _fn_circuit_ega_08ca6
PUBLIC _fn_circuit_ega_08cbf

_fn_circuit_ega_08ca6 PROC NEAR
    push bp
    mov bp, sp
    push di
    push si
    mov si, OFFSET DGROUP:_g_cir_8b44
    mov di, [bp+4]
    mov ax, ds
    mov es, ax
    cld
    mov cx, 11
    rep movsw
    pop si
    pop di
    pop bp
    ret
_fn_circuit_ega_08ca6 ENDP

_fn_circuit_ega_08cbf PROC NEAR
    push bp
    mov bp, sp
    push di
    push si
    mov si, [bp+4]
    mov ax, ds
    mov es, ax
    mov di, OFFSET DGROUP:_g_cir_8b44
    cld
    mov cx, 11
    rep movsw
    pop si
    pop di
    pop bp
    ret
_fn_circuit_ega_08cbf ENDP
_TEXT ENDS
END


