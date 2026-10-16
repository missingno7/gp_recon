_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _read_video_state_7066
_read_video_state_7066 PROC NEAR
        push bp
        mov bp, sp
        mov cx, 5
        mov bx, 802eh
        mov ax, word ptr [bp + 4]
L_7072:
        cmp word ptr [bx], ax
        je short $++9h
        add bx, 2
        loop short L_7072
        pop bp
        ret
_read_video_state_7066 ENDP
_TEXT ENDS
END
