.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        db      6550h dup (0)
        PUBLIC _cga_line_fill
_cga_line_fill PROC FAR
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        push    di
        cld
        mov     dx, word ptr [bp+000Eh]
        mov     si, word ptr [bp+000Ah]
        test    si, 1
        jne     short L_BAB7
        xchg    dh, dl
L_BAB7:
        shl     si, 1
        add     si, word ptr cs:[480Ah]
        mov     word ptr [bp-2], si
        mov     ax, word ptr cs:[4802h]
        mov     es, ax
L_BAC7:
        mov     bx, word ptr [bp+8]
        mov     cx, word ptr [bx]
        mov     bx, word ptr [bp+6]
        mov     bx, word ptr [bx]
        sub     cx, bx
        inc     cx
        jle     short L_BB0C
        mov     ax, bx
        mov     si, word ptr [bp-2]
        mov     di, word ptr cs:[si]
        shr     ax, 1
        shr     ax, 1
        add     di, ax
        and     bx, 3
        mov     al, byte ptr [bx-5ACAh]
        xor     ah, ah
        sub     cx, ax
        jg      short L_BB22
        je      short L_BB0F
        mov     al, byte ptr [bx-5AD2h]
        add     cx, 3
        mov     bx, cx
        and     al, byte ptr [bx-5ACEh]
        mov     ah, al
        not     ah
        and     al, dl
        and     byte ptr es:[di], ah
        or      byte ptr es:[di], al
L_BB0C:
        jmp     short L_BB54
        nop
L_BB0F:
        mov     al, byte ptr [bx-5AD2h]
        mov     ah, al
        not     ah
        and     al, dl
        and     byte ptr es:[di], ah
        or      byte ptr es:[di], al
        jmp     short L_BB54
        nop
L_BB22:
        mov     al, byte ptr [bx-5AD2h]
        mov     ah, al
        not     ah
        and     al, dl
        and     byte ptr es:[di], ah
        or      byte ptr es:[di], al
        inc     di
        mov     bx, cx
        shr     cx, 1
        shr     cx, 1
        je      short L_BB3F
        mov     al, dl
        rep     stosb
L_BB3F:
        and     bx, 3
        je      short L_BB54
        mov     al, byte ptr [bx-5ACFh]
        mov     ah, al
        not     ah
        and     al, dl
        and     byte ptr es:[di], ah
        or      byte ptr es:[di], al
L_BB54:
        add     word ptr [bp-2], 2
        add     word ptr [bp+6], 2
        add     word ptr [bp+8], 2
        xchg    dh, dl
        dec     word ptr [bp+000Ch]
        jle     short L_BB6A
        jmp     near ptr L_BAC7
L_BB6A:
        pop     di
        pop     si
        mov     sp, bp
        pop     bp
        retf
_cga_line_fill ENDP
_TEXT ENDS
END
