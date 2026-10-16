_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_7536
_g_07c22 EQU 7c22h
_grp_7536 PROC NEAR
        cmp byte ptr ds:[_g_07c22], 0
        jne short $+5h
        xor ax, ax
        ret
_grp_7536 ENDP
_TEXT ENDS
END
