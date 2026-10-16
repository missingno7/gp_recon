_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _speed_threshold_5562
_g_00996 EQU 996h
_g_05eb4 EQU 5eb4h
_g_05ee2 EQU 5ee2h
_g_05eef EQU 5eefh
_g_05f3b EQU 5f3bh
_speed_threshold_5562 PROC NEAR
        mov word ptr ds:[_g_00996], cx
        sub cx, word ptr ds:[_g_05ee2]
        cmp cx, 0f574h
        jl short L_5584
        cmp byte ptr ds:[_g_05f3b], 1
        je short L_5595
        cmp cx, 898h
        jl short L_55B5
        shr ch, 1
        mov byte ptr ds:[_g_05eb4], ch
        ret
L_5584:
        mov byte ptr ds:[_g_05eb4], 3
        mov ah, byte ptr ds:[_g_05eef]
        sub ah, 5
        mov byte ptr ds:[_g_05eef], ah
        ret
L_5595:
        cmp cx, 0af0h
        jl short L_55B5
        shr ch, 1
        mov byte ptr ds:[_g_05eb4], ch
        mov ax, word ptr ds:[_g_00996]
        sub ax, 44ch
        mov word ptr ds:[_g_05ee2], ax
        mov ah, byte ptr ds:[_g_05eef]
        add ah, 12h
        mov byte ptr ds:[_g_05eef], ah
L_55B5:
        ret
_speed_threshold_5562 ENDP
_TEXT ENDS
END
