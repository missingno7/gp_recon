_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _configure_display_564d
_CS_G_0A846 EQU 0a846h
_CS_G_0A848 EQU 0a848h
_CS_G_0A84C EQU 0a84ch
_g_05e4c EQU 5e4ch
EXTRN _FN_CIRCUIT_CGA_0B418:NEAR
_configure_display_564d PROC NEAR
        push cs
        push word ptr ds:[_g_05e4c]
        call _FN_CIRCUIT_CGA_0B418
        add sp, 4
        mov word ptr cs:[_CS_G_0A84C], 6fh
        mov word ptr cs:[_CS_G_0A846], 0
        mov word ptr cs:[_CS_G_0A848], 50h
        ret
_configure_display_564d ENDP
_TEXT ENDS
END
