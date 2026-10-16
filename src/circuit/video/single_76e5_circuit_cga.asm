_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_76e5
_g_07c72 EQU 7c72h
_g_07c78 EQU 7c78h
_g_07c90 EQU 7c90h
_grp_76e5 PROC NEAR
        mov ax, word ptr ds:[_g_07c72]
        sub ax, word ptr ds:[_g_07c78]
        mul word ptr ds:[_g_07c90]
        mov al, ah
        mov ah, dl
        sub ax, 1fh
        ret
_grp_76e5 ENDP
_TEXT ENDS
END
