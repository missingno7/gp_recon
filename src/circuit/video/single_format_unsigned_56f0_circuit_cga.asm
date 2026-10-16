_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _format_unsigned_56f0
EXTRN _GRP_7644DE05:NEAR
_format_unsigned_56f0 PROC NEAR
        push bp
        mov bp, sp
        mov ax, word ptr [bp + 4]
        mov bx, 9a2h
        call _GRP_7644DE05
        mov byte ptr [bx + 2], 0
        mov ax, bx
        pop bp
        ret
_format_unsigned_56f0 ENDP
_TEXT ENDS
END
