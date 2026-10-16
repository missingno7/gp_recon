_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _read_timer_counter
_g_07fe8 EQU 7fe8h
_g_07fea EQU 7feah
_read_timer_counter PROC NEAR
        cli
        mov ax, word ptr ds:[_g_07fe8]
        mov dx, word ptr ds:[_g_07fea]
        sti
        ret
_read_timer_counter ENDP
_TEXT ENDS
END
