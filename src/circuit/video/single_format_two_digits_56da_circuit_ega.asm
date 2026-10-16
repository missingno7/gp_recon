_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _format_two_digits
_format_two_digits PROC NEAR
        mov cl, 0ah
        xor ah, ah
        div cl
        add ah, 30h
        mov byte ptr [bx + 1], ah
        xor ah, ah
        div cl
        add ah, 30h
        mov byte ptr [bx], ah
        ret
_format_two_digits ENDP
_TEXT ENDS
END
