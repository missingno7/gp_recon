_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_76e5
_g_08398 EQU 8398h
_g_0839e EQU 839eh
_g_083b6 EQU 83b6h
_grp_76e5 PROC NEAR
        mov ax, word ptr ds:[_g_08398]
        sub ax, word ptr ds:[_g_0839e]
        mul word ptr ds:[_g_083b6]
        mov al, ah
        mov ah, dl
        sub ax, 1fh
        ret
_grp_76e5 ENDP
_TEXT ENDS
END
