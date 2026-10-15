.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
PAINT_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:PAINT_TEXT, DS:DGROUP, SS:DGROUP
        EXTRN _G_59D4:WORD, _G_4556:WORD, _G_59D6:WORD
        EXTRN _G_455A:WORD, _G_204A:WORD
        ORG 0F7Ch
back_limit:
        ORG 0F80h
back_full:
        ORG 0F89h
        PUBLIC _grp_404a1943
_grp_404a1943 PROC NEAR
        push ax
        push bp
        push si
        dec ax
        jl short back_limit
        mov word ptr DGROUP:[_G_59D4], bx
        cmp ax, word ptr DGROUP:[_G_4556]
        jge short back_full
        mov bx, ax
        sar ax, 1
        sar ax, 1
        sar ax, 1
        and bx, 7
        mov cx, ax
        sub cx, dx
        jl short back_limit
        mov bp, word ptr DGROUP:[_G_59D6]
        shl bp, 1
        mov ax, word ptr [bp+59B0h]
        and ax, word ptr DGROUP:[_G_59D4]
        or ax, word ptr es:[di]
        dec cx
        jl short final_word
        stosw
        inc dx
        mov ax, word ptr DGROUP:[_G_59D4]
        cmp cx, 0
        je short draw_tail
        add dx, cx
        rep stosw
draw_tail:
        mov word ptr es:[di], cx
final_word:
        mov bp, bx
        shl bp, 1
        and ax, word ptr [bp+59C0h]
        or word ptr es:[di], ax
        inc bx
        cmp bx, 8
        jne short save_row
        inc di
        inc di
        inc dx
        xor bx, bx
        cmp dx, word ptr DGROUP:[_G_455A]
        je short save_row
        mov word ptr es:[di], bx
save_row:
        mov word ptr DGROUP:[_G_59D6], bx
        pop si
        pop bp
        pop ax
        cmp dx, word ptr DGROUP:[_G_455A]
        je short dispatch
        ret
dispatch:
        add sp, 2
        mov bx, word ptr DGROUP:[_G_204A]
        jmp bx
_grp_404a1943 ENDP
PAINT_TEXT ENDS
        END
