_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_73e4
_g_0836e EQU 836eh
_grp_73e4 PROC NEAR
        push bp
        mov bp, sp
        cli
        cmp byte ptr ds:[_g_0836e], 0
        je short $+5h
        sti
        pop bp
        ret
_grp_73e4 ENDP
_TEXT ENDS
END
