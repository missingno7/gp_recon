_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _set_timer_deadline
_g_077ae EQU 77aeh
_g_077b0 EQU 77b0h
EXTRN _FN_CIRCUIT_EGA_06868:NEAR
_set_timer_deadline PROC NEAR
        push bp
        mov bp, sp
        call _FN_CIRCUIT_EGA_06868
        add ax, word ptr [bp + 4]
        adc dx, word ptr [bp + 6]
        mov word ptr ds:[_g_077ae], ax
        mov word ptr ds:[_g_077b0], dx
        pop bp
        ret
_set_timer_deadline ENDP
_TEXT ENDS
END
