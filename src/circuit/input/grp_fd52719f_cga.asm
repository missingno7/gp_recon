_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_054F7:NEAR
        EXTRN _FN_CIRCUIT_CGA_058F0:NEAR
        EXTRN _FN_CIRCUIT_CGA_05950:NEAR
        EXTRN _FN_CIRCUIT_CGA_066A8:NEAR
        EXTRN _FN_CIRCUIT_CGA_068AC:NEAR
        EXTRN _FN_CIRCUIT_CGA_06BEE:NEAR
        EXTRN _FN_CIRCUIT_CGA_09A42:NEAR
        EXTRN _FN_CIRCUIT_CGA_0A254:NEAR
        EXTRN _FN_CIRCUIT_CGA_0A6FA:NEAR
        EXTRN _FN_CIRCUIT_CGA_0B418:NEAR
        EXTRN _GRP_5B2E6DBB:NEAR
        EXTRN _GRP_B465AB5E:NEAR
        PUBLIC _grp_fd52719f
_grp_fd52719f PROC NEAR
        call _FN_CIRCUIT_CGA_05950
        call _FN_CIRCUIT_CGA_058F0
        mov al, byte ptr ds:[5fb9h]
        cbw
        mov bx, ax
        mov al, byte ptr [bx+9e1h]
        mov ah, byte ptr ds:[6bf0h]
        cmp ah, al
        je short L_5775
        jl short L_5730
        dec ah
        jmp short L_5732
        nop
L_5730:
        inc ah
L_5732:
        mov al, ah
        mov bl, byte ptr ds:[6bf0h]
        mov bh, bl
        mov ah, al
        or ah, ah
        jge short L_5742
        neg ah
L_5742:
        or bh, bh
        jge short L_5748
        neg bh
L_5748:
        sub bh, ah
        jg short L_574E
        mov bl, al
L_574E:
        mov byte ptr ds:[6bf0h], al
        or bl, bl
        je short L_5775
        add bl, 2
        shl bl, 1
        shl bl, 1
        xor bh, bh
        push word ptr [bx+62aah]
        push word ptr [bx+62a8h]
        call _FN_CIRCUIT_CGA_054F7
        call _GRP_B465AB5E
        add sp, 4
        jmp short L_5775
        nop
L_5772:
        jmp L_580D
L_5775:
        mov bx, word ptr ds:[5fb8h]
        cmp bx, word ptr ds:[9fah]
        je short L_5772
        mov word ptr ds:[9fah], bx
        xor cx, cx
        cmp bx, cx
        jge short L_578C
        neg bx
        inc cx
L_578C:
        shl bx, 1
        shl bx, 1
        mov bl, bh
        cmp bl, 3ch
        jl short L_5799
        mov bl, 3ch
L_5799:
        mov bh, ch
        mov dh, ch
        mov dl, byte ptr [bx+5daah]
        cmp cl, 0
        jne short L_57A8
        neg dx
L_57A8:
        mov ax, word ptr ds:[579eh]
        add ax, 0dh
        sub al, byte ptr [bx+5de6h]
        add dx, word ptr ds:[579ch]
        push ax
        push dx
        push word ptr ds:[62beh]
        push word ptr ds:[62bch]
        push ax
        push dx
        push word ptr ds:[62c2h]
        push word ptr ds:[62c0h]
        dec ax
        dec ax
        dec dx
        dec dx
        and dx, 0fffch
        mov cx, 5e7ch
        push ax
        push dx
        push ds
        push cx
        push word ptr ds:[5e96h]
        push word ptr ds:[5e94h]
        mov word ptr ds:[5e96h], ax
        mov word ptr ds:[5e94h], dx
        push ds
        push cx
        cmp byte ptr ds:[6bf1h], 0
        je short L_57F3
        call _FN_CIRCUIT_CGA_09A42
L_57F3:
        add sp, 8
        call _FN_CIRCUIT_CGA_0A6FA
        add sp, 8
        call _FN_CIRCUIT_CGA_068AC
        add sp, 8
        call _FN_CIRCUIT_CGA_0A254
        add sp, 8
        mov byte ptr ds:[6bf1h], 1
L_580D:
        mov ax, word ptr ds:[5ec6h]
        cmp ax, word ptr ds:[9f6h]
        jne short L_5817
L_5816:
        ret
L_5817:
        mov word ptr ds:[9f6h], ax
        cmp ax, word ptr ds:[570ch]
        jb short L_5824
        mov bx, word ptr ds:[570ch]
L_5824:
        shr ax, 1
        shr ax, 1
        shr ax, 1
        shr ax, 1
        shr ax, 1
        shr ax, 1
        cmp ax, word ptr ds:[9f8h]
        je short L_5816
        mov word ptr ds:[9f8h], ax
        push cs
        push word ptr ds:[5e62h]
        call _FN_CIRCUIT_CGA_0B418
        add sp, 4
        xor ax, ax
        push ax
        push ax
        push word ptr ds:[6b68h]
        push word ptr ds:[6b66h]
        call _FN_CIRCUIT_CGA_09A42
        add sp, 8
        mov bx, word ptr ds:[9f8h]
        shl bx, 1
        mov ax, word ptr [bx+58a2h]
        mov bl, ah
        xor ah, ah
        mov bh, ah
        sub ax, word ptr ds:[5e6ah]
        sub bx, word ptr ds:[5e6ch]
        mov cx, 0ffffh
        push cx
        push bx
        push ax
        push word ptr ds:[58a0h]
        push word ptr ds:[589eh]
        call _FN_CIRCUIT_CGA_06BEE
        add sp, 0ah
        mov bl, byte ptr ds:[6bf0h]
        or bl, bl
        je short L_58B1
        xor bh, bh
        add bl, 2
        shl bx, 1
        shl bx, 1
        shl bx, 1
        push word ptr [bx+62c6h]
        push word ptr [bx+62c4h]
        push word ptr [bx+62cah]
        push word ptr [bx+62c8h]
        call _FN_CIRCUIT_CGA_066A8
        add sp, 4
        call _GRP_5B2E6DBB
        add sp, 4
L_58B1:
        call _FN_CIRCUIT_CGA_054F7
        push word ptr ds:[5e6ch]
        push word ptr ds:[5e6ah]
        push word ptr ds:[5e68h]
        push word ptr ds:[5e66h]
        call _FN_CIRCUIT_CGA_09A42
        add sp, 8
        ret
_grp_fd52719f ENDP
_TEXT ENDS
END
