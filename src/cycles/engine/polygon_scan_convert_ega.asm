.8086
EXTRN _fn_cycles_ega_0d69a:NEAR
EXTRN _fn_cycles_ega_0d6c4:NEAR
EXTRN _ega_planar_line_fill:FAR
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        db      07D80h dup (0)
        PUBLIC _polygon_scan_convert
_polygon_scan_convert PROC FAR
        push    bp
        mov     bp, sp
        sub     sp, 0798h
        push    si
        push    di
        mov     ax, ss
        mov     es, ax
        mov     ax, word ptr cs:[4E96h]
        shl     ax, 1
        shl     ax, 1
        shl     ax, 1
        mov     word ptr [bp-4], ax
        mov     ax, word ptr cs:[4E98h]
        shl     ax, 1
        shl     ax, 1
        shl     ax, 1
        dec     ax
        mov     word ptr [bp-2], ax
        lea     ax, [bp+8]
        mov     word ptr [bp-0016h], ax
        mov     ax, word ptr cs:[4E9Ah]
        mov     word ptr [bp-6], ax
        mov     byte ptr [bp-000Ch], 0
        mov     byte ptr [bp-000Eh], 0
        mov     byte ptr [bp-0010h], 0
        mov     word ptr [bp-0014h], 0
        mov     word ptr [bp-0012h], 0
        lea     bx, [bp+8]
L_D46E:
        mov     si, word ptr [bx]
        or      si, si
        je      short L_D4D0
        or      al, byte ptr [si+0010h]
        mov     ah, byte ptr [si+000Fh]
        or      al, ah
        or      ah, ah
        jne     short L_D4CB
        cmp     byte ptr [bp-000Ch], 0
        jne     short L_D4A0
        mov     byte ptr [bp-000Ch], 1
        test    byte ptr [si+0010h], 2
        jne     short L_D4A0
        mov     dx, word ptr [si+6]
        mov     cx, word ptr [si+4]
        add     cx, 8000h
        adc     dx, 0
        mov     word ptr [bp-6], dx
L_D4A0:
        test    byte ptr [si+0010h], 1
        je      short L_D4AB
        mov     word ptr [bp-0014h], 2
L_D4AB:
        test    byte ptr [si+0011h], 1
        je      short L_D4B6
        mov     word ptr [bp-0014h], 1
L_D4B6:
        test    byte ptr [si+0010h], 2
        je      short L_D4C1
        mov     word ptr [bp-0012h], 0
L_D4C1:
        test    byte ptr [si+0011h], 2
        je      short L_D4CB
        or      word ptr [bp-0012h], 2
L_D4CB:
        add     bx, 2
        jmp     short L_D46E
L_D4D0:
        add     bx, 2
L_D4D3:
        mov     si, word ptr [bx]
        or      si, si
        je      short L_D535
        or      al, byte ptr [si+0010h]
        mov     ah, byte ptr [si+000Fh]
        or      al, ah
        or      ah, ah
        jne     short L_D530
        cmp     byte ptr [bp-000Eh], 0
        jne     short L_D505
        mov     byte ptr [bp-000Eh], 1
        test    byte ptr [si+0010h], 1
        jne     short L_D505
        mov     dx, word ptr [si+6]
        mov     cx, word ptr [si+4]
        add     cx, 8000h
        adc     dx, 0
        mov     word ptr [bp-6], dx
L_D505:
        test    byte ptr [si+0010h], 2
        je      short L_D510
        mov     word ptr [bp-0012h], 2
L_D510:
        test    byte ptr [si+0011h], 2
        je      short L_D51B
        mov     word ptr [bp-0012h], 1
L_D51B:
        test    byte ptr [si+0010h], 1
        je      short L_D526
        mov     word ptr [bp-0014h], 0
L_D526:
        test    byte ptr [si+0011h], 1
        je      short L_D530
        or      word ptr [bp-0014h], 2
L_D530:
        add     bx, 2
        jmp     short L_D4D3
L_D535:
        mov     dl, byte ptr [bp-000Eh]
        or      dl, dl
        jne     short L_D547
        cmp     word ptr [bp-0014h], 0
        jne     short L_D547
        mov     word ptr [bp-0014h], 2
L_D547:
        mov     dh, byte ptr [bp-000Ch]
        or      dh, dh
        jne     short L_D559
        cmp     word ptr [bp-0012h], 0
        jne     short L_D559
        mov     word ptr [bp-0012h], 2
