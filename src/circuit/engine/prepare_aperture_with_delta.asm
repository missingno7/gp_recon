.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
EXTRN _grp_e8a09c59:NEAR
EXTRN _g_tail:WORD
EXTRN _G_9F62:WORD
PUBLIC _fn_circuit_ega_0815b
_fn_circuit_ega_0815b PROC NEAR
    push bp
    mov bp, sp
    mov ax, 0A000h
    push ax
    call _grp_e8a09c59
    add sp, 2
    mov ax, word ptr [bp+4]
    mov bx, word ptr ds:_g_tail
    sub word ptr [bx+0Eh], ax
    sub word ptr ds:_G_9F62, ax
    pop bp
    ret
_fn_circuit_ega_0815b ENDP
_TEXT ENDS
END
