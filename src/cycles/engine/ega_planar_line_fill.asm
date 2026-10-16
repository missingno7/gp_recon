.8086
BLIT_CYCLES_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:BLIT_CYCLES_TEXT
        db      08B32h dup (0)
        PUBLIC _ega_planar_line_fill
_ega_planar_line_fill PROC FAR
        push    bp
        mov     bp, sp
        sub     sp, 10h
        push    si
        push    di
        mov     ax, word ptr cs:[04E98h]
        shl     ax, 1
        shl     ax, 1
        shl     ax, 1
        mov     word ptr [bp-0Eh], ax
        mov     ax, word ptr cs:[04E96h]
        shl     ax, 1
        shl     ax, 1
        shl     ax, 1
        mov     word ptr [bp-10h], ax
        cld
        mov     si, word ptr [bp+0Ah]
        shl     si, 1
        add     si, word ptr cs:[04E94h]
        mov     word ptr [bp-2], si
        mov     ax, word ptr cs:[04E8Ch]
        mov     es, ax
        cmp     ax, 0A000h
        je      short L_E210
        jmp     near ptr L_E2EC
L_E210:
        mov     dx, 03CEh
        mov     ax, 0205h
        out     dx, ax
L_E217:
        mov     bx, word ptr [bp+8]
        mov     cx, word ptr [bx]
        cmp     cx, word ptr [bp-0Eh]
        jl      short L_E225
        mov     cx, word ptr [bp-0Eh]
        dec     cx
L_E225:
        mov     bx, word ptr [bp+6]
        mov     bx, word ptr [bx]
        cmp     bx, word ptr [bp-10h]
        jge     short L_E232
        mov     bx, word ptr [bp-10h]
L_E232:
        sub     cx, bx
        inc     cx
        jle     short L_E272
        mov     dx, bx
        mov     si, word ptr [bp-2]
        mov     di, word ptr cs:[si]
        shr     dx, 1
        shr     dx, 1
        shr     dx, 1
        add     di, dx
        and     bx, 7
        mov     al, byte ptr [bx-5BE0h]
        xor     ah, ah
        sub     cx, ax
        jg      short L_E28B
        je      short L_E275
        mov     ah, byte ptr [bx-5BF0h]
        add     cx, 7
        mov     bx, cx
        and     ah, byte ptr [bx-5BE8h]
        mov     al, 8
        mov     dx, 03CEh
        out     dx, ax
        mov     ax, word ptr [bp+0Eh]
        mov     ah, byte ptr es:[di]
        mov     byte ptr es:[di], al
L_E272:
        jmp     short L_E2CA
        nop
L_E275:
        mov     ah, byte ptr [bx-5BF0h]
        mov     al, 8
        mov     dx, 03CEh
        out     dx, ax
        mov     ax, word ptr [bp+0Eh]
        mov     ah, byte ptr es:[di]
        mov     byte ptr es:[di], al
        jmp     short L_E2CA
        nop
L_E28B:
        mov     ah, byte ptr [bx-5BF0h]
        mov     al, 8
        mov     dx, 03CEh
        out     dx, ax
        mov     ax, word ptr [bp+0Eh]
        mov     ah, byte ptr es:[di]
        mov     byte ptr es:[di], al
        inc     di
        mov     bx, cx
        shr     cx, 1
        shr     cx, 1
        shr     cx, 1
        je      short L_E2B2
        mov     ax, 0FF08h
        out     dx, ax
        mov     ax, word ptr [bp+0Eh]
        rep     stosb
L_E2B2:
        and     bx, 7
        je      short L_E2CA
        mov     ah, byte ptr [bx-5BE9h]
        mov     al, 8
        mov     dx, 03CEh
        out     dx, ax
        mov     ax, word ptr [bp+0Eh]
        mov     ah, byte ptr es:[di]
        mov     byte ptr es:[di], al
L_E2CA:
        add     word ptr [bp-2], 2
        add     word ptr [bp+6], 2
        add     word ptr [bp+8], 2
        dec     word ptr [bp+0Ch]
        jle     short L_E2DE
        jmp     near ptr L_E217
L_E2DE:
        mov     ax, 0FF08h
        out     dx, ax
        mov     ax, 5
        out     dx, ax
        pop     di
        pop     si
        mov     sp, bp
        pop     bp
        retf
L_E2EC:
        mov     dx, word ptr [bp+0Eh]
        mov     dh, 8
        mov     bx, 6
        mov     word ptr [bp-6], bx
