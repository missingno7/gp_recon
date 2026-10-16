_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_78ea
_g_08b40 EQU 8b40h
_g_08b42 EQU 8b42h
EXTRN _FN_CIRCUIT_EGA_078A0:NEAR
EXTRN _FN_CIRCUIT_EGA_08BF2:NEAR
_grp_78ea PROC NEAR
L_78EA:
        call _FN_CIRCUIT_EGA_078A0
        cmp ax, 0
        jne short L_7905
        call _FN_CIRCUIT_EGA_08BF2
        cmp dx, word ptr ds:[_g_08b42]
        jb short L_78EA
        ja short L_7903
        cmp ax, word ptr ds:[_g_08b40]
        jb short L_78EA
L_7903:
        xor ax, ax
L_7905:
        ret
_grp_78ea ENDP
_TEXT ENDS
END
