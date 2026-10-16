_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _set_text_mode
_set_text_mode PROC NEAR
        push bp
        mov bp, sp
        mov bl, byte ptr [bp + 4]
        mov ah, 0bh
        mov bh, 0
        int 10h
        pop bp
        ret
_set_text_mode ENDP
_TEXT ENDS
END
