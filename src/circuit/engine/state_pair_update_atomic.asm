.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
EXTRN _g_cir_800a:WORD
EXTRN _g_cir_800c:WORD
EXTRN _g_cir_8018:BYTE
PUBLIC _fn_circuit_ega_08ba1
_fn_circuit_ega_08ba1 PROC NEAR
    push bp
    mov bp, sp
    cli
    mov ax, [bp+6]
    mov ds:_g_cir_800a, ax
    mov ax, [bp+4]
    mov ds:_g_cir_800c, ax
    mov byte ptr ds:_g_cir_8018, 1
    sti
    pop bp
    ret
_fn_circuit_ega_08ba1 ENDP
_TEXT ENDS
END
