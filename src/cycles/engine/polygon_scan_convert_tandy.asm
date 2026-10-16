.8086
EXTRN _fn_cycles_tandy_0af82:NEAR
EXTRN _fn_cycles_tandy_0afac:NEAR
EXTRN _tandy_line_fill:FAR
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        db      057C0h dup (0)
        PUBLIC _polygon_scan_convert
_polygon_scan_convert PROC FAR
        push    bp
        mov     bp, sp
        sub     sp, 0798h
        push    si
        push    di
        mov     ax, ss
        mov     es, ax
        mov     ax, word ptr cs:[4394h]
        shl     ax, 1
        mov     word ptr [bp-4], ax
        mov     ax, word ptr cs:[4396h]
        shl     ax, 1
        dec     ax
        mov     word ptr [bp-2], ax
        lea     ax, [bp+8]
        mov     word ptr [bp-0016h], ax
        mov     ax, word ptr cs:[4398h]
        mov     word ptr [bp-6], ax
        mov     byte ptr [bp-000Ch], 0
        mov     byte ptr [bp-000Eh], 0
        mov     byte ptr [bp-0010h], 0
        mov     word ptr [bp-0014h], 0
        mov     word ptr [bp-0012h], 0
        lea     bx, [bp+8]
L_AD56:
        mov     si, word ptr [bx]
        or      si, si
        je      short L_ADB8
        or      al, byte ptr [si+0010h]
        mov     ah, byte ptr [si+000Fh]
        or      al, ah
        or      ah, ah
        jne     short L_ADB3
        cmp     byte ptr [bp-000Ch], 0
        jne     short L_AD88
        mov     byte ptr [bp-000Ch], 1
        test    byte ptr [si+0010h], 2
        jne     short L_AD88
        mov     dx, word ptr [si+6]
        mov     cx, word ptr [si+4]
        add     cx, 8000h
        adc     dx, 0
        mov     word ptr [bp-6], dx
L_AD88:
        test    byte ptr [si+0010h], 1
        je      short L_AD93
        mov     word ptr [bp-0014h], 2
L_AD93:
        test    byte ptr [si+0011h], 1
        je      short L_AD9E
        mov     word ptr [bp-0014h], 1
L_AD9E:
        test    byte ptr [si+0010h], 2
        je      short L_ADA9
        mov     word ptr [bp-0012h], 0
L_ADA9:
        test    byte ptr [si+0011h], 2
        je      short L_ADB3
        or      word ptr [bp-0012h], 2
L_ADB3:
        add     bx, 2
        jmp     short L_AD56
L_ADB8:
        add     bx, 2
L_ADBB:
        mov     si, word ptr [bx]
        or      si, si
        je      short L_AE1D
        or      al, byte ptr [si+0010h]
        mov     ah, byte ptr [si+000Fh]
        or      al, ah
        or      ah, ah
        jne     short L_AE18
        cmp     byte ptr [bp-000Eh], 0
        jne     short L_ADED
        mov     byte ptr [bp-000Eh], 1
        test    byte ptr [si+0010h], 1
        jne     short L_ADED
        mov     dx, word ptr [si+6]
        mov     cx, word ptr [si+4]
        add     cx, 8000h
        adc     dx, 0
        mov     word ptr [bp-6], dx
L_ADED:
        test    byte ptr [si+0010h], 2
        je      short L_ADF8
        mov     word ptr [bp-0012h], 2
L_ADF8:
        test    byte ptr [si+0011h], 2
        je      short L_AE03
        mov     word ptr [bp-0012h], 1
L_AE03:
        test    byte ptr [si+0010h], 1
        je      short L_AE0E
        mov     word ptr [bp-0014h], 0
L_AE0E:
        test    byte ptr [si+0011h], 1
        je      short L_AE18
        or      word ptr [bp-0014h], 2
L_AE18:
        add     bx, 2
        jmp     short L_ADBB
L_AE1D:
        mov     dl, byte ptr [bp-000Eh]
        or      dl, dl
        jne     short L_AE2F
        cmp     word ptr [bp-0014h], 0
        jne     short L_AE2F
        mov     word ptr [bp-0014h], 2
L_AE2F:
        mov     dh, byte ptr [bp-000Ch]
        or      dh, dh
        jne     short L_AE41
        cmp     word ptr [bp-0012h], 0
        jne     short L_AE41
        mov     word ptr [bp-0012h], 2
