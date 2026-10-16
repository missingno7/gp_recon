_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _set_timer_deadline
_g_07786 EQU 7786h
_g_07788 EQU 7788h
EXTRN _FN_CIRCUIT_CGA_06A68:NEAR
_set_timer_deadline PROC NEAR
        push bp
        mov bp, sp
        call _FN_CIRCUIT_CGA_06A68
        add ax, word ptr [bp + 4]
        adc dx, word ptr [bp + 6]
        mov word ptr ds:[_g_07786], ax
        mov word ptr ds:[_g_07788], dx
        pop bp
        ret
_set_timer_deadline ENDP
_TEXT ENDS
END
