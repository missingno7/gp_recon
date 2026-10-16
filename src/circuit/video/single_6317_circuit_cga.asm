_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_6317
_g_0006e EQU 6eh
_grp_6317 PROC NEAR
        mov bx, word ptr [bp + 0c6eh]
        cmp bx, word ptr [bp + 0ce6h]
        jg short $++27h
        je short L_61E3
        shr bx, 1
        shr bx, 1
        shr bx, 1
        add bx, word ptr ds:[_g_0006e]
        add bx, word ptr [bp + 0d72h]
        shl bx, 1
        mov bx, word ptr [bx + 0d86h]
        add word ptr [bp + 0c6eh], bx
        jl short $++3h
L_61E3:
        ret
_grp_6317 ENDP
_TEXT ENDS
END
