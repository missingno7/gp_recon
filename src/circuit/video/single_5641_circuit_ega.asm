_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _display_state_5641
_g_09b12 EQU 9b12h
EXTRN _FN_CIRCUIT_EGA_08CD8:NEAR
_display_state_5641 PROC NEAR
        push cs
        push word ptr ds:[_g_09b12]
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        ret
_display_state_5641 ENDP
_TEXT ENDS
END
