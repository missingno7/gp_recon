.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
PUBLIC _mark_file_flag
_mark_file_flag PROC NEAR
    push bp
    mov bp, sp
    mov bx, word ptr [bp + 4]
    or bx, bx
    je mark_done
    or byte ptr [bx - 2], 1
mark_done:
    mov sp, bp
    pop bp
    ret
_mark_file_flag ENDP
_TEXT ENDS
END
