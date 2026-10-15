_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_078DB:NEAR
        EXTRN _FN_CIRCUIT_EGA_08C84:NEAR
        EXTRN _FN_CIRCUIT_EGA_08CD8:NEAR
        EXTRN _FN_CIRCUIT_EGA_09394:NEAR
        EXTRN _FN_CIRCUIT_EGA_0B1B6:NEAR
        EXTRN _FN_CIRCUIT_EGA_0B9D2:NEAR
        EXTRN _FN_CIRCUIT_EGA_0FCF6:NEAR
        EXTRN _GRP_312E39EB:NEAR
        EXTRN _GRP_3F05A1A6:NEAR
        EXTRN _GRP_60B99719:NEAR
        EXTRN _GRP_622C4ED2:NEAR
        EXTRN _GRP_64BAADA8:NEAR
        EXTRN _GRP_7B77C400:NEAR
        EXTRN _GRP_921AA84F:NEAR
        EXTRN _GRP_AA88D69B:NEAR
        EXTRN _GRP_F3A4E254:NEAR
        PUBLIC _grp_c7e63dc5
_grp_c7e63dc5 PROC NEAR
        push bp
        mov bp, sp
        sub sp, 64h
        push di
        push si
        push word ptr ds:[9c30h]
        push word ptr ds:[9c2eh]
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        sub ax, ax
        push ax
        call _FN_CIRCUIT_EGA_09394
        add sp, 2
        mov ax, 908ah
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
        call _FN_CIRCUIT_EGA_0B1B6
        add sp, 4
        push word ptr [bp-42h]
        push word ptr [bp-44h]
        call _GRP_3F05A1A6
        add sp, 4
        mov ax, word ptr ds:[296h]
        mov word ptr [bp-64h], ax
        mov ax, word ptr ds:[12d8h]
        shl ax, 1
        cmp ax, word ptr ds:[296h]
        jae short L_1EA1
        mov word ptr ds:[162h], 0ffffh
L_1EA1:
        mov word ptr [bp-4ch], 1
L_1EA6:
        call _FN_CIRCUIT_EGA_0FCF6
        and ax, 7fh
        mov cx, ax
        mov ax, word ptr [bp-4ch]
        mul word ptr ds:[12dah]
        add ax, cx
        add ax, word ptr ds:[12d8h]
        sub ax, 40h
        mov si, word ptr [bp-4ch]
        shl si, 1
        mov word ptr [bp+si-64h], ax
        inc word ptr [bp-4ch]
        cmp word ptr [bp-4ch], 0ah
        jl short L_1EA6
        mov ax, 0fh
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
        mov ax, 7
        push ax
        call _FN_CIRCUIT_EGA_08C84
        add sp, 4
        mov ax, 2ch
        push ax
        mov ax, 10h
        push ax
        mov ax, 9092h
        push ax
        call _FN_CIRCUIT_EGA_0B9D2
        add sp, 6
        sub ax, ax
        push ax
        mov ax, 0fh
        push ax
        call _FN_CIRCUIT_EGA_08C84
        add sp, 4
        mov ax, 1ch
        push ax
        mov ax, 90b4h
        push ax
        call _GRP_622C4ED2
        add sp, 4
        mov word ptr [bp-4ch], 0
        jmp short L_1F90
L_1F26:
        mov si, word ptr [bp-4ah]
        shl si, 1
        sub ax, ax
        push ax
        push word ptr [bp+si-64h]
        call _GRP_64BAADA8
        add sp, 4
        mov word ptr [bp-48h], ax
L_1F3A:
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
        mov ax, 90d8h
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
        call _FN_CIRCUIT_EGA_0B9D2
        add sp, 6
        mov di, word ptr [bp-4ah]
        shl di, 1
        mov word ptr [bp+di-64h], 7fffh
        inc word ptr [bp-4ch]
L_1F90:
        cmp word ptr [bp-4ch], 0ah
        jl short L_1F99
        jmp L_201A
L_1F99:
        mov si, word ptr [bp-4ch]
        shl si, 1
        mov ax, word ptr [bp+si-64h]
        mov word ptr [bp-46h], ax
        mov ax, word ptr [bp-4ch]
        mov word ptr [bp-4ah], ax
        mov word ptr [bp-4eh], 0
L_1FAF:
        mov di, word ptr [bp-4eh]
        shl di, 1
        mov si, word ptr [bp+di-64h]
        cmp word ptr [bp-46h], si
        jbe short L_1FC5
        mov word ptr [bp-46h], si
        mov ax, word ptr [bp-4eh]
        mov word ptr [bp-4ah], ax
L_1FC5:
        inc word ptr [bp-4eh]
        cmp word ptr [bp-4eh], 0ah
        jl short L_1FAF
        mov bx, word ptr [bp-4ch]
        shl bx, 1
        mov ax, word ptr [bp-4ah]
        mov word ptr [bx-694ch], ax
        or ax, ax
        jne short L_1FEB
        mov ax, word ptr [bp-64h]
        mov word ptr [bp-50h], ax
        mov ax, word ptr [bp-4ch]
        inc ax
        mov word ptr ds:[5ec4h], ax
L_1FEB:
        mov si, word ptr [bp-4ah]
        shl si, 1
        add si, bp
        sub si, 64h
        cmp word ptr [si], 0
        jne short L_1FFE
        mov word ptr [si], 0ah
L_1FFE:
        mov ax, 1ch
        imul word ptr [bp-4ah]
        mov bx, ax
        cmp word ptr [bx+162h], -1
        je short L_2010
        jmp L_1F26
L_2010:
        mov word ptr [bp-48h], 90ceh
        jmp L_1F3A
        nop
        nop
L_201A:
        push word ptr ds:[9b14h]
        push word ptr ds:[9b12h]
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        les bx, dword ptr ds:[9c2eh]
        push word ptr es:[bx+2]
        push word ptr es:[bx]
        call _FN_CIRCUIT_EGA_0B1B6
        add sp, 4
        call _FN_CIRCUIT_EGA_078DB
        mov ax, 28h
        cwd
        push dx
        push ax
        call _GRP_921AA84F
        add sp, 4
        mov ax, word ptr ds:[5ec4h]
        dec ax
        mov word ptr [bp-4ch], ax
        cmp word ptr ds:[162h], -1
        jne short L_205E
        mov word ptr [bp-48h], 90f0h
        jmp short L_206D
        nop
L_205E:
        mov ax, word ptr [bp-50h]
        cwd
        push dx
        push ax
        call _GRP_64BAADA8
        add sp, 4
        mov word ptr [bp-48h], ax
L_206D:
        push word ptr [bp-48h]
        mov ax, 15ch
        push ax
        mov ax, 164h
        push ax
        mov ax, word ptr [bp-4ch]
        inc ax
        push ax
        mov ax, 90fah
        push ax
        lea ax, [bp-40h]
        push ax
        call _GRP_7B77C400
        add sp, 0ch
        sub ax, ax
        push ax
        mov ax, 0ch
        push ax
        mov ax, 0fh
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
