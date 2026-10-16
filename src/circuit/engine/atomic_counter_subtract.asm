.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
EXTRN _g_cir_7fe4:WORD
EXTRN _g_cir_7fe6:WORD
PUBLIC _fn_circuit_ega_08bfc
_fn_circuit_ega_08bfc PROC NEAR
    push bp
    mov bp, sp
    mov bx, [bp+4]
    mov cx, [bp+6]
    cli
    mov ax, ds:_g_cir_7fe4
    mov dx, ds:_g_cir_7fe6
    sti
    sub ax, bx
    sbb dx, cx
    pop bp
    ret
_fn_circuit_ega_08bfc ENDP
_TEXT ENDS
END
