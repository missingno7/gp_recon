_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _show_display_566e
_CS_G_0A84C EQU 0a84ch
_g_05e50 EQU 5e50h
_g_05e52 EQU 5e52h
EXTRN _FN_CIRCUIT_CGA_054F7:NEAR
EXTRN _GRP_FDACD3B7:NEAR
_show_display_566e PROC NEAR
        call _FN_CIRCUIT_CGA_054F7
        mov word ptr cs:[_CS_G_0A84C], 6fh
        push word ptr ds:[_g_05e52]
        push word ptr ds:[_g_05e50]
        call _GRP_FDACD3B7
        add sp, 4
        ret
_show_display_566e ENDP
_TEXT ENDS
END
