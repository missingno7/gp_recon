_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_72fc
_g_00010 EQU 10h
EXTRN _GRP_FE15C5CD:NEAR
_grp_72fc PROC NEAR
        xor ax, ax
        push ax
        call _GRP_FE15C5CD
        add sp, 2
        mov ax, 40h
        mov es, ax
        mov ax, word ptr es:[_g_00010]
        and ax, 0ffcfh
        or ax, 10h
        mov word ptr es:[_g_00010], ax
        mov ah, 0
        mov al, 3
        int 10h
        mov ah, 0bh
        mov bx, 0
        int 10h
        ret
_grp_72fc ENDP
_TEXT ENDS
END
