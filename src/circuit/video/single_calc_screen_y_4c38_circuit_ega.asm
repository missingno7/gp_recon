_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _calc_screen_y
_g_008e6 EQU 08e6h
_g_008ea EQU 08eah
_g_00906 EQU 0906h
_g_05fda EQU 5fdah
_g_06310 EQU 6310h
_g_06312 EQU 6312h
EXTRN _FN_CIRCUIT_EGA_0A672:NEAR
_calc_screen_y PROC NEAR
        mov ax, word ptr ds:[_g_008ea]
        add ax, 0bb8h
        add ax, word ptr ds:[_g_00906]
        sub ax, word ptr ds:[_g_05fda]
        shr ax, 1
        shr ax, 1
        shr ax, 1
        shr ax, 1
        shr ax, 1
        shr ax, 1
        and ax, 1ffh
        neg ax
        add ax, 16ah
        push word ptr ds:[_g_008e6]
        push ax
        push word ptr ds:[_g_06312]
        push word ptr ds:[_g_06310]
        call _FN_CIRCUIT_EGA_0A672
        add sp, 8
        ret
_calc_screen_y ENDP
_TEXT ENDS
END
