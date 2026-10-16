.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _template_copy_source:BYTE
PUBLIC _copy_template_to_cs
_copy_template_to_cs PROC NEAR
    push bp
    mov bp, sp
    push ds
    push di
    push si
    mov si, word ptr [bp + 4]
    mov ax, cs
    mov es, ax
    lea di, _template_copy_source
    cld
    mov cx, 1ah
    rep movsw
    pop si
    pop di
    pop ds
    pop bp
    ret
_copy_template_to_cs ENDP
_TEXT ENDS
END
