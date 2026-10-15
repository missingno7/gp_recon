.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
EXTRN _g_8017:BYTE
EXTRN _g_8018:BYTE
EXTRN _g_890a:BYTE
EXTRN _g_892d:WORD
EXTRN _g_8925:WORD
EXTRN _g_8929:WORD
EXTRN _g_8927:WORD
EXTRN _g_892b:WORD
PUBLIC _grp_17077521
_grp_17077521 PROC NEAR
    push bp
    mov bp, sp
    cmp byte ptr ds:_g_8017, 3
    jne short done
    mov es, [bp+6]
    mov bx, [bp+4]
    mov ax, [bp+8]
    shl ax, 1
    shl ax, 1
    add bx, ax
    cli
    mov word ptr ds:_g_892d, es
    mov ax, es:[bx]
    mov word ptr ds:_g_8925, ax
    mov word ptr ds:_g_8929, ax
    mov ax, es:[bx+2]
    mov word ptr ds:_g_8927, ax
    mov word ptr ds:_g_892b, ax
    mov byte ptr ds:_g_890a, 1
    mov byte ptr ds:_g_8018, 1
    sti
done:
    pop bp
    ret
_grp_17077521 ENDP
_TEXT ENDS
END
