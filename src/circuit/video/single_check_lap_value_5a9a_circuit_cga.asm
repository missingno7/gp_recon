_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _check_lap_value_5a9a
_g_00a0e EQU 0a0eh
_g_05ed3 EQU 5ed3h
_check_lap_value_5a9a PROC NEAR
        mov al, byte ptr ds:[_g_05ed3]
        cmp al, byte ptr ds:[_g_00a0e]
        jne short $++3h
        ret
_check_lap_value_5a9a ENDP
_TEXT ENDS
END