L_AE41:
        or      dl, dh
        jne     short L_AE54
        and     al, 000Fh
        cmp     al, 000Fh
        jne     short L_AE4E
        jmp     near ptr L_AEE9
L_AE4E:
        pop     di
        pop     si
        mov     sp, bp
        pop     bp
        retf
L_AE54:
        lea     ax, [bp-03D8h]
        mov     word ptr [bp-0018h], ax
        mov     ax, word ptr [bp-6]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-000Ah], ax
L_AE64:
        mov     bx, word ptr [bp-0016h]
        mov     si, word ptr [bx]
        or      si, si
        je      short L_AE9F
        cmp     byte ptr [si+000Fh], 0
        jne     short L_AE99
        mov     cx, word ptr [si+6]
        mov     ax, word ptr [si+4]
        add     ax, 8000h
        adc     cx, 0
        mov     dx, word ptr [bp-8]
        sub     cx, dx
        jle     short L_AE93
        mov     ax, word ptr [bp-4]
        lea     di, [bp-03D8h]
        shl     dx, 1
        add     di, dx
        rep stosw
L_AE93:
        call    near ptr _fn_cycles_tandy_0af82
        mov     word ptr [bp-8], dx
L_AE99:
        add     word ptr [bp-0016h], 2
        jmp     short L_AE64
L_AE9F:
        lea     ax, [bp-0798h]
        mov     word ptr [bp-0018h], ax
        add     word ptr [bp-0016h], 2
        mov     byte ptr [bp-0010h], 0
L_AEAE:
        mov     bx, word ptr [bp-0016h]
        mov     si, word ptr [bx]
        or      si, si
        je      short L_AEE9
        cmp     byte ptr [si+000Fh], 0
        jne     short L_AEE3
        mov     cx, word ptr [si+6]
        mov     ax, word ptr [si+4]
        add     ax, 8000h
        adc     cx, 0
        mov     dx, word ptr [bp-000Ah]
        sub     cx, dx
        jle     short L_AEDD
        mov     ax, word ptr [bp-2]
        lea     di, [bp-0798h]
        shl     dx, 1
        add     di, dx
        rep stosw
L_AEDD:
        call    near ptr _fn_cycles_tandy_0afac
        mov     word ptr [bp-000Ah], dx
L_AEE3:
        add     word ptr [bp-0016h], 2
        jmp     short L_AEAE
L_AEE9:
        test    word ptr [bp-0012h], 1
        jne     short L_AF00
        test    word ptr [bp-0012h], 2
        je      short L_AF1B
        mov     cx, word ptr cs:[439Ah]
        dec     cx
        jmp     short L_AF03
        nop
L_AF00:
        mov     cx, word ptr [bp-000Ah]
L_AF03:
        mov     dx, word ptr [bp-8]
        mov     word ptr [bp-8], cx
        sub     cx, dx
        jle     short L_AF1B
        mov     ax, word ptr [bp-4]
        lea     di, [bp-03D8h]
        inc     dx
        shl     dx, 1
        add     di, dx
        rep stosw
L_AF1B:
        test    word ptr [bp-0014h], 1
        jne     short L_AF32
        test    word ptr [bp-0014h], 2
        je      short L_AF4C
        mov     cx, word ptr cs:[439Ah]
        dec     cx
        jmp     short L_AF35
        nop
L_AF32:
        mov     cx, word ptr [bp-8]
L_AF35:
        mov     dx, word ptr [bp-000Ah]
        mov     word ptr [bp-000Ah], cx
        sub     cx, dx
        jle     short L_AF4C
        mov     ax, word ptr [bp-2]
        lea     di, [bp-0798h]
        shl     dx, 1
        add     di, dx
        rep stosw
L_AF4C:
        mov     ax, word ptr [bp-8]
        cmp     ax, word ptr [bp-000Ah]
        jle     short L_AF57
        mov     ax, word ptr [bp-000Ah]
L_AF57:
        mov     bx, word ptr [bp-6]
        sub     ax, bx
        inc     ax
        jle     short L_AF7C
        push    word ptr [bp+6]
        push    ax
        push    bx
        shl     bx, 1
        lea     ax, [bp-0798h]
        add     ax, bx
        push    ax
        lea     ax, [bp-03D8h]
        add     ax, bx
        push    ax
        call    far ptr _tandy_line_fill
        add     sp, 000Ah
L_AF7C:
        pop     di
        pop     si
        mov     sp, bp
        pop     bp
        retf
_polygon_scan_convert ENDP
_TEXT ENDS
END
