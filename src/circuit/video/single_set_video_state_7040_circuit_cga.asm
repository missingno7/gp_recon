_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _set_video_state_7040
EXTRN _FN_CIRCUIT_CGA_0B7B6:NEAR
_set_video_state_7040 PROC NEAR
        push bp
        mov bp, sp
        mov cx, 5
        mov bx, 78e0h
L_78E7:
        cmp word ptr [bx], 0
        je short L_78F8
        add bx, 2
        loop short L_78E7
        mov ax, 79b6h
        push ax
        call _FN_CIRCUIT_CGA_0B7B6
L_78F8:
        mov ax, word ptr [bp + 4]
        mov word ptr [bx], ax
        mov word ptr [bx + 2], 0
        pop bp
        ret
_set_video_state_7040 ENDP
_TEXT ENDS
END
