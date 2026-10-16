_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_66b2
_g_00c32 EQU 0c32h
_g_00c46 EQU 0c46h
_g_05ea2 EQU 5ea2h
_g_05ea6 EQU 5ea6h
_grp_66b2 PROC NEAR
        mov ax, word ptr ds:[_g_05ea2]
        mov word ptr ds:[_g_00c46], ax
        mov ax, word ptr ds:[_g_05ea6]
        mov word ptr ds:[_g_00c32], ax
        mov bx, 0
L_6567:
        mov ax, word ptr [bx + 0c46h]
        mov word ptr [bx + 0d4ah], ax
        mov ax, word ptr [bx + 0c32h]
        mov word ptr [bx + 0d5eh], ax
        inc bx
        inc bx
        cmp bx, 14h
        jl short L_6567
        ret
_grp_66b2 ENDP
_TEXT ENDS
END
