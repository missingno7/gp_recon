.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _g_cir_seg0000_df9a:WORD
EXTRN _fn_circuit_ega_0d8ee:NEAR
PUBLIC _fn_circuit_ega_0dff4
_fn_circuit_ega_0dff4 PROC NEAR
    push bp
    mov bp, sp
    mov bx, word ptr [bp + 8]
    shl bx, 1
    mov ax, word ptr cs:_g_cir_seg0000_df9a[bx]
    push word ptr [bp + 6]
    mov dx, word ptr [bp + 4]
    and dx, 0fff8h
    push dx
    push cs
    push ax
    call _fn_circuit_ega_0d8ee
    add sp, 8
    pop bp
    ret
_fn_circuit_ega_0dff4 ENDP
_TEXT ENDS
END
