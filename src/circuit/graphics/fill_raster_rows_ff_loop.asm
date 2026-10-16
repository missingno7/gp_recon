.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _fill_raster_rows_ff_loop
_fill_raster_rows_ff_loop PROC NEAR
    cmp bx, 0
    jne fill_done
    mov bx, cx
    mov al, 0ffh
fill_row:
    mov cx, dx
fill_pixel:
    mov ah, byte ptr es:[di]
    stosb
    loop fill_pixel
    add di, bx
    dec si
    jg fill_row
    ret
fill_done:
_fill_raster_rows_ff_loop ENDP
_TEXT ENDS
END
