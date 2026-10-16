_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_6e10
_g_09904 EQU 9904h
_g_09906 EQU 9906h
_g_09910 EQU 9910h
_g_09ba6 EQU 9ba6h
_g_09cbe EQU 9cbeh
EXTRN _FN_CIRCUIT_EGA_0DFF4:NEAR
_grp_6e10 PROC NEAR
        cmp word ptr ds:[_g_09cbe], 0
        je short L_6E31
        push word ptr ds:[_g_09ba6]
        push word ptr ds:[_g_09906]
        mov ax, word ptr ds:[_g_09910]
        mov cl, 3
        shl ax, cl
        add ax, word ptr ds:[_g_09904]
        push ax
        call _FN_CIRCUIT_EGA_0DFF4
        add sp, 6
L_6E31:
        ret
_grp_6e10 ENDP
_TEXT ENDS
END
