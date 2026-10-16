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
_g_083ca EQU 83cah
_g_083cc EQU 83cch
_g_083ce EQU 83ceh
_g_083d0 EQU 83d0h
_grp_776f PROC NEAR
        in al, 21h
        mov ah, al
        or al, 3
        out 21h, al
        xor bx, bx
        mov es, bx
        mov bx, word ptr ds:[_g_083ca]
        or bx, bx
        je short L_77A3
        mov word ptr es:[_g_00024], bx
        mov bx, word ptr ds:[_g_083cc]
        mov word ptr es:[_g_00026], bx
        mov bx, word ptr ds:[_g_083ce]
        mov word ptr es:[_g_00058], bx
        mov bx, word ptr ds:[_g_083d0]
        mov word ptr es:[_g_0005a], bx
L_77A3:
        mov al, ah
        out 21h, al
        ret
_grp_776f ENDP
_TEXT ENDS
END
