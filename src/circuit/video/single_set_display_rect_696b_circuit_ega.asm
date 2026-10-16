_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _set_display_rect
_CS_G_0C7C6 EQU 0c7c6h
_CS_G_0C7C8 EQU 0c7c8h
_CS_G_0C7CA EQU 0c7cah
_CS_G_0C7CC EQU 0c7cch
_set_display_rect PROC NEAR
        push bp
        mov bp, sp
        mov ax, word ptr [bp + 4]
        mov word ptr cs:[_CS_G_0C7C6], ax
        mov ax, word ptr [bp + 6]
        mov word ptr cs:[_CS_G_0C7C8], ax
        mov ax, word ptr [bp + 8]
        mov word ptr cs:[_CS_G_0C7CA], ax
        mov ax, word ptr [bp + 0ah]
        mov word ptr cs:[_CS_G_0C7CC], ax
        pop bp
        ret
_set_display_rect ENDP
_TEXT ENDS
END
