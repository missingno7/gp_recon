_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _draw_point_rows
_g_05e58 EQU 5e58h
_g_06c12 EQU 6c12h
_g_06c14 EQU 6c14h
_g_06c16 EQU 6c16h
_draw_point_rows PROC NEAR
        push bp
        push cx
        mov si, 12c6h
        mov cx, 9
        mov dx, word ptr [bx]
L_6742:
        mov ax, dx
        add ax, word ptr [si]
        sub ax, 101h
        inc si
        inc si
        mov bl, ah
        xor ah, ah
        xor bh, bh
        mov bp, ax
        shr ax, 1
        shr ax, 1
        shr ax, 1
        mov di, ax
        shl bx, 1
        add bx, word ptr ds:[_g_05e58]
        add di, word ptr cs:[bx]
        and bp, 7
        mov al, byte ptr [bp + 6c38h]
        mov es, word ptr ds:[_g_06c12]
        or byte ptr es:[di], al
        mov es, word ptr ds:[_g_06c14]
        or byte ptr es:[di], al
        mov es, word ptr ds:[_g_06c16]
        or byte ptr es:[di], al
        loop short L_6742
        pop cx
        pop bp
        ret
_draw_point_rows ENDP
_TEXT ENDS
END
