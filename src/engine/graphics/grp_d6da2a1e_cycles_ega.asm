.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
PIXEL_FILL_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:PIXEL_FILL_TEXT, DS:DGROUP
        EXTRN _G_84F8:BYTE
        PUBLIC _grp_d6da2a1e
_grp_d6da2a1e PROC NEAR
        cmp bx, 0
        jne short pattern_rows
        mov bx, cx
        xor ax, ax
zero_rows:
        mov cx, dx
zero_inner:
        mov ah, byte ptr es:[di]
        stosb
        loop short zero_inner
        add di, bx
        dec si
        jg short zero_rows
        ret
pattern_rows:
        mov dh, byte ptr cs:[bx+_G_84F8]
        cmp dl, 1
        je short one_row
        dec dl
        mov bx, cx
        xor ch, ch
        xor al, al
partial_rows:
        mov cl, byte ptr es:[di]
        and cl, dh
        mov byte ptr es:[di], cl
        inc di
        mov cl, dl
fill_interior:
        mov ah, byte ptr es:[di]
        mov byte ptr es:[di], al
        inc di
        loop short fill_interior
        mov cl, byte ptr es:[di]
        not dh
        and cl, dh
        not dh
        mov byte ptr es:[di], cl
        add di, bx
        dec si
        jg short partial_rows
        ret
one_row:
        mov bx, cx
        mov cx, si
        mov ah, dh
        not ah
one_row_loop:
        mov dl, byte ptr es:[di]
        and dl, dh
        mov byte ptr es:[di], dl
        inc di
        mov dl, byte ptr es:[di]
        and dl, ah
        mov byte ptr es:[di], dl
        add di, bx
        loop short one_row_loop
        ret
_grp_d6da2a1e ENDP
PIXEL_FILL_TEXT ENDS
        END
