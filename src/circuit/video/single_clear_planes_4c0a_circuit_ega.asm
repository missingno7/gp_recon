_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _clear_planes_4c0a
_g_06c10 EQU 6c10h
_g_06c12 EQU 6c12h
_g_06c14 EQU 6c14h
_g_06c16 EQU 6c16h
_clear_planes_4c0a PROC NEAR
        mov di, word ptr cs:[bx]
        mov dx, di
        mov bx, cx
        mov es, word ptr ds:[_g_06c10]
        xor ax, ax
        rep stosw
        mov cx, bx
        mov di, dx
        mov es, word ptr ds:[_g_06c12]
        rep stosw
        mov cx, bx
        mov di, dx
        mov es, word ptr ds:[_g_06c14]
        rep stosw
        mov cx, bx
        mov di, dx
        mov es, word ptr ds:[_g_06c16]
        rep stosw
        ret
_clear_planes_4c0a ENDP
_TEXT ENDS
END
