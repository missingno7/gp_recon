.8086
EXTRN _fn_cycles_cga_0b5a2:NEAR
EXTRN _fn_cycles_cga_0b5cc:NEAR
EXTRN _cga_line_fill:FAR
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        db      05DDCh dup (0)
        PUBLIC _polygon_scan_convert
_polygon_scan_convert PROC FAR
        push    bp
        mov     bp, sp
        sub     sp, 0798h
        push    si
        push    di
        mov     ax, ss
        mov     es, ax
        mov     ax, word ptr cs:[480Ch]
        shl     ax, 1
        shl     ax, 1
        mov     word ptr [bp-4], ax
        mov     ax, word ptr cs:[480Eh]
        shl     ax, 1
        shl     ax, 1
        dec     ax
        mov     word ptr [bp-2], ax
        lea     ax, [bp+8]
        mov     word ptr [bp-0016h], ax
        mov     ax, word ptr cs:[4810h]
        mov     word ptr [bp-6], ax
        mov     byte ptr [bp-000Ch], 0
        mov     byte ptr [bp-000Eh], 0
        mov     byte ptr [bp-0010h], 0
        mov     word ptr [bp-0014h], 0
        mov     word ptr [bp-0012h], 0
        lea     bx, [bp+8]
L_B376:
        mov     si, word ptr [bx]
        or      si, si
        je      short L_B3D8
        or      al, byte ptr [si+0010h]
        mov     ah, byte ptr [si+000Fh]
        or      al, ah
        or      ah, ah
        jne     short L_B3D3
        cmp     byte ptr [bp-000Ch], 0
        jne     short L_B3A8
        mov     byte ptr [bp-000Ch], 1
        test    byte ptr [si+0010h], 2
        jne     short L_B3A8
        mov     dx, word ptr [si+6]
        mov     cx, word ptr [si+4]
        add     cx, 8000h
        adc     dx, 0
        mov     word ptr [bp-6], dx
L_B3A8:
        test    byte ptr [si+0010h], 1
        je      short L_B3B3
        mov     word ptr [bp-0014h], 2
L_B3B3:
        test    byte ptr [si+0011h], 1
        je      short L_B3BE
        mov     word ptr [bp-0014h], 1
L_B3BE:
        test    byte ptr [si+0010h], 2
        je      short L_B3C9
        mov     word ptr [bp-0012h], 0
L_B3C9:
        test    byte ptr [si+0011h], 2
        je      short L_B3D3
        or      word ptr [bp-0012h], 2
L_B3D3:
        add     bx, 2
        jmp     short L_B376
L_B3D8:
        add     bx, 2
L_B3DB:
        mov     si, word ptr [bx]
        or      si, si
        je      short L_B43D
        or      al, byte ptr [si+0010h]
        mov     ah, byte ptr [si+000Fh]
        or      al, ah
        or      ah, ah
        jne     short L_B438
        cmp     byte ptr [bp-000Eh], 0
        jne     short L_B40D
        mov     byte ptr [bp-000Eh], 1
        test    byte ptr [si+0010h], 1
        jne     short L_B40D
        mov     dx, word ptr [si+6]
        mov     cx, word ptr [si+4]
        add     cx, 8000h
        adc     dx, 0
        mov     word ptr [bp-6], dx
L_B40D:
        test    byte ptr [si+0010h], 2
        je      short L_B418
        mov     word ptr [bp-0012h], 2
L_B418:
        test    byte ptr [si+0011h], 2
        je      short L_B423
        mov     word ptr [bp-0012h], 1
L_B423:
        test    byte ptr [si+0010h], 1
        je      short L_B42E
        mov     word ptr [bp-0014h], 0
L_B42E:
        test    byte ptr [si+0011h], 1
        je      short L_B438
        or      word ptr [bp-0014h], 2
L_B438:
        add     bx, 2
        jmp     short L_B3DB
L_B43D:
        mov     dl, byte ptr [bp-000Eh]
        or      dl, dl
        jne     short L_B44F
        cmp     word ptr [bp-0014h], 0
        jne     short L_B44F
        mov     word ptr [bp-0014h], 2
L_B44F:
        mov     dh, byte ptr [bp-000Ch]
        or      dh, dh
        jne     short L_B461
        cmp     word ptr [bp-0012h], 0
        jne     short L_B461
        mov     word ptr [bp-0012h], 2
