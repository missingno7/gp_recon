_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_08387:NEAR
        EXTRN _FN_CIRCUIT_CGA_09B70:NEAR
        EXTRN _FN_CIRCUIT_CGA_0AB24:NEAR
        EXTRN _FN_CIRCUIT_CGA_0B418:NEAR
        EXTRN _FN_CIRCUIT_CGA_0C428:NEAR
        EXTRN _GRP_312E39EB:NEAR
        EXTRN _GRP_3F05A1A6:NEAR
        EXTRN _GRP_60B99719:NEAR
        EXTRN _GRP_622C4ED2:NEAR
        EXTRN _GRP_64BAADA8:NEAR
        EXTRN _GRP_7B77C400:NEAR
        EXTRN _GRP_921AA84F:NEAR
        EXTRN _GRP_9D44A3BF:NEAR
        EXTRN _GRP_AA88D69B:NEAR
        EXTRN _GRP_E76F1CA2:NEAR
        EXTRN _GRP_F3A4E254:NEAR
        PUBLIC _grp_c7e63dc5
_grp_c7e63dc5 PROC NEAR
        push bp
        mov bp, sp
        sub sp, 64h
        push di
        push si
        push word ptr ds:[9c00h]
        push word ptr ds:[9bfeh]
        call _FN_CIRCUIT_CGA_0B418
        add sp, 4
        sub ax, ax
        push ax
        call _GRP_E76F1CA2
        add sp, 2
        mov ax, 9062h
        push ax
        call _GRP_AA88D69B
        add sp, 2
        mov word ptr [bp-44h], ax
        mov word ptr [bp-42h], dx
        mov ax, word ptr ds:[288h]
        mov cx, ax
        shl ax, 1
        shl ax, 1
        add ax, cx
        add ax, 134h
        push ax
        push dx
        push word ptr [bp-44h]
        call _GRP_F3A4E254
        add sp, 6
        push dx
        push ax
        call _GRP_9D44A3BF
        add sp, 4
        push word ptr [bp-42h]
        push word ptr [bp-44h]
        call _GRP_3F05A1A6
        add sp, 4
        mov ax, word ptr ds:[296h]
        mov word ptr [bp-64h], ax
        mov ax, word ptr ds:[12d4h]
        shl ax, 1
        cmp ax, word ptr ds:[296h]
        jae short L_1E9F
        mov word ptr ds:[162h], 0ffffh
L_1E9F:
        mov word ptr [bp-4ch], 1
L_1EA4:
        call _FN_CIRCUIT_CGA_0C428
        and ax, 7fh
        mov cx, ax
        mov ax, word ptr [bp-4ch]
        mul word ptr ds:[12d6h]
        add ax, cx
        add ax, word ptr ds:[12d4h]
        sub ax, 40h
        mov si, word ptr [bp-4ch]
        shl si, 1
        mov word ptr [bp+si-64h], ax
        inc word ptr [bp-4ch]
        cmp word ptr [bp-4ch], 0ah
        jl short L_1EA4
        mov ax, 0ffffh
        push ax
        mov ax, 0c7h
        push ax
        mov ax, 13fh
        push ax
        sub ax, ax
        push ax
        push ax
        call _GRP_312E39EB
        add sp, 0ah
        sub ax, ax
        push ax
        mov ax, 3
        push ax
        call _FN_CIRCUIT_CGA_0AB24
        add sp, 4
        mov ax, 2ch
        push ax
        mov ax, 10h
        push ax
        mov ax, 906ah
        push ax
        call _FN_CIRCUIT_CGA_09B70
        add sp, 6
        sub ax, ax
        push ax
        mov ax, 3
        push ax
        call _FN_CIRCUIT_CGA_0AB24
        add sp, 4
        mov ax, 1ch
        push ax
        mov ax, 908ch
        push ax
        call _GRP_622C4ED2
        add sp, 4
        mov word ptr [bp-4ch], 0
        jmp short L_1F8E
L_1F24:
        mov si, word ptr [bp-4ah]
        shl si, 1
        sub ax, ax
        push ax
        push word ptr [bp+si-64h]
        call _GRP_64BAADA8
        add sp, 4
        mov word ptr [bp-48h], ax
