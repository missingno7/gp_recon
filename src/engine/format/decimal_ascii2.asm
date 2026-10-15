; Two-digit decimal conversion observed at all five target entries.
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_TEXT
        PUBLIC  _format_u8_decimal2
_format_u8_decimal2 PROC NEAR
        mov     cl,10
        xor     ah,ah
        div     cl
        add     ah,30h
        mov     [bx+1],ah
        xor     ah,ah
        div     cl
        add     ah,30h
        mov     [bx],ah
        ret
_format_u8_decimal2 ENDP
_TEXT ENDS
        END
