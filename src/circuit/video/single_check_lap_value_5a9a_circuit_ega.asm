_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _check_lap_value_5a9a
_g_00a12 EQU 0a12h
_g_05eef EQU 5eefh
_check_lap_value_5a9a PROC NEAR
        mov al, byte ptr ds:[_g_05eef]
        cmp al, byte ptr ds:[_g_00a12]
        jne short $++3h
        ret
_check_lap_value_5a9a ENDP
_TEXT ENDS
END
