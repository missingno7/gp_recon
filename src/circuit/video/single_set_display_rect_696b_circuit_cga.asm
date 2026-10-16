_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _set_display_rect
_CS_G_0A846 EQU 0a846h
_CS_G_0A848 EQU 0a848h
_CS_G_0A84A EQU 0a84ah
_CS_G_0A84C EQU 0a84ch
_set_display_rect PROC NEAR
        push bp
        mov bp, sp
        mov ax, word ptr [bp + 4]
        mov word ptr cs:[_CS_G_0A846], ax
        mov ax, word ptr [bp + 6]
        mov word ptr cs:[_CS_G_0A848], ax
        mov ax, word ptr [bp + 8]
        mov word ptr cs:[_CS_G_0A84A], ax
        mov ax, word ptr [bp + 0ah]
        mov word ptr cs:[_CS_G_0A84C], ax
        pop bp
        ret
_set_display_rect ENDP
_TEXT ENDS
END
