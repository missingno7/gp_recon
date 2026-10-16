_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _copy_lap_counter_5ae6
_g_0033c EQU 33ch
_g_09ba4 EQU 9ba4h
_copy_lap_counter_5ae6 PROC NEAR
        mov ax, word ptr ds:[_g_0033c]
        mov word ptr ds:[_g_09ba4], ax
        ret
_copy_lap_counter_5ae6 ENDP
_TEXT ENDS
END
