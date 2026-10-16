.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
PUBLIC _read_far_word_offset4
_read_far_word_offset4 PROC NEAR
    push bp
    mov bp, sp
    push si
    mov es, WORD PTR [bp+6]
    mov si, WORD PTR [bp+4]
    mov ax, WORD PTR ES:[si+4]
    pop si
    pop bp
    ret
_read_far_word_offset4 ENDP
_TEXT ENDS
END