L_B461:
        or      dl, dh
        jne     short L_B474
        and     al, 000Fh
        cmp     al, 000Fh
        jne     short L_B46E
        jmp     near ptr L_B509
L_B46E:
        pop     di
        pop     si
        mov     sp, bp
        pop     bp
        retf
L_B474:
        lea     ax, [bp-03D8h]
        mov     word ptr [bp-0018h], ax
        mov     ax, word ptr [bp-6]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-000Ah], ax
L_B484:
        mov     bx, word ptr [bp-0016h]
        mov     si, word ptr [bx]
        or      si, si
        je      short L_B4BF
        cmp     byte ptr [si+000Fh], 0
        jne     short L_B4B9
        mov     cx, word ptr [si+6]
        mov     ax, word ptr [si+4]
        add     ax, 8000h
        adc     cx, 0
        mov     dx, word ptr [bp-8]
        sub     cx, dx
        jle     short L_B4B3
        mov     ax, word ptr [bp-4]
        lea     di, [bp-03D8h]
        shl     dx, 1
        add     di, dx
        rep stosw
L_B4B3:
        call    near ptr _fn_cycles_cga_0b5a2
        mov     word ptr [bp-8], dx
L_B4B9:
        add     word ptr [bp-0016h], 2
        jmp     short L_B484
L_B4BF:
        lea     ax, [bp-0798h]
        mov     word ptr [bp-0018h], ax
        add     word ptr [bp-0016h], 2
        mov     byte ptr [bp-0010h], 0
L_B4CE:
        mov     bx, word ptr [bp-0016h]
        mov     si, word ptr [bx]
        or      si, si
        je      short L_B509
        cmp     byte ptr [si+000Fh], 0
        jne     short L_B503
        mov     cx, word ptr [si+6]
        mov     ax, word ptr [si+4]
        add     ax, 8000h
        adc     cx, 0
        mov     dx, word ptr [bp-000Ah]
        sub     cx, dx
        jle     short L_B4FD
        mov     ax, word ptr [bp-2]
        lea     di, [bp-0798h]
        shl     dx, 1
        add     di, dx
        rep stosw
L_B4FD:
        call    near ptr _fn_cycles_cga_0b5cc
        mov     word ptr [bp-000Ah], dx
L_B503:
        add     word ptr [bp-0016h], 2
        jmp     short L_B4CE
L_B509:
        test    word ptr [bp-0012h], 1
        jne     short L_B520
        test    word ptr [bp-0012h], 2
        je      short L_B53B
        mov     cx, word ptr cs:[4812h]
        dec     cx
        jmp     short L_B523
        nop
L_B520:
        mov     cx, word ptr [bp-000Ah]
L_B523:
        mov     dx, word ptr [bp-8]
        mov     word ptr [bp-8], cx
        sub     cx, dx
        jle     short L_B53B
        mov     ax, word ptr [bp-4]
        lea     di, [bp-03D8h]
        inc     dx
        shl     dx, 1
        add     di, dx
        rep stosw
L_B53B:
        test    word ptr [bp-0014h], 1
        jne     short L_B552
        test    word ptr [bp-0014h], 2
        je      short L_B56C
        mov     cx, word ptr cs:[4812h]
        dec     cx
        jmp     short L_B555
        nop
L_B552:
        mov     cx, word ptr [bp-8]
L_B555:
        mov     dx, word ptr [bp-000Ah]
        mov     word ptr [bp-000Ah], cx
        sub     cx, dx
        jle     short L_B56C
        mov     ax, word ptr [bp-2]
        lea     di, [bp-0798h]
        shl     dx, 1
        add     di, dx
        rep stosw
L_B56C:
        mov     ax, word ptr [bp-8]
        cmp     ax, word ptr [bp-000Ah]
        jle     short L_B577
        mov     ax, word ptr [bp-000Ah]
L_B577:
        mov     bx, word ptr [bp-6]
        sub     ax, bx
        inc     ax
        jle     short L_B59C
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
        call    far ptr _cga_line_fill
        add     sp, 000Ah
L_B59C:
        pop     di
        pop     si
        mov     sp, bp
        pop     bp
        retf
_polygon_scan_convert ENDP
_TEXT ENDS
END
