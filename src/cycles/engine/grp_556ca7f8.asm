        EXTRN   _FN_CYCLES_CGA_09F92:FAR, _FN_CYCLES_CGA_12316:FAR
        EXTRN   _FN_CYCLES_CGA_059C2:FAR, _FN_CYCLES_CGA_05ADA:FAR
        EXTRN   _FN_CYCLES_CGA_07224:FAR, _GRP_71323DE6:FAR
        EXTRN   _CYCLES_MAIN_TEXT:FAR
_CSEG_A7F8 SEGMENT PARA PUBLIC 'CODE'
        EXTRN   _FN_CYCLES_CGA_02944:NEAR
        ASSUME  CS:_CSEG_A7F8
        PUBLIC  _grp_556ca7f8
_grp_556ca7f8 PROC NEAR
        mov ax, 0
        push ax
        mov ax, 41
        push ax
        mov ax, 88
        push ax
        call FAR PTR _FN_CYCLES_CGA_09F92
        add sp, 6
        mov word ptr ds:[17796], ax
        mov word ptr ds:[17798], dx
        mov bx, ax
        mov es, dx
        mov ax, word ptr es:[bx + 2]
        mov cx, word ptr es:[bx]
        mov word ptr ds:[17800], cx
        mov word ptr ds:[458ah], ax
        mov ax, 0
        push ax
        mov ax, 0a3h
        push ax
        mov ax, 320
        push ax
        call FAR PTR _FN_CYCLES_CGA_09F92
        add sp, 6
        mov word ptr ds:[457ah], ax
        mov word ptr ds:[457ch], dx
        mov bx, ax
        mov es, dx
        mov ax, word ptr es:[bx + 2]
        mov cx, word ptr es:[bx]
        mov dx, word ptr es:[bx + 0ah]
        mov word ptr ds:[457eh], cx
        mov word ptr ds:[17792], ax
        mov word ptr ds:[17794], dx
        mov bx, word ptr ds:[0b9eah]
        mov ax, word ptr es:[bx + 2]
        mov word ptr ds:[458eh], ax
        mov ax, word ptr es:[bx]
        mov word ptr ds:[458ch], ax
        mov ax, word ptr es:[bx + 0ah]
        mov word ptr ds:[17808], ax
        mov ax, 0fh
        push ax
        mov ax, 4bh
        push ax
        mov ax, 112
        push ax
        call FAR PTR _FN_CYCLES_CGA_09F92
        add sp, 6
        mov word ptr ds:[456ah], ax
        mov word ptr ds:[456ch], dx
        mov bx, ax
        mov es, dx
        mov ax, word ptr es:[bx + 2]
        mov cx, word ptr es:[bx]
        mov dx, word ptr es:[bx + 0ah]
        mov word ptr ds:[456eh], cx
        mov word ptr ds:[17776], ax
        mov word ptr ds:[17778], dx
        mov bx, 598ch
        push bx
        mov bx, 22886
        push bx
        push word ptr ds:[0b476h]
        push word ptr ds:[0b474h]
        call FAR PTR _FN_CYCLES_CGA_12316
        add sp, 8
        mov bx, 47c8h
        push bx
        mov bx, 45feh
        push bx
        push word ptr ds:[0b436h]
        push word ptr ds:[0b434h]
        call FAR PTR _FN_CYCLES_CGA_12316
        add sp, 8
        mov bx, 53cch
        push bx
        mov bx, 4dfeh
        push bx
        push word ptr ds:[0b798h]
        push word ptr ds:[0b796h]
        call FAR PTR _FN_CYCLES_CGA_12316
        add sp, 8
        mov bx, 4f60h
        push bx
        mov bx, 18832
        push bx
        push word ptr ds:[0b792h]
        push word ptr ds:[0b790h]
        call FAR PTR _FN_CYCLES_CGA_12316
        add sp, 8
        mov bx, 574ah
        push bx
        mov bx, 552ch
        push bx
        push word ptr ds:[0b7e4h]
        push word ptr ds:[0b7e2h]
        call FAR PTR _FN_CYCLES_CGA_12316
        add sp, 8
        call FAR PTR _FN_CYCLES_CGA_059C2
        mov ax, SEG _CYCLES_MAIN_TEXT
        mov es, ax
        mov ax, 6aeh
        push es
        push ax
        call FAR PTR _FN_CYCLES_CGA_05ADA
        add sp, 4
        push ds
        mov ax, 21c6h
        push ax
        call FAR PTR _FN_CYCLES_CGA_07224
        add sp, 4
        mov al, 5
        cbw
        mov word ptr ds:[45d4h], ax
        mov word ptr ds:[45d2h], ax
        mov ax, 4630
        push cs
        push ax
        call FAR PTR _FN_CYCLES_CGA_05ADA
        add sp, 4
        call _FN_CYCLES_CGA_02944
        call FAR PTR _GRP_71323DE6
        mov word ptr ds:[0c892h], ax
        ret
_grp_556ca7f8 ENDP
_CSEG_A7F8 ENDS
        END
