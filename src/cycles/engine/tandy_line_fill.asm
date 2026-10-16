.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        db      5F30h dup (0)
        PUBLIC _tandy_line_fill
_tandy_line_fill PROC FAR
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        push    di
        cld
        mov     dx, word ptr [bp+000Eh]
        mov     si, word ptr [bp+000Ah]
        shl     si, 1
        add     si, word ptr cs:[4392h]
        mov     word ptr [bp-2], si
        mov     ax, word ptr cs:[438Ah]
        mov     es, ax
L_B49F:
        mov     bx, word ptr [bp+8]
        mov     cx, word ptr [bx]
        mov     bx, word ptr [bp+6]
        mov     bx, word ptr [bx]
        sub     cx, bx
        inc     cx
        jle     short L_B4E2
        mov     ax, bx
        mov     si, word ptr [bp-2]
        mov     di, word ptr cs:[si]
        shr     ax, 1
        add     di, ax
        and     bx, 1
        mov     al, byte ptr [bx-5BD2h]
        xor     ah, ah
        sub     cx, ax
        jg      short L_B4F8
        je      short L_B4E5
        mov     al, byte ptr [bx-5BD6h]
        add     cx, 3
        mov     bx, cx
        and     al, byte ptr [bx-5BD4h]
        mov     ah, al
        not     ah
        and     al, dl
        and     byte ptr es:[di], ah
        or      byte ptr es:[di], al
L_B4E2:
        jmp     short L_B528
        nop
L_B4E5:
        mov     al, byte ptr [bx-5BD6h]
        mov     ah, al
        not     ah
        and     al, dl
        and     byte ptr es:[di], ah
        or      byte ptr es:[di], al
        jmp     short L_B528
        nop
L_B4F8:
        mov     al, byte ptr [bx-5BD6h]
        mov     ah, al
        not     ah
        and     al, dl
        and     byte ptr es:[di], ah
        or      byte ptr es:[di], al
        inc     di
        mov     bx, cx
        shr     cx, 1
        je      short L_B513
        mov     al, dl
        rep     stosb
L_B513:
        and     bx, 1
        je      short L_B528
        mov     al, byte ptr [bx-5BD5h]
        mov     ah, al
        not     ah
        and     al, dl
        and     byte ptr es:[di], ah
        or      byte ptr es:[di], al
L_B528:
        add     word ptr [bp-2], 2
        add     word ptr [bp+6], 2
        add     word ptr [bp+8], 2
        dec     word ptr [bp+000Ch]
        jle     short L_B53C
        jmp     near ptr L_B49F
L_B53C:
        pop     di
        pop     si
        mov     sp, bp
        pop     bp
        retf
_tandy_line_fill ENDP
_TEXT ENDS
END
