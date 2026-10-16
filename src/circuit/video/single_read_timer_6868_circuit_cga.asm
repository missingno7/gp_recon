_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _read_timer_counter
_g_0789a EQU 789ah
_g_0789c EQU 789ch
_read_timer_counter PROC NEAR
        cli
        mov ax, word ptr ds:[_g_0789a]
        mov dx, word ptr ds:[_g_0789c]
        sti
        ret
_read_timer_counter ENDP
_TEXT ENDS
END
