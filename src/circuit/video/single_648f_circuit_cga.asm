_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_648f
_g_00d0e EQU 0d0eh
_grp_648f PROC NEAR
        mov bx, 0d24h
        mov di, 0d10h
        mov word ptr ds:[_g_00d0e], 1f4h
        mov cx, 9
L_6344:
        mov ax, word ptr [bx - 2]
        sub ax, word ptr [bx]
        mov word ptr [di], ax
        inc bx
        inc bx
        inc di
        inc di
        loop short L_6344
        ret
_grp_648f ENDP
_TEXT ENDS
END
