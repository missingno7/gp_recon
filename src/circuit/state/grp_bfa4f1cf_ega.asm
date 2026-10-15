_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_078A0:NEAR
        EXTRN _FN_CIRCUIT_EGA_08C1D:NEAR
        EXTRN _FN_CIRCUIT_EGA_08C84:NEAR
        EXTRN _FN_CIRCUIT_EGA_08CD8:NEAR
        EXTRN _FN_CIRCUIT_EGA_09394:NEAR
        EXTRN _FN_CIRCUIT_EGA_09C18:NEAR
        EXTRN _FN_CIRCUIT_EGA_0B1B6:NEAR
        EXTRN _FN_CIRCUIT_EGA_0B9D2:NEAR
        EXTRN _GRP_0AB05B10:NEAR
        EXTRN _GRP_312E39EB:NEAR
        EXTRN _GRP_3F05A1A6:NEAR
        EXTRN _GRP_7B77C400:NEAR
        EXTRN _GRP_AA88D69B:NEAR
        EXTRN _GRP_F3A4E254:NEAR
        PUBLIC _grp_bfa4f1cf
_grp_bfa4f1cf PROC NEAR
        push bp
        mov bp, sp
        sub sp, 4ch
        push di
        push si
        mov ax, 914ah
        push ax
        call _GRP_AA88D69B
        add sp, 2
        mov word ptr [bp-4], ax
        mov word ptr [bp-2], dx
L_2298:
        push word ptr ds:[9c30h]
        push word ptr ds:[9c2eh]
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        sub ax, ax
        push ax
        call _FN_CIRCUIT_EGA_09394
        add sp, 2
        mov ax, 9152h
        push ax
        push word ptr [bp-2]
        push word ptr [bp-4]
        call _GRP_F3A4E254
        add sp, 6
        push dx
        push ax
        call _FN_CIRCUIT_EGA_0B1B6
        add sp, 4
        sub ax, ax
        push ax
        mov ax, 0fh
        push ax
        call _FN_CIRCUIT_EGA_08C84
        add sp, 4
        mov word ptr [bp-4ah], 0
        jmp short L_22FC
        nop
L_22DC:
        mov ax, 12h
        imul word ptr [bp-4ah]
        add ax, 26h
        push ax
        mov ax, 40h
        push ax
        mov bx, word ptr [bp-4ah]
        shl bx, 1
        push word ptr [bx-6458h]
        call _FN_CIRCUIT_EGA_0B9D2
        add sp, 6
        inc word ptr [bp-4ah]
L_22FC:
        mov ax, word ptr ds:[288h]
        cmp word ptr [bp-4ah], ax
        jl short L_22DC
        cmp ax, 8
        jge short L_232C
        mov ax, 12h
        imul word ptr ds:[288h]
        mov si, ax
        mov ax, 0eh
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
L_232C:
        mov word ptr [bp-4ah], 0
L_2331:
        mov ax, 1ch
        imul word ptr [bp-4ah]
        add ax, 15ch
        mov bx, word ptr [bp-4ah]
        shl bx, 1
        mov word ptr [bx-6440h], ax
        inc word ptr [bp-4ah]
        cmp word ptr [bp-4ah], 0ah
        jl short L_2331
        mov word ptr [bp-4ah], 0
        jmp short L_238F
        nop
L_2354:
        inc word ptr [bp-4ch]
L_2357:
        cmp word ptr [bp-4ch], 0ah
        jge short L_238C
        mov si, word ptr [bp-4ah]
        shl si, 1
        add si, 9bc0h
        mov di, word ptr [bp-4ch]
        shl di, 1
        add di, 9bc0h
        mov bx, word ptr [si]
        mov ax, word ptr [bx+4]
        mov bx, word ptr [di]
        cmp word ptr [bx+4], ax
        jle short L_2354
        mov ax, word ptr [si]
        mov word ptr [bp-46h], ax
        mov ax, bx
        mov word ptr [si], ax
        mov ax, word ptr [bp-46h]
        mov word ptr [di], ax
        jmp short L_2354
        nop
L_238C:
        inc word ptr [bp-4ah]
L_238F:
        cmp word ptr [bp-4ah], 9
        jge short L_239E
        mov ax, word ptr [bp-4ah]
        inc ax
        mov word ptr [bp-4ch], ax
        jmp short L_2357
L_239E:
        mov word ptr [bp-4ah], 0
L_23A3:
        mov si, word ptr [bp-4ah]
        shl si, 1
        add si, 9bc0h
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
        call _FN_CIRCUIT_EGA_0B9D2
        add sp, 6
        mov bx, word ptr [si]
        push word ptr [bx+4]
        mov ax, 9158h
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
        call _FN_CIRCUIT_EGA_0B9D2
        add sp, 6
        inc word ptr [bp-4ah]
        cmp word ptr [bp-4ah], 0ah
        jl short L_23A3
        push word ptr ds:[9b14h]
        push word ptr ds:[9b12h]
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        mov word ptr [bp-4ah], 0
L_240F:
        mov ax, 1
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_EGA_08C1D
        add sp, 4
        push word ptr [bp-4ah]
        les bx, dword ptr ds:[9c2eh]
        push word ptr es:[bx+2]
        push word ptr es:[bx]
        call _FN_CIRCUIT_EGA_09C18
        add sp, 6
        inc word ptr [bp-4ah]
        cmp word ptr [bp-4ah], 4
        jl short L_240F
        jmp short L_2466
L_243A:
        cmp word ptr [bp-48h], 3b00h
        jne short L_244E
        sub ax, ax
L_2443:
        push ax
        call _GRP_0AB05B10
        add sp, 2
        jmp L_2298
        nop
L_244E:
        cmp word ptr [bp-48h], 3c00h
        jne short L_245A
        mov ax, 1
        jmp short L_2443
L_245A:
        cmp word ptr [bp-48h], 1bh
        je short L_2471
        cmp word ptr [bp-48h], 18h
        je short L_2471
L_2466:
        call _FN_CIRCUIT_EGA_078A0
        mov word ptr [bp-48h], ax
        cmp ax, 0dh
        jne short L_243A
L_2471:
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
