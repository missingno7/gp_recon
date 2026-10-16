.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
PUBLIC _fn_circuit_ega_0de42
_fn_circuit_ega_0de42 PROC NEAR
    push bp
    mov bp, sp
    push si
    mov es, word ptr [bp + 6]
    mov si, word ptr [bp + 4]
    mov ax, word ptr es:[si + 4]
    pop si
    pop bp
    ret
_fn_circuit_ega_0de42 ENDP
_TEXT ENDS
END
