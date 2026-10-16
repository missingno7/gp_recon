.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _g_cir_seg0000_ba6c:WORD
EXTRN _fn_circuit_cga_0b672:NEAR
PUBLIC _fn_circuit_cga_0bade
_fn_circuit_cga_0bade PROC NEAR
    push bp
    mov bp, sp
    mov bx, word ptr [bp + 8]
    shl bx, 1
    mov ax, word ptr cs:_g_cir_seg0000_ba6c[bx]
    push word ptr [bp + 6]
    mov dx, word ptr [bp + 4]
    and dx, 0fffch
    push dx
    push cs
    push ax
    call _fn_circuit_cga_0b672
    add sp, 8
    pop bp
    ret
_fn_circuit_cga_0bade ENDP
_TEXT ENDS
END
