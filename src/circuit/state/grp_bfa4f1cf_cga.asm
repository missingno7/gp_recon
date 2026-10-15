_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_0834C:NEAR
        EXTRN _FN_CIRCUIT_CGA_09B70:NEAR
        EXTRN _FN_CIRCUIT_CGA_0AABD:NEAR
        EXTRN _FN_CIRCUIT_CGA_0AB24:NEAR
        EXTRN _FN_CIRCUIT_CGA_0B418:NEAR
        EXTRN _GRP_0AB05B10:NEAR
        EXTRN _GRP_312E39EB:NEAR
        EXTRN _GRP_3F05A1A6:NEAR
        EXTRN _GRP_7B77C400:NEAR
        EXTRN _GRP_7DE44506:NEAR
        EXTRN _GRP_9D44A3BF:NEAR
        EXTRN _GRP_AA88D69B:NEAR
        EXTRN _GRP_E76F1CA2:NEAR
        EXTRN _GRP_F3A4E254:NEAR
        PUBLIC _grp_bfa4f1cf
_grp_bfa4f1cf PROC NEAR
        push bp
        mov bp, sp
        sub sp, 4ch
        push di
        push si
        mov ax, 9122h
        push ax
        call _GRP_AA88D69B
        add sp, 2
        mov word ptr [bp-4], ax
        mov word ptr [bp-2], dx
L_2294:
        push word ptr ds:[9c00h]
        push word ptr ds:[9bfeh]
        call _FN_CIRCUIT_CGA_0B418
        add sp, 4
        sub ax, ax
        push ax
        call _GRP_E76F1CA2
        add sp, 2
        mov ax, 912ah
        push ax
        push word ptr [bp-2]
        push word ptr [bp-4]
        call _GRP_F3A4E254
        add sp, 6
        push dx
        push ax
        call _GRP_9D44A3BF
        add sp, 4
        sub ax, ax
        push ax
        mov ax, 3
        push ax
        call _FN_CIRCUIT_CGA_0AB24
        add sp, 4
        mov word ptr [bp-4ah], 0
        jmp short L_22F8
        nop
L_22D8:
        mov ax, 12h
        imul word ptr [bp-4ah]
        add ax, 26h
        push ax
        mov ax, 40h
        push ax
        mov bx, word ptr [bp-4ah]
        shl bx, 1
        push word ptr [bx-6488h]
        call _FN_CIRCUIT_CGA_09B70
        add sp, 6
        inc word ptr [bp-4ah]
L_22F8:
        mov ax, word ptr ds:[288h]
        cmp word ptr [bp-4ah], ax
        jl short L_22D8
        cmp ax, 8
        jge short L_2328
        mov ax, 12h
        imul word ptr ds:[288h]
        mov si, ax
        mov ax, 0ffffh
        push ax
        lea ax, [si+2fh]
        push ax
        mov ax, 3eh
        push ax
        lea ax, [si+23h]
        push ax
        mov ax, 2
        push ax
        call _GRP_312E39EB
        add sp, 0ah
L_2328:
        mov word ptr [bp-4ah], 0
L_232D:
        mov ax, 1ch
        imul word ptr [bp-4ah]
        add ax, 15ch
        mov bx, word ptr [bp-4ah]
        shl bx, 1
        mov word ptr [bx-6470h], ax
        inc word ptr [bp-4ah]
        cmp word ptr [bp-4ah], 0ah
        jl short L_232D
        mov word ptr [bp-4ah], 0
        jmp short L_238B
        nop
L_2350:
        inc word ptr [bp-4ch]
L_2353:
        cmp word ptr [bp-4ch], 0ah
        jge short L_2388
        mov si, word ptr [bp-4ah]
        shl si, 1
        add si, 9b90h
        mov di, word ptr [bp-4ch]
        shl di, 1
        add di, 9b90h
        mov bx, word ptr [si]
        mov ax, word ptr [bx+4]
        mov bx, word ptr [di]
        cmp word ptr [bx+4], ax
        jle short L_2350
        mov ax, word ptr [si]
        mov word ptr [bp-46h], ax
        mov ax, bx
        mov word ptr [si], ax
        mov ax, word ptr [bp-46h]
        mov word ptr [di], ax
        jmp short L_2350
        nop
L_2388:
        inc word ptr [bp-4ah]
L_238B:
        cmp word ptr [bp-4ah], 9
        jge short L_239A
        mov ax, word ptr [bp-4ah]
        inc ax
        mov word ptr [bp-4ch], ax
        jmp short L_2353
L_239A:
        mov word ptr [bp-4ah], 0
L_239F:
        mov si, word ptr [bp-4ah]
        shl si, 1
        add si, 9b90h
        mov ax, word ptr [bp-4ah]
        mov cx, ax
        shl ax, 1
        shl ax, 1
        shl ax, 1
        shl ax, 1
        sub ax, cx
        mov di, ax
        add di, 26h
        push di
        mov ax, 0b0h
        push ax
        mov ax, word ptr [si]
        add ax, 8
        push ax
        call _FN_CIRCUIT_CGA_09B70
        add sp, 6
        mov bx, word ptr [si]
        push word ptr [bx+4]
        mov ax, 9130h
        push ax
        lea ax, [bp-44h]
        push ax
        call _GRP_7B77C400
        add sp, 6
        push di
        mov ax, 128h
        push ax
        lea ax, [bp-44h]
        push ax
        call _FN_CIRCUIT_CGA_09B70
        add sp, 6
        inc word ptr [bp-4ah]
        cmp word ptr [bp-4ah], 0ah
        jl short L_239F
        push word ptr ds:[9ae4h]
        push word ptr ds:[9ae2h]
        call _FN_CIRCUIT_CGA_0B418
        add sp, 4
        mov word ptr [bp-4ah], 0
L_240B:
        mov ax, 1
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_CGA_0AABD
        add sp, 4
        push word ptr [bp-4ah]
        les bx, dword ptr ds:[9bfeh]
        push word ptr es:[bx+2]
        push word ptr es:[bx]
        call _GRP_7DE44506
        add sp, 6
        inc word ptr [bp-4ah]
        cmp word ptr [bp-4ah], 4
        jl short L_240B
        jmp short L_2462
L_2436:
        cmp word ptr [bp-48h], 3b00h
        jne short L_244A
        sub ax, ax
L_243F:
        push ax
        call _GRP_0AB05B10
        add sp, 2
        jmp L_2294
        nop
L_244A:
        cmp word ptr [bp-48h], 3c00h
        jne short L_2456
        mov ax, 1
        jmp short L_243F
L_2456:
        cmp word ptr [bp-48h], 1bh
        je short L_246D
        cmp word ptr [bp-48h], 18h
        je short L_246D
L_2462:
        call _FN_CIRCUIT_CGA_0834C
        mov word ptr [bp-48h], ax
        cmp ax, 0dh
        jne short L_2436
L_246D:
        push word ptr [bp-2]
        push word ptr [bp-4]
        call _GRP_3F05A1A6
        add sp, 4
        mov ax, word ptr [bp-48h]
        pop si
        pop di
        mov sp, bp
        pop bp
        ret
_grp_bfa4f1cf ENDP
_TEXT ENDS
END
