.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
PUBLIC _fn_circuit_cga_068ac
_fn_circuit_cga_068ac PROC NEAR
    push bp
    mov bp, sp
    push ds
    push si
    push di
    sub sp, 8
    mov ds, [bp+6]
    mov si, [bp+4]
    mov ax, [bp+8]
    sub ax, [si+4]
    mov [bp-8], ax
    mov ax, [bp+0ah]
    sub ax, [si+6]
    mov [bp-0ah], ax
    ; shared CGA continuation at 0x690c, 0x60 bytes from this entry
    jmp short $+3fh
_fn_circuit_cga_068ac ENDP
_TEXT ENDS
END
