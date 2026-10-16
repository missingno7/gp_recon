_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_743d
_grp_743d PROC NEAR
        push bp
        mov bp, sp
        mov bx, word ptr [bp + 4]
        mov ax, word ptr [bp + 6]
        or bl, bl
        je short $+0fh
        cmp bx, 7fh
        jg short L_7455
        shl bx, 1
        mov word ptr [bx - 7e9ch], ax
L_7455:
        pop bp
        ret
_grp_743d ENDP
_TEXT ENDS
END