L_1F38:
        mov ax, 1ch
        imul word ptr [bp-4ah]
        mov si, ax
        push word ptr [bp-48h]
        add ax, 15ch
        push ax
        mov ax, si
        add ax, 164h
        push ax
        mov ax, word ptr [bp-4ch]
        inc ax
        push ax
        mov ax, 90b0h
        push ax
        lea ax, [bp-40h]
        push ax
        call _GRP_7B77C400
        add sp, 0ch
        mov ax, word ptr [bp-4ch]
        mov cx, ax
        shl ax, 1
        add ax, cx
        shl ax, 1
        shl ax, 1
        add ax, cx
        add ax, 40h
        push ax
        mov ax, 18h
        push ax
        lea ax, [bp-40h]
        push ax
        call _FN_CIRCUIT_CGA_09B70
        add sp, 6
        mov di, word ptr [bp-4ah]
        shl di, 1
        mov word ptr [bp+di-64h], 7fffh
        inc word ptr [bp-4ch]
L_1F8E:
        cmp word ptr [bp-4ch], 0ah
        jl short L_1F97
        jmp L_2018
L_1F97:
        mov si, word ptr [bp-4ch]
        shl si, 1
        mov ax, word ptr [bp+si-64h]
        mov word ptr [bp-46h], ax
        mov ax, word ptr [bp-4ch]
        mov word ptr [bp-4ah], ax
        mov word ptr [bp-4eh], 0
L_1FAD:
        mov di, word ptr [bp-4eh]
        shl di, 1
        mov si, word ptr [bp+di-64h]
        cmp word ptr [bp-46h], si
        jbe short L_1FC3
        mov word ptr [bp-46h], si
        mov ax, word ptr [bp-4eh]
        mov word ptr [bp-4ah], ax
L_1FC3:
        inc word ptr [bp-4eh]
        cmp word ptr [bp-4eh], 0ah
        jl short L_1FAD
        mov bx, word ptr [bp-4ch]
        shl bx, 1
        mov ax, word ptr [bp-4ah]
        mov word ptr [bx-697ch], ax
        or ax, ax
        jne short L_1FE9
        mov ax, word ptr [bp-64h]
        mov word ptr [bp-50h], ax
        mov ax, word ptr [bp-4ch]
        inc ax
        mov word ptr ds:[5ea8h], ax
L_1FE9:
        mov si, word ptr [bp-4ah]
        shl si, 1
        add si, bp
        sub si, 64h
        cmp word ptr [si], 0
        jne short L_1FFC
        mov word ptr [si], 0ah
L_1FFC:
        mov ax, 1ch
        imul word ptr [bp-4ah]
        mov bx, ax
        cmp word ptr [bx+162h], -1
        je short L_200E
        jmp L_1F24
L_200E:
        mov word ptr [bp-48h], 90a6h
        jmp L_1F38
        nop
        nop
L_2018:
        push word ptr ds:[9ae4h]
        push word ptr ds:[9ae2h]
        call _FN_CIRCUIT_CGA_0B418
        add sp, 4
        les bx, dword ptr ds:[9bfeh]
        push word ptr es:[bx+2]
        push word ptr es:[bx]
        call _GRP_9D44A3BF
        add sp, 4
        call _FN_CIRCUIT_CGA_08387
        mov ax, 28h
        cwd
        push dx
        push ax
        call _GRP_921AA84F
        add sp, 4
        mov ax, word ptr ds:[5ea8h]
        dec ax
        mov word ptr [bp-4ch], ax
        cmp word ptr ds:[162h], -1
        jne short L_205C
        mov word ptr [bp-48h], 90c8h
        jmp short L_206B
        nop
L_205C:
        mov ax, word ptr [bp-50h]
        cwd
        push dx
        push ax
        call _GRP_64BAADA8
        add sp, 4
        mov word ptr [bp-48h], ax
L_206B:
        push word ptr [bp-48h]
        mov ax, 15ch
        push ax
        mov ax, 164h
        push ax
        mov ax, word ptr [bp-4ch]
        inc ax
        push ax
        mov ax, 90d2h
        push ax
        lea ax, [bp-40h]
        push ax
        call _GRP_7B77C400
        add sp, 0ch
        sub ax, ax
        push ax
        mov ax, 2
        push ax
        mov ax, 3
        push ax
        mov ax, word ptr [bp-4ch]
        mov cx, ax
        shl ax, 1
        add ax, cx
        shl ax, 1
        shl ax, 1
        add ax, cx
        add ax, 40h
        push ax
        mov ax, 18h
        push ax
        lea ax, [bp-40h]
        push ax
        call _GRP_60B99719
        add sp, 0ch
        pop si
        pop di
        mov sp, bp
        pop bp
        ret
_grp_c7e63dc5 ENDP
_TEXT ENDS
END
