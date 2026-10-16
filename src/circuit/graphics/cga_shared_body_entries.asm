.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
PUBLIC _fn_circuit_cga_06666
_fn_circuit_cga_06666 PROC NEAR
    push bp
    mov bp, sp
    push ds
    push di
    push si
    sub sp, 10h
    mov ds, [bp+6]
    mov si, [bp+4]
    mov ax, [bp+8]
    sub ax, [si+4]
    mov [bp-8], ax
    mov ax, [bp+0ah]
    sub ax, [si+6]
    mov [bp-0ah], ax
    ; shared CGA continuation at 0x66c3, 0x5d bytes from this entry
    jmp short $+3ch
_fn_circuit_cga_06666 ENDP
_TEXT ENDS
END
