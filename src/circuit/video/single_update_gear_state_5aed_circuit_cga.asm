_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _update_gear_state_5aed
_g_000ee EQU 0eeh
_update_gear_state_5aed PROC NEAR
        push di
        push si
        push ds
        pop es
        mov bx, word ptr ds:[_g_000ee]
        shl bx, 1
        mov si, word ptr [bx + 5702h]
        mov di, 5708h
        mov cx, 94h
        rep movsb
        pop si
        pop di
        ret
_update_gear_state_5aed ENDP
_TEXT ENDS
END
