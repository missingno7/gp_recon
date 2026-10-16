_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _fill_planes_4bcb
_g_05e58 EQU 5e58h
_g_06c10 EQU 6c10h
_g_06c12 EQU 6c12h
_g_06c14 EQU 6c14h
_g_06c16 EQU 6c16h
_fill_planes_4bcb PROC NEAR
        mov bx, word ptr ds:[_g_05e58]
        mov di, word ptr cs:[bx]
        mov dx, di
        mov cx, 4ech
        mov es, word ptr ds:[_g_06c10]
        mov ax, 0ffffh
        rep stosw
        mov cx, 4ech
        mov di, dx
        mov es, word ptr ds:[_g_06c12]
        mov ax, 0ffffh
        rep stosw
        mov cx, 4ech
        mov di, dx
        mov es, word ptr ds:[_g_06c14]
        xor ax, ax
        rep stosw
        mov cx, 4ech
        mov di, dx
        mov es, word ptr ds:[_g_06c16]
        mov ax, 0ffffh
        rep stosw
        ret
_fill_planes_4bcb ENDP
_TEXT ENDS
END
