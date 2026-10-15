; Copies the 52-byte code-segment template to the caller's destination.
; The low-address guard loops forever, matching the original loader stub.
.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
PUBLIC _grp_e26c8dbc
_grp_e26c8dbc PROC NEAR
    push bp
    mov bp, sp
    push ds
    push di
    push si
    lea si, cs:[0c7bah]
    mov di, [bp+4]
    cmp di, 1000h
    ja short copy_template
stuck:
    jmp short stuck
copy_template:
    mov ax, ds
    mov es, ax
    mov ax, cs
    mov ds, ax
    cld
    mov cx, 1ah
    rep movsw
    pop si
    pop di
    pop ds
    pop bp
    ret
_grp_e26c8dbc ENDP
_TEXT ENDS
END

