_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_09B70:NEAR
        EXTRN _FN_CIRCUIT_CGA_0AA92:NEAR
        EXTRN _FN_CIRCUIT_CGA_0B418:NEAR
        EXTRN _GRP_60B99719:NEAR
        EXTRN _GRP_64BAADA8:NEAR
        EXTRN _GRP_921AA84F:NEAR
        EXTRN _GRP_9D44A3BF:NEAR
        EXTRN _GRP_B465AB5E:NEAR
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
        push word ptr ds:[9c92h]
        push word ptr ds:[9c90h]
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
        call _FN_CIRCUIT_CGA_0AA92
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
        call _FN_CIRCUIT_CGA_09B70
        add sp, 6
        cmp word ptr [bp+8], 2
        jne short L_3D0E
        mov ax, 2
        jmp short L_3D11
L_3D0E:
        mov ax, 1
L_3D11:
        mov word ptr [bp-0d2h], ax
        mov word ptr [bp-0d6h], 0
        jmp L_3E5C
L_3D1E:
        inc word ptr [bp-0d4h]
L_3D22:
        cmp word ptr [bp-0d4h], 16h
        jl short L_3D2C
        jmp L_3E58
L_3D2C:
        push word ptr ds:[9c00h]
        push word ptr ds:[9bfeh]
        call _FN_CIRCUIT_CGA_0B418
        add sp, 4
        mov si, word ptr [bp-0d4h]
        shl si, 1
        mov di, word ptr [si+34eh]
        add di, word ptr [bp-0d8h]
        shl di, 1
        shl di, 1
        push word ptr [bp+di-0ceh]
        push word ptr [bp+di-0d0h]
        call _GRP_B465AB5E
        add sp, 4
        mov di, word ptr [si+350h]
        add di, word ptr [bp-0d8h]
        shl di, 1
        shl di, 1
        push word ptr [bp+di-0ceh]
        push word ptr [bp+di-0d0h]
        call _GRP_B465AB5E
        add sp, 4
        mov di, word ptr [si+37ah]
        add di, word ptr [bp-0d8h]
        shl di, 1
        shl di, 1
        push word ptr [bp+di-9ah]
        push word ptr [bp+di-9ch]
        call _GRP_B465AB5E
        add sp, 4
        mov di, word ptr [si+37ch]
        add di, word ptr [bp-0d8h]
        shl di, 1
        shl di, 1
        push word ptr [bp+di-9ah]
        push word ptr [bp+di-9ch]
        call _GRP_B465AB5E
        add sp, 4
        mov ax, 18h
        push ax
        mov ax, 0e8h
        push ax
        mov ax, 0ah
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_CGA_0AA92
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
        call _FN_CIRCUIT_CGA_09B70
        add sp, 6
        push word ptr ds:[9ae4h]
        push word ptr ds:[9ae2h]
        call _FN_CIRCUIT_CGA_0B418
        add sp, 4
        les bx, dword ptr ds:[9bfeh]
        push word ptr es:[bx+2]
        push word ptr es:[bx]
        call _GRP_9D44A3BF
        add sp, 4
        mov ax, 18h
        push ax
        mov ax, 0e8h
        push ax
        mov ax, 0ah
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_CGA_0AA92
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
        call _FN_CIRCUIT_CGA_09B70
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
        call _FN_CIRCUIT_CGA_0AA92
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
        call _FN_CIRCUIT_CGA_09B70
        add sp, 6
        jmp L_3D1E
        nop
L_3E58:
        inc word ptr [bp-0d6h]
L_3E5C:
        mov ax, word ptr [bp-0d2h]
        cmp word ptr [bp-0d6h], ax
        jl short L_3E69
        jmp L_3F00
L_3E69:
        mov ax, 1ah
        imul word ptr [bp-0d6h]
        mov word ptr [bp-0d8h], ax
        cmp word ptr [bp+8], 0
        jne short L_3E80
        mov word ptr [bp-0d8h], 1ah
L_3E80:
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
        call _FN_CIRCUIT_CGA_0AA92
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
        call _FN_CIRCUIT_CGA_09B70
        add sp, 6
        mov ax, 0bh
        cwd
        push dx
        push ax
        call _GRP_921AA84F
        add sp, 4
        push word ptr ds:[9c00h]
        push word ptr ds:[9bfeh]
        call _FN_CIRCUIT_CGA_0B418
        add sp, 4
        mov si, word ptr [bp-0d8h]
        mov cl, 2
        shl si, cl
        add si, bp
        push word ptr [si-0ceh]
        push word ptr [si-0d0h]
        call _GRP_B465AB5E
        add sp, 4
        push word ptr [si-9ah]
        push word ptr [si-9ch]
        call _GRP_B465AB5E
        add sp, 4
        mov word ptr [bp-0d4h], 1
        jmp L_3D22
L_3F00:
        mov ax, 0ah
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_CGA_0AA92
        sub ax, word ptr [bp+4]
        sbb dx, word ptr [bp+6]
        push dx
        push ax
        call _GRP_C5EFAE67
        mov word ptr [bp+4], ax
        mov word ptr [bp+6], dx
        sub ax, ax
        push ax
        mov ax, 2
        push ax
        mov ax, 3
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
