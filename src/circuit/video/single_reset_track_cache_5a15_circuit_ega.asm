_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _reset_track_cache_5a15
_g_009d0 EQU 9d0h
_g_009fa EQU 9fah
_g_009fc EQU 9fch
_g_009fe EQU 9feh
_g_00a08 EQU 0a08h
_g_00a12 EQU 0a12h
_reset_track_cache_5a15 PROC NEAR
        mov word ptr ds:[_g_009fa], 0ffffh
        mov word ptr ds:[_g_009fc], 0ffffh
        mov word ptr ds:[_g_009fe], 0ffffh
        mov byte ptr ds:[_g_00a12], 0ffh
        nop
        mov word ptr ds:[_g_00a08], 0ffffh
        mov word ptr ds:[_g_009d0], 0
        ret
_reset_track_cache_5a15 ENDP
_TEXT ENDS
END
