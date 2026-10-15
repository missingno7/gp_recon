_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_08BF2:NEAR
        EXTRN _FN_CIRCUIT_EGA_08CD8:NEAR
        EXTRN _FN_CIRCUIT_EGA_0B1B6:NEAR
        EXTRN _FN_CIRCUIT_EGA_0B9D2:NEAR
        EXTRN _FN_CIRCUIT_EGA_0D922:NEAR
        EXTRN _GRP_60B99719:NEAR
        EXTRN _GRP_64BAADA8:NEAR
        EXTRN _GRP_921AA84F:NEAR
        EXTRN _GRP_C5EFAE67:NEAR
        EXTRN _GRP_E4004F71:NEAR
        PUBLIC _grp_1490dee1
_grp_1490dee1 PROC NEAR
        push bp
        mov bp, sp
        sub sp, 0d8h
        push di
        push si
        lea ax, [bp-0d0h]
        push ax
        mov ax, 3a8h
        push ax
        push word ptr ds:[9cc2h]
        push word ptr ds:[9cc0h]
        call _GRP_E4004F71
        add sp, 8
        mov ax, 18h
        push ax
        mov ax, 0e8h
        push ax
        mov ax, 0ah
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_EGA_08BF2
        sub ax, word ptr [bp+4]
        sbb dx, word ptr [bp+6]
        push dx
        push ax
        call _GRP_C5EFAE67
        push dx
        push ax
        call _GRP_64BAADA8
        add sp, 4
        push ax
        call _FN_CIRCUIT_EGA_0B9D2
        add sp, 6
        cmp word ptr [bp+8], 2
        jne short L_3D04
        mov ax, 2
        jmp short L_3D07
L_3D04:
        mov ax, 1
L_3D07:
        mov word ptr [bp-0d2h], ax
        mov word ptr [bp-0d6h], 0
        jmp L_3E52
L_3D14:
        inc word ptr [bp-0d4h]
L_3D18:
        cmp word ptr [bp-0d4h], 16h
        jl short L_3D22
        jmp L_3E4E
L_3D22:
        push word ptr ds:[9c30h]
        push word ptr ds:[9c2eh]
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        mov si, word ptr [bp-0d4h]
        shl si, 1
        mov di, word ptr [si+34eh]
        add di, word ptr [bp-0d8h]
        shl di, 1
        shl di, 1
        push word ptr [bp+di-0ceh]
        push word ptr [bp+di-0d0h]
        call _FN_CIRCUIT_EGA_0D922
        add sp, 4
        mov di, word ptr [si+350h]
        add di, word ptr [bp-0d8h]
        shl di, 1
        shl di, 1
        push word ptr [bp+di-0ceh]
        push word ptr [bp+di-0d0h]
        call _FN_CIRCUIT_EGA_0D922
        add sp, 4
        mov di, word ptr [si+37ah]
        add di, word ptr [bp-0d8h]
        shl di, 1
        shl di, 1
        push word ptr [bp+di-9ah]
        push word ptr [bp+di-9ch]
        call _FN_CIRCUIT_EGA_0D922
        add sp, 4
        mov di, word ptr [si+37ch]
        add di, word ptr [bp-0d8h]
        shl di, 1
        shl di, 1
        push word ptr [bp+di-9ah]
        push word ptr [bp+di-9ch]
        call _FN_CIRCUIT_EGA_0D922
        add sp, 4
        mov ax, 18h
        push ax
        mov ax, 0e8h
        push ax
        mov ax, 0ah
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_EGA_08BF2
        sub ax, word ptr [bp+4]
        sbb dx, word ptr [bp+6]
        push dx
        push ax
        call _GRP_C5EFAE67
        push dx
        push ax
        call _GRP_64BAADA8
        add sp, 4
        push ax
        call _FN_CIRCUIT_EGA_0B9D2
        add sp, 6
        push word ptr ds:[9b14h]
        push word ptr ds:[9b12h]
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        les bx, dword ptr ds:[9c2eh]
        push word ptr es:[bx+2]
        push word ptr es:[bx]
        call _FN_CIRCUIT_EGA_0B1B6
        add sp, 4
        mov ax, 18h
        push ax
        mov ax, 0e8h
        push ax
        mov ax, 0ah
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_EGA_08BF2
        sub ax, word ptr [bp+4]
        sbb dx, word ptr [bp+6]
        push dx
        push ax
        call _GRP_C5EFAE67
        push dx
        push ax
        call _GRP_64BAADA8
        add sp, 4
        push ax
        call _FN_CIRCUIT_EGA_0B9D2
        add sp, 6
        mov ax, 0fh
        cwd
        push dx
        push ax
        call _GRP_921AA84F
        add sp, 4
        mov ax, 18h
        push ax
        mov ax, 0e8h
        push ax
        mov ax, 0ah
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_EGA_08BF2
        sub ax, word ptr [bp+4]
        sbb dx, word ptr [bp+6]
        push dx
        push ax
        call _GRP_C5EFAE67
        push dx
        push ax
        call _GRP_64BAADA8
        add sp, 4
        push ax
        call _FN_CIRCUIT_EGA_0B9D2
        add sp, 6
        jmp L_3D14
        nop
