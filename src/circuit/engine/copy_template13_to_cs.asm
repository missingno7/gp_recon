.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _template_copy_source:BYTE
PUBLIC _copy_template13_to_cs
_copy_template13_to_cs PROC NEAR
    push bp
    mov bp, sp
    push ds
    push si
    push di
    mov ds, word ptr [bp + 6]
    mov si, word ptr [bp + 4]
    mov cx, 0dh
    mov ax, cs
    mov es, ax
    mov di, OFFSET _template_copy_source
    rep movsw
    pop di
    pop si
    pop ds
    pop bp
    ret
_copy_template13_to_cs ENDP
_TEXT ENDS
END
