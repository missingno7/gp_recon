_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_6558
_g_09ba6 EQU 9ba6h
_grp_6558 PROC NEAR
        cmp word ptr ds:[_g_09ba6], 0
        je short L_6414
        mov bx, 0d0eh
        mov cx, 0ah
L_640B:
        cmp word ptr [bx], 2
        jle short $++7h
        inc bx
        inc bx
        loop short L_640B
L_6414:
        ret
_grp_6558 ENDP
_TEXT ENDS
END
