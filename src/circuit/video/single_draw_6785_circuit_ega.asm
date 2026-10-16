_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _draw_point_6785
_g_05e58 EQU 5e58h
_g_06c10 EQU 6c10h
_g_06c12 EQU 6c12h
_g_06c14 EQU 6c14h
_g_06c16 EQU 6c16h
_draw_point_6785 PROC NEAR
        push cx
        push di
        mov al, byte ptr [bx]
        mov bl, byte ptr [bx + 1]
        xor ah, ah
        xor bh, bh
        cmp ax, 57h
        ja short L_679D
        cmp bx, 25h
        ja short L_679D
        jmp short L_679F
        nop
L_679D:
        push ax
        pop ax
L_679F:
        mov dx, ax
        shr ax, 1
        shr ax, 1
        shr ax, 1
        mov di, ax
        shl bx, 1
        add bx, word ptr ds:[_g_05e58]
        add di, word ptr cs:[bx]
        and dx, 7
        mov bx, dx
        mov al, byte ptr [bx + 6c38h]
        mov es, word ptr ds:[_g_06c10]
        or byte ptr es:[di], al
        mov es, word ptr ds:[_g_06c12]
        or byte ptr es:[di], al
        mov es, word ptr ds:[_g_06c14]
        or byte ptr es:[di], al
        mov es, word ptr ds:[_g_06c16]
        or byte ptr es:[di], al
        pop di
        pop cx
        ret
_draw_point_6785 ENDP
_TEXT ENDS
END
