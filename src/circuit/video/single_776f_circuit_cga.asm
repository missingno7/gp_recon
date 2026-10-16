_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_776f
_g_00024 EQU 24h
_g_00026 EQU 26h
_g_00058 EQU 58h
_g_0005a EQU 5ah
_g_07ca4 EQU 7ca4h
_g_07ca6 EQU 7ca6h
_g_07ca8 EQU 7ca8h
_g_07caa EQU 7caah
_grp_776f PROC NEAR
        in al, 21h
        mov ah, al
        or al, 3
        out 21h, al
        xor bx, bx
        mov es, bx
        mov bx, word ptr ds:[_g_07ca4]
        or bx, bx
        je short L_824F
        mov word ptr es:[_g_00024], bx
        mov bx, word ptr ds:[_g_07ca6]
        mov word ptr es:[_g_00026], bx
        mov bx, word ptr ds:[_g_07ca8]
        mov word ptr es:[_g_00058], bx
        mov bx, word ptr ds:[_g_07caa]
        mov word ptr es:[_g_0005a], bx
L_824F:
        mov al, ah
        out 21h, al
        ret
_grp_776f ENDP
_TEXT ENDS
END