L_3E4E:
        inc word ptr [bp-0d6h]
L_3E52:
        mov ax, word ptr [bp-0d2h]
        cmp word ptr [bp-0d6h], ax
        jl short L_3E5F
        jmp L_3EF6
L_3E5F:
        mov ax, 1ah
        imul word ptr [bp-0d6h]
        mov word ptr [bp-0d8h], ax
        cmp word ptr [bp+8], 0
        jne short L_3E76
        mov word ptr [bp-0d8h], 1ah
L_3E76:
        mov ax, 0bh
        cwd
        push dx
        push ax
        call _GRP_921AA84F
        add sp, 4
        mov ax, 18h
        push ax
        mov ax, 0e8h
        push ax
        mov ax, 0ah
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_EGA_08BF2
        sub ax, word ptr [bp+4]
        sbb dx, word ptr [bp+6]
        push dx
        push ax
        call _GRP_C5EFAE67
        push dx
        push ax
        call _GRP_64BAADA8
        add sp, 4
        push ax
        call _FN_CIRCUIT_EGA_0B9D2
        add sp, 6
        mov ax, 0bh
        cwd
        push dx
        push ax
        call _GRP_921AA84F
        add sp, 4
        push word ptr ds:[9c30h]
        push word ptr ds:[9c2eh]
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        mov si, word ptr [bp-0d8h]
        mov cl, 2
        shl si, cl
        add si, bp
        push word ptr [si-0ceh]
        push word ptr [si-0d0h]
        call _FN_CIRCUIT_EGA_0D922
        add sp, 4
        push word ptr [si-9ah]
        push word ptr [si-9ch]
        call _FN_CIRCUIT_EGA_0D922
        add sp, 4
        mov word ptr [bp-0d4h], 1
        jmp L_3D18
L_3EF6:
        mov ax, 0ah
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_EGA_08BF2
        sub ax, word ptr [bp+4]
        sbb dx, word ptr [bp+6]
        push dx
        push ax
        call _GRP_C5EFAE67
        mov word ptr [bp+4], ax
        mov word ptr [bp+6], dx
        sub ax, ax
        push ax
        mov ax, 0ch
        push ax
        mov ax, 0fh
        push ax
        mov ax, 18h
        push ax
        mov ax, 0e8h
        push ax
        push dx
        push word ptr [bp+4]
        call _GRP_64BAADA8
        add sp, 4
        push ax
        call _GRP_60B99719
        add sp, 0ch
        pop si
        pop di
        mov sp, bp
        pop bp
        ret
_grp_1490dee1 ENDP
_TEXT ENDS
END
