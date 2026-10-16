.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _fill_raster_rows_ff
_fill_raster_rows_ff PROC NEAR
    cmp bx, 0
    jne fill_done
    mov bx, cx
    mov al, 0ffh
fill_row:
    mov cx, dx
    rep stosb
    add di, bx
    dec si
    jg fill_row
    ret
fill_done:
_fill_raster_rows_ff ENDP
_TEXT ENDS
END
