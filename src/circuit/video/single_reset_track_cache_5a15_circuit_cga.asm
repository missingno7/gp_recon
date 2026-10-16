_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _reset_track_cache_5a15
_g_009cc EQU 9cch
_g_009f6 EQU 9f6h
_g_009f8 EQU 9f8h
_g_009fa EQU 9fah
_g_00a04 EQU 0a04h
_g_00a0e EQU 0a0eh
_reset_track_cache_5a15 PROC NEAR
        mov word ptr ds:[_g_009f6], 0ffffh
        mov word ptr ds:[_g_009f8], 0ffffh
        mov word ptr ds:[_g_009fa], 0ffffh
        mov byte ptr ds:[_g_00a0e], 0ffh
        nop
        mov word ptr ds:[_g_00a04], 0ffffh
        mov word ptr ds:[_g_009cc], 0
        ret
_reset_track_cache_5a15 ENDP
_TEXT ENDS
END
