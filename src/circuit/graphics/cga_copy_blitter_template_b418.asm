.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _fn_circuit_cga_0b418
_fn_circuit_cga_0b418 PROC NEAR
    push bp
    mov bp, sp
    push ds
    push si
    push di
    mov ds, word ptr [bp+6]
    mov si, word ptr [bp+4]
    mov cx, 13
    mov ax, cs
    mov es, ax
    mov di, 0A83Ah
    rep movsw
    pop di
    pop si
    pop ds
    pop bp
    ret
_fn_circuit_cga_0b418 ENDP
_TEXT ENDS
END
