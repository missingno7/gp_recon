_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _configure_display_564d
_CS_G_0C7C6 EQU 0c7c6h
_CS_G_0C7C8 EQU 0c7c8h
_CS_G_0C7CC EQU 0c7cch
_g_05e50 EQU 5e50h
EXTRN _FN_CIRCUIT_EGA_08CD8:NEAR
_configure_display_564d PROC NEAR
        push cs
        push word ptr ds:[_g_05e50]
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        mov word ptr cs:[_CS_G_0C7CC], 6fh
        mov word ptr cs:[_CS_G_0C7C6], 0
        mov word ptr cs:[_CS_G_0C7C8], 28h
        ret
_configure_display_564d ENDP
_TEXT ENDS
END
