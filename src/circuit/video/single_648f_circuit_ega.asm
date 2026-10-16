_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_648f
_g_00d12 EQU 0d12h
_grp_648f PROC NEAR
        mov bx, 0d28h
        mov di, 0d14h
        mov word ptr ds:[_g_00d12], 1f4h
        mov cx, 9
L_649E:
        mov ax, word ptr [bx - 2]
        sub ax, word ptr [bx]
        mov word ptr [di], ax
        inc bx
        inc bx
        inc di
        inc di
        loop short L_649E
        ret
_grp_648f ENDP
_TEXT ENDS
END
