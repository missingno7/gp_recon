_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _speed_update_55b6
_g_05710 EQU 5710h
_g_05eb4 EQU 5eb4h
_g_05edf EQU 5edfh
_g_05ee2 EQU 5ee2h
_g_05eef EQU 5eefh
_g_05f3a EQU 5f3ah
_g_05f3b EQU 5f3bh
_speed_update_55b6 PROC NEAR
        cmp byte ptr ds:[_g_05f3b], 0
        je short L_55E5
        cmp byte ptr ds:[_g_05f3a], 1
        je short L_55E5
        cmp byte ptr ds:[_g_05eb4], 5
        jg short L_55E5
        mov al, byte ptr ds:[_g_05edf]
        mov dl, byte ptr ds:[_g_05eef]
        mul dl
        cmp ax, 320h
        jae short L_55DC
        mov ax, 320h
L_55DC:
        cmp ax, word ptr ds:[_g_05710]
        jg short $++6h
        mov word ptr ds:[_g_05ee2], ax
L_55E5:
        ret
_speed_update_55b6 ENDP
_TEXT ENDS
END
