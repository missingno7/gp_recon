_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _check_track_value_5a3a
_g_00a04 EQU 0a04h
_g_09ba4 EQU 9ba4h
_check_track_value_5a3a PROC NEAR
        mov ax, word ptr ds:[_g_09ba4]
        cmp ax, word ptr ds:[_g_00a04]
        jne short $++3h
        ret
_check_track_value_5a3a ENDP
_TEXT ENDS
END
