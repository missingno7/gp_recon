_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _show_display_566e
_CS_G_0C7CC EQU 0c7cch
_g_05e54 EQU 5e54h
_g_05e56 EQU 5e56h
EXTRN _FN_CIRCUIT_EGA_05641:NEAR
EXTRN _FN_CIRCUIT_EGA_0A6DC:NEAR
_show_display_566e PROC NEAR
        call _FN_CIRCUIT_EGA_05641
        mov word ptr cs:[_CS_G_0C7CC], 6fh
        push word ptr ds:[_g_05e56]
        push word ptr ds:[_g_05e54]
        call _FN_CIRCUIT_EGA_0A6DC
        add sp, 4
        ret
_show_display_566e ENDP
_TEXT ENDS
END
