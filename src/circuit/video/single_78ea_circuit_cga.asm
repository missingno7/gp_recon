_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_78ea
_g_081fc EQU 81fch
_g_081fe EQU 81feh
EXTRN _FN_CIRCUIT_CGA_0834C:NEAR
EXTRN _FN_CIRCUIT_CGA_0AA92:NEAR
_grp_78ea PROC NEAR
L_8396:
        call _FN_CIRCUIT_CGA_0834C
        cmp ax, 0
        jne short L_83B1
        call _FN_CIRCUIT_CGA_0AA92
        cmp dx, word ptr ds:[_g_081fe]
        jb short L_8396
        ja short L_83AF
        cmp ax, word ptr ds:[_g_081fc]
        jb short L_8396
L_83AF:
        xor ax, ax
L_83B1:
        ret
_grp_78ea ENDP
_TEXT ENDS
END