L_E2F7:
        mov     bx, word ptr [bp-6]
        mov     ax, word ptr cs:[bx+04E8Ch]
        or      ax, ax
        jne     short L_E306
        jmp     near ptr L_E3B0
L_E306:
        mov     es, ax
        mov     ax, word ptr [bp+8]
        mov     word ptr [bp-0Ah], ax
        mov     ax, word ptr [bp+6]
        mov     word ptr [bp-8], ax
        mov     ax, word ptr [bp-2]
        mov     word ptr [bp-4], ax
        mov     ax, word ptr [bp+0Ch]
        mov     word ptr [bp-0Ch], ax
        test    dh, dl
        je      short L_E327
        jmp     near ptr L_E3C1
L_E327:
        mov     bx, word ptr [bp-0Ah]
        mov     cx, word ptr [bx]
        mov     bx, word ptr [bp-8]
        mov     bx, word ptr [bx]
        sub     cx, bx
        inc     cx
        jle     short L_E367
        mov     ax, bx
        mov     si, word ptr [bp-4]
        mov     di, word ptr cs:[si]
        shr     ax, 1
        shr     ax, 1
        shr     ax, 1
        add     di, ax
        and     bx, 7
        mov     al, byte ptr [bx-5BE0h]
        xor     ah, ah
        sub     cx, ax
        jg      short L_E376
        je      short L_E36A
        mov     al, byte ptr [bx-5BF0h]
        add     cx, 7
        mov     bx, cx
        and     al, byte ptr [bx-5BE8h]
        not     al
        and     byte ptr es:[di], al
L_E367:
        jmp     short L_E39C
        nop
L_E36A:
        mov     al, byte ptr [bx-5BF0h]
        not     al
        and     byte ptr es:[di], al
        jmp     short L_E39C
        nop
L_E376:
        mov     al, byte ptr [bx-5BF0h]
        not     al
        and     byte ptr es:[di], al
        inc     di
        mov     bx, cx
        shr     cx, 1
        shr     cx, 1
        shr     cx, 1
        je      short L_E38E
        xor     al, al
        rep     stosb
L_E38E:
        and     bx, 7
        je      short L_E39C
        mov     al, byte ptr [bx-5BE9h]
        not     al
        and     byte ptr es:[di], al
L_E39C:
        add     word ptr [bp-4], 2
        add     word ptr [bp-8], 2
        add     word ptr [bp-0Ah], 2
        dec     word ptr [bp-0Ch]
        jle     short L_E3B0
        jmp     near ptr L_E327
L_E3B0:
        sub     word ptr [bp-6], 2
        shr     dh, 1
        je      short L_E3BB
        jmp     near ptr L_E2F7
L_E3BB:
        pop     di
        pop     si
        mov     sp, bp
        pop     bp
        retf
L_E3C1:
        mov     bx, word ptr [bp-0Ah]
        mov     cx, word ptr [bx]
        mov     bx, word ptr [bp-8]
        mov     bx, word ptr [bx]
        sub     cx, bx
        inc     cx
        jle     short L_E3FF
        mov     ax, bx
        mov     si, word ptr [bp-4]
        mov     di, word ptr cs:[si]
        shr     ax, 1
        shr     ax, 1
        shr     ax, 1
        add     di, ax
        and     bx, 7
        mov     al, byte ptr [bx-5BE0h]
        xor     ah, ah
        sub     cx, ax
        jg      short L_E40C
        je      short L_E402
        mov     al, byte ptr [bx-5BF0h]
        add     cx, 7
        mov     bx, cx
        and     al, byte ptr [bx-5BE8h]
        or      byte ptr es:[di], al
L_E3FF:
        jmp     short L_E430
        nop
L_E402:
        mov     al, byte ptr [bx-5BF0h]
        or      byte ptr es:[di], al
        jmp     short L_E430
        nop
L_E40C:
        mov     al, byte ptr [bx-5BF0h]
        or      byte ptr es:[di], al
        inc     di
        mov     bx, cx
        shr     cx, 1
        shr     cx, 1
        shr     cx, 1
        je      short L_E424
        xor     al, al
        not     al
        rep     stosb
L_E424:
        and     bx, 7
        je      short L_E430
        mov     al, byte ptr [bx-5BE9h]
        or      byte ptr es:[di], al
L_E430:
        add     word ptr [bp-4], 2
        add     word ptr [bp-8], 2
        add     word ptr [bp-0Ah], 2
        dec     word ptr [bp-0Ch]
        jg      short L_E3C1
        jmp     near ptr L_E3B0
_ega_planar_line_fill ENDP
BLIT_CYCLES_TEXT ENDS
END
