.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
PUBLIC _fn_circuit_ega_0b9d2
_fn_circuit_ega_0b9d2 PROC NEAR
    push bp
    mov bp, sp
    push si
    push di
    sub sp, 0ch
    mov ax, [bp+6]
    mov word ptr ds:[8b4ah], ax
    mov ax, [bp+8]
    mov word ptr ds:[8b4ch], ax
    jmp short $+0bh
    nop
_fn_circuit_ega_0b9d2 ENDP
_TEXT ENDS
END
