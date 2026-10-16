_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_6e10
_g_098d4 EQU 98d4h
_g_098d6 EQU 98d6h
_g_098e0 EQU 98e0h
_g_09b76 EQU 9b76h
_g_09c8e EQU 9c8eh
EXTRN _FN_CIRCUIT_CGA_0BADE:NEAR
_grp_6e10 PROC NEAR
        cmp word ptr ds:[_g_09c8e], 0
        je short L_769B
        push word ptr ds:[_g_09b76]
        push word ptr ds:[_g_098d6]
        mov ax, word ptr ds:[_g_098e0]
        mov cl, 3
        shl ax, cl
        add ax, word ptr ds:[_g_098d4]
        push ax
        call _FN_CIRCUIT_CGA_0BADE
        add sp, 6
L_769B:
        ret
_grp_6e10 ENDP
_TEXT ENDS
END
