.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
EGA_FILL_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:EGA_FILL_TEXT, DS:DGROUP
        EXTRN _G_7360:BYTE
        PUBLIC _grp_1499ba74
_grp_1499ba74 PROC NEAR
        cmp bx, 0
        jne short pixels
        mov bx, cx
        xor ax, ax
zero_rows:
        mov cx, dx
        rep stosb
        add di, bx
        dec si
        jg short zero_rows
        ret
pixels:
        mov ah, byte ptr cs:[bx+_G_7360]
        mov dh, ah
        not dh
        test al, 2
        jne short retain_even
        xor ah, ah
retain_even:
        test al, 1
        jne short retain_odd
        xor dh, dh
        dec dl
        inc cx
retain_odd:
        dec dl
        je short one_row
        jl short left_overhang
        mov bx, cx
        xor ch, ch
        xor al, al
row_loop:
        and byte ptr es:[di], ah
        inc di
        mov cl, dl
        rep stosb
        and byte ptr es:[di], dh
        add di, bx
        dec si
        jg short row_loop
        ret
one_row:
        mov bx, cx
        mov cx, si
one_row_loop:
        and byte ptr es:[di], ah
        inc di
        and byte ptr es:[di], dh
        add di, bx
        loop short one_row_loop
        ret
left_overhang:
        mov bx, cx
        mov cx, si
        or ah, dh
left_loop:
        and byte ptr es:[di], ah
        add di, bx
        loop short left_loop
        ret
_grp_1499ba74 ENDP
EGA_FILL_TEXT ENDS
        END
