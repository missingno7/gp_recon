.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _template_copy_source:BYTE
PUBLIC _patch_cs_template_26_words
_patch_cs_template_26_words PROC NEAR
    push bp
    mov bp, sp
    push ds
    push di
    push si
    mov si, WORD PTR [bp+4]
    mov ax, cs
    mov es, ax
    lea di, _template_copy_source
    cld
    mov cx, 1Ah
    rep movsw
    pop si
    pop di
    pop ds
    pop bp
    ret
_patch_cs_template_26_words ENDP

PUBLIC _patch_cs_template_13_words
_patch_cs_template_13_words PROC NEAR
    push bp
    mov bp, sp
    push ds
    push si
    push di
    mov ds, WORD PTR [bp+6]
    mov si, WORD PTR [bp+4]
    mov cx, 0Dh
    mov ax, cs
    mov es, ax
    mov di, OFFSET _template_copy_source
    rep movsw
    pop di
    pop si
    pop ds
    pop bp
    ret
_patch_cs_template_13_words ENDP
_TEXT ENDS
END


