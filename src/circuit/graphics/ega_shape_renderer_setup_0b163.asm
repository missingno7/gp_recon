.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _fn_circuit_ega_0b1b6:NEAR
PUBLIC _fn_circuit_ega_0b163
_fn_circuit_ega_0b163 PROC NEAR
    push ds
    push si
    push di
    sub sp, 44h
    mov ds, word ptr [bp + 6]
    mov si, word ptr [bp + 4]
    mov ax, word ptr [bp + 8]
    sub ax, word ptr [si + 4]
    mov word ptr [bp - 8], ax
    mov ax, word ptr [bp + 0ah]
    sub ax, word ptr [si + 6]
    mov word ptr [bp - 0ah], ax
    jmp short _fn_circuit_ega_0b1b6 + 2fh
    nop
_fn_circuit_ega_0b163 ENDP
_TEXT ENDS
END
