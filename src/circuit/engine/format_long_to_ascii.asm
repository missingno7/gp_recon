.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN __cltoasub:NEAR
PUBLIC _format_long_to_ascii
_format_long_to_ascii PROC NEAR
    push bp
    mov bp, sp
    push si
    push di
    mov bl, 0
    jmp __cltoasub
_format_long_to_ascii ENDP
_TEXT ENDS
END
