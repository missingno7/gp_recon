.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _grp_5b2e6dbb:NEAR
PUBLIC _fn_circuit_cga_0a254
_fn_circuit_cga_0a254 PROC NEAR
    push bp
    mov bp, sp
    push ds
    push si
    push di
    sub sp, 8
    mov ds, word ptr [bp+6]
    mov si, word ptr [bp+4]
    mov ax, word ptr [bp+8]
    sub ax, word ptr [si+4]
    mov word ptr [bp-8], ax
    mov ax, word ptr [bp+0Ah]
    sub ax, word ptr [si+6]
    mov word ptr [bp-0Ah], ax
    jmp short _grp_5b2e6dbb+1Eh
_fn_circuit_cga_0a254 ENDP
_TEXT ENDS
END
