_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_6558
_g_09bd6 EQU 9bd6h
_grp_6558 PROC NEAR
        cmp word ptr ds:[_g_09bd6], 0
        je short L_656E
        mov bx, 0d12h
        mov cx, 0ah
L_6565:
        cmp word ptr [bx], 2
        jle short $++7h
        inc bx
        inc bx
        loop short L_6565
L_656E:
        ret
_grp_6558 ENDP
_TEXT ENDS
END
