_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_05641:NEAR
        EXTRN _FN_CIRCUIT_EGA_05A3A:NEAR
        EXTRN _FN_CIRCUIT_EGA_05A9A:NEAR
        EXTRN _FN_CIRCUIT_EGA_08CD8:NEAR
        EXTRN _FN_CIRCUIT_EGA_08D2A:NEAR
        EXTRN _FN_CIRCUIT_EGA_08FF2:NEAR
        EXTRN _FN_CIRCUIT_EGA_094D0:NEAR
        EXTRN _FN_CIRCUIT_EGA_0B184:NEAR
        EXTRN _FN_CIRCUIT_EGA_0BE62:NEAR
        EXTRN _FN_CIRCUIT_EGA_0BE96:NEAR
        EXTRN _FN_CIRCUIT_EGA_0C4E4:NEAR
        EXTRN _FN_CIRCUIT_EGA_0D922:NEAR
        PUBLIC _grp_fd52719f
_grp_fd52719f PROC NEAR
        call _FN_CIRCUIT_EGA_05A9A
        call _FN_CIRCUIT_EGA_05A3A
        mov al, byte ptr ds:[5fd5h]
        cbw
        mov bx, ax
        mov al, byte ptr [bx+9e5h]
        mov ah, byte ptr ds:[6c0ch]
        cmp ah, al
        je short L_58BF
        jl short L_587A
        dec ah
        jmp short L_587C
        nop
L_587A:
        inc ah
L_587C:
        mov al, ah
        mov bl, byte ptr ds:[6c0ch]
        mov bh, bl
        mov ah, al
        or ah, ah
        jge short L_588C
        neg ah
L_588C:
        or bh, bh
        jge short L_5892
        neg bh
L_5892:
        sub bh, ah
        jg short L_5898
        mov bl, al
L_5898:
        mov byte ptr ds:[6c0ch], al
        or bl, bl
        je short L_58BF
        add bl, 2
        shl bl, 1
        shl bl, 1
        xor bh, bh
        push word ptr [bx+62c6h]
        push word ptr [bx+62c4h]
        call _FN_CIRCUIT_EGA_05641
        call _FN_CIRCUIT_EGA_0D922
        add sp, 4
        jmp short L_58BF
        nop
L_58BC:
        jmp L_5957
L_58BF:
        mov bx, word ptr ds:[5fd4h]
        cmp bx, word ptr ds:[9feh]
        je short L_58BC
        mov word ptr ds:[9feh], bx
        xor cx, cx
        cmp bx, cx
        jge short L_58D6
        neg bx
        inc cx
L_58D6:
        shl bx, 1
        shl bx, 1
        mov bl, bh
        cmp bl, 3ch
        jl short L_58E3
        mov bl, 3ch
L_58E3:
        mov bh, ch
        mov dh, ch
        mov dl, byte ptr [bx+5daeh]
        cmp cl, 0
        jne short L_58F2
        neg dx
L_58F2:
        mov ax, word ptr ds:[57a2h]
        add ax, 0dh
        sub al, byte ptr [bx+5deah]
        add dx, word ptr ds:[57a0h]
        push ax
        push dx
        push word ptr ds:[62dah]
        push word ptr ds:[62d8h]
        push ax
        push dx
        push word ptr ds:[62deh]
        push word ptr ds:[62dch]
        dec ax
        dec ax
        dec dx
        dec dx
        and dx, 0fff8h
        mov cx, 5e80h
        push ax
        push dx
        push ds
        push cx
        push word ptr ds:[5eb2h]
        push word ptr ds:[5eb0h]
        mov word ptr ds:[5eb2h], ax
        mov word ptr ds:[5eb0h], dx
        push ds
        push cx
        cmp byte ptr ds:[6c0dh], 0
        je short L_593D
        call _FN_CIRCUIT_EGA_0B184
L_593D:
        add sp, 8
        call _FN_CIRCUIT_EGA_0C4E4
        add sp, 8
        call _FN_CIRCUIT_EGA_08FF2
        add sp, 8
        call _FN_CIRCUIT_EGA_0BE62
        add sp, 8
        mov byte ptr ds:[6c0dh], 1
L_5957:
        mov ax, word ptr ds:[5ee2h]
        cmp ax, word ptr ds:[9fah]
        jne short L_5961
L_5960:
        ret
L_5961:
        mov word ptr ds:[9fah], ax
        cmp ax, word ptr ds:[5710h]
        jb short L_596E
        mov bx, word ptr ds:[5710h]
L_596E:
        shr ax, 1
        shr ax, 1
        shr ax, 1
        shr ax, 1
        shr ax, 1
        shr ax, 1
        cmp ax, word ptr ds:[9fch]
        je short L_5960
        mov word ptr ds:[9fch], ax
        push cs
        push word ptr ds:[5e66h]
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        xor ax, ax
        push ax
        push ax
        push word ptr ds:[6b84h]
        push word ptr ds:[6b82h]
        call _FN_CIRCUIT_EGA_0B184
        add sp, 8
        mov bx, word ptr ds:[9fch]
        shl bx, 1
        mov ax, word ptr [bx+58a6h]
        mov bl, ah
        xor ah, ah
        mov bh, ah
        sub ax, word ptr ds:[5e6eh]
        sub bx, word ptr ds:[5e70h]
        mov cx, 0ffffh
        push cx
        push bx
        push ax
        push word ptr ds:[58a4h]
        push word ptr ds:[58a2h]
        call _FN_CIRCUIT_EGA_094D0
        add sp, 0ah
        mov bl, byte ptr ds:[6c0ch]
        or bl, bl
        je short L_59FB
        xor bh, bh
        add bl, 2
        shl bx, 1
        shl bx, 1
        shl bx, 1
        push word ptr [bx+62e2h]
        push word ptr [bx+62e0h]
        push word ptr [bx+62e6h]
        push word ptr [bx+62e4h]
        call _FN_CIRCUIT_EGA_08D2A
        add sp, 4
        call _FN_CIRCUIT_EGA_0BE96
        add sp, 4
L_59FB:
        call _FN_CIRCUIT_EGA_05641
        push word ptr ds:[5e70h]
        push word ptr ds:[5e6eh]
        push word ptr ds:[5e6ch]
        push word ptr ds:[5e6ah]
        call _FN_CIRCUIT_EGA_0B184
        add sp, 8
        ret
_grp_fd52719f ENDP
_TEXT ENDS
END
