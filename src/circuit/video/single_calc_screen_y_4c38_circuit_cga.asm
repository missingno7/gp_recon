_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _calc_screen_y
_g_008e2 EQU 08e2h
_g_008e6 EQU 08e6h
_g_00902 EQU 0902h
_g_05fbe EQU 5fbeh
_g_062f4 EQU 62f4h
_g_062f6 EQU 62f6h
EXTRN _FN_CIRCUIT_CGA_097CC:NEAR
_calc_screen_y PROC NEAR
        mov ax, word ptr ds:[_g_008e6]
        add ax, 0bb8h
        add ax, word ptr ds:[_g_00902]
        sub ax, word ptr ds:[_g_05fbe]
        shr ax, 1
        shr ax, 1
        shr ax, 1
        shr ax, 1
        shr ax, 1
        shr ax, 1
        and ax, 1ffh
        neg ax
        add ax, 16ah
        push word ptr ds:[_g_008e2]
        push ax
        push word ptr ds:[_g_062f6]
        push word ptr ds:[_g_062f4]
        call _FN_CIRCUIT_CGA_097CC
        add sp, 8
        ret
_calc_screen_y ENDP
_TEXT ENDS
END