L_D559:
        or      dl, dh
        jne     short L_D56C
        and     al, 000Fh
        cmp     al, 000Fh
        jne     short L_D566
        jmp     near ptr L_D601
L_D566:
        pop     di
        pop     si
        mov     sp, bp
        pop     bp
        retf
L_D56C:
        lea     ax, [bp-03D8h]
        mov     word ptr [bp-0018h], ax
        mov     ax, word ptr [bp-6]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-000Ah], ax
L_D57C:
        mov     bx, word ptr [bp-0016h]
        mov     si, word ptr [bx]
        or      si, si
        je      short L_D5B7
        cmp     byte ptr [si+000Fh], 0
        jne     short L_D5B1
        mov     cx, word ptr [si+6]
        mov     ax, word ptr [si+4]
        add     ax, 8000h
        adc     cx, 0
        mov     dx, word ptr [bp-8]
        sub     cx, dx
        jle     short L_D5AB
        mov     ax, word ptr [bp-4]
        lea     di, [bp-03D8h]
        shl     dx, 1
        add     di, dx
        rep stosw
L_D5AB:
        call    near ptr _fn_cycles_ega_0d69a
        mov     word ptr [bp-8], dx
L_D5B1:
        add     word ptr [bp-0016h], 2
        jmp     short L_D57C
L_D5B7:
        lea     ax, [bp-0798h]
        mov     word ptr [bp-0018h], ax
        add     word ptr [bp-0016h], 2
        mov     byte ptr [bp-0010h], 0
L_D5C6:
        mov     bx, word ptr [bp-0016h]
        mov     si, word ptr [bx]
        or      si, si
        je      short L_D601
        cmp     byte ptr [si+000Fh], 0
        jne     short L_D5FB
        mov     cx, word ptr [si+6]
        mov     ax, word ptr [si+4]
        add     ax, 8000h
        adc     cx, 0
        mov     dx, word ptr [bp-000Ah]
        sub     cx, dx
        jle     short L_D5F5
        mov     ax, word ptr [bp-2]
        lea     di, [bp-0798h]
        shl     dx, 1
        add     di, dx
        rep stosw
L_D5F5:
        call    near ptr _fn_cycles_ega_0d6c4
        mov     word ptr [bp-000Ah], dx
L_D5FB:
        add     word ptr [bp-0016h], 2
        jmp     short L_D5C6
L_D601:
        test    word ptr [bp-0012h], 1
        jne     short L_D618
        test    word ptr [bp-0012h], 2
        je      short L_D633
        mov     cx, word ptr cs:[4E9Ch]
        dec     cx
        jmp     short L_D61B
        nop
L_D618:
        mov     cx, word ptr [bp-000Ah]
L_D61B:
        mov     dx, word ptr [bp-8]
        mov     word ptr [bp-8], cx
        sub     cx, dx
        jle     short L_D633
        mov     ax, word ptr [bp-4]
        lea     di, [bp-03D8h]
        inc     dx
        shl     dx, 1
        add     di, dx
        rep stosw
L_D633:
        test    word ptr [bp-0014h], 1
        jne     short L_D64A
        test    word ptr [bp-0014h], 2
        je      short L_D664
        mov     cx, word ptr cs:[4E9Ch]
        dec     cx
        jmp     short L_D64D
        nop
L_D64A:
        mov     cx, word ptr [bp-8]
L_D64D:
        mov     dx, word ptr [bp-000Ah]
        mov     word ptr [bp-000Ah], cx
        sub     cx, dx
        jle     short L_D664
        mov     ax, word ptr [bp-2]
        lea     di, [bp-0798h]
        shl     dx, 1
        add     di, dx
        rep stosw
L_D664:
        mov     ax, word ptr [bp-8]
        cmp     ax, word ptr [bp-000Ah]
        jle     short L_D66F
        mov     ax, word ptr [bp-000Ah]
L_D66F:
        mov     bx, word ptr [bp-6]
        sub     ax, bx
        inc     ax
        jle     short L_D694
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
        call    far ptr _ega_planar_line_fill
        add     sp, 000Ah
L_D694:
        pop     di
        pop     si
        mov     sp, bp
        pop     bp
        retf
_polygon_scan_convert ENDP
_TEXT ENDS
END
