_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _copy_lap_state_5ad3
_g_05714 EQU 5714h
_g_05716 EQU 5716h
_g_05718 EQU 5718h
_g_0571a EQU 571ah
_g_0571c EQU 571ch
_g_0571e EQU 571eh
_copy_lap_state_5ad3 PROC NEAR
        mov ax, word ptr ds:[_g_05716]
        mov word ptr ds:[_g_05714], ax
        mov ax, word ptr ds:[_g_0571a]
        mov word ptr ds:[_g_05718], ax
        mov ax, word ptr ds:[_g_0571e]
        mov word ptr ds:[_g_0571c], ax
        ret
_copy_lap_state_5ad3 ENDP
_TEXT ENDS
END
