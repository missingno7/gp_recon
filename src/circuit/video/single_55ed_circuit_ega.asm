_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _speed_convert_55ed
_g_05ede EQU 5edeh
_g_05ee2 EQU 5ee2h
_speed_convert_55ed PROC NEAR
        mov bx, word ptr ds:[_g_05ee2]
        shl bx, 1
        mov bl, bh
        xor bh, bh
        cmp bx, 60h
        jle short L_55FF
        mov bx, 60h
L_55FF:
        xor ah, ah
        mov al, byte ptr [bx + 5730h]
        mov dx, word ptr ds:[_g_05ede]
        mul dh
        mov dx, ax
        ret
_speed_convert_55ed ENDP
_TEXT ENDS
END
