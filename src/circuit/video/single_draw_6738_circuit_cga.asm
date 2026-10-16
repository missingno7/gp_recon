_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _draw_point_rows
_g_05e54 EQU 5e54h
_draw_point_rows PROC NEAR
        push bp
        push cx
        mov si, 12c2h
        mov cx, 9
        mov dx, word ptr [bx]
L_65E8:
        mov ax, dx
        add ax, word ptr [si]
        sub ax, 101h
        inc si
        inc si
        mov bl, ah
        xor ah, ah
        xor bh, bh
        shl bx, 1
        add bx, word ptr ds:[_g_05e54]
        mov di, word ptr cs:[bx]
        mov bp, ax
        sar bp, 1
        sar bp, 1
        add di, bp
        and ax, 3
        mov bx, ax
        mov al, byte ptr es:[di]
        or al, byte ptr [bx + 6c14h]
        stosb byte ptr es:[di], al
        loop short L_65E8
        pop cx
        pop bp
        ret
_draw_point_rows ENDP
_TEXT ENDS
END
