_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_0440B:NEAR
        EXTRN _FN_CIRCUIT_CGA_044BC:NEAR
        EXTRN _FN_CIRCUIT_CGA_054C4:NEAR
        EXTRN _FN_CIRCUIT_CGA_05B2F:NEAR
        EXTRN _FN_CIRCUIT_CGA_06666:NEAR
        EXTRN _FN_CIRCUIT_CGA_0A018:NEAR
        EXTRN _GRP_192EA5FD:NEAR
        EXTRN _GRP_487BD94E:NEAR
        EXTRN _GRP_523F4A71:NEAR
        EXTRN _GRP_D4BED92B:NEAR
        PUBLIC _grp_b9d4e504
_grp_b9d4e504 PROC NEAR
        call _FN_CIRCUIT_CGA_05B2F
        mov ax, word ptr ds:[66ch]
        mov bx, word ptr ds:[66eh]
        mov word ptr ds:[66ch], bx
        mov word ptr ds:[66eh], ax
        cmp word ptr ds:[66ah], 0
        je short L_59ED
        cmp word ptr ds:[66eh], -1
        jne short L_59ED
        mov word ptr ds:[66eh], 26h
L_59ED:
        cmp word ptr ds:[66ch], -1
        je short L_5A01
        cmp word ptr ds:[66eh], -1
        jne short L_5A01
        mov word ptr ds:[66eh], 26h
L_5A01:
        mov ax, word ptr ds:[5ea2h]
        sub ax, 14h
        mov word ptr ds:[7160h], ax
        mov bp, 26h
L_5A0D:
        mov si, word ptr [bp+0a16h]
        mov word ptr cs:[0a84ch], si
        mov al, byte ptr [bp+7456h]
        test al, 8
        je short L_5A33
        xor dh, dh
        mov dl, byte ptr [bp+5c24h]
        shr dl, 1
        mov di, word ptr [bp+5d0ah]
        shl di, 1
        add di, 6174h
        call _GRP_D4BED92B
L_5A33:
        mov al, byte ptr [bp+7456h]
        cmp al, 4
        jne short L_5A3E
        call _GRP_487BD94E
L_5A3E:
        mov al, byte ptr [bp+74aah]
        cmp al, 4dh
        jl short L_5A79
        cmp bp, word ptr ds:[66eh]
        je short L_5A6E
        cmp al, 4eh
        je short L_5A6E
        jg short L_5A58
        call _FN_CIRCUIT_CGA_0440B
        jmp short L_5A79
        nop
L_5A58:
        mov si, word ptr [bp+0a16h]
        mov dl, byte ptr [si+5c97h]
        shl si, 1
        mov di, word ptr [si+0b24h]
        shr si, 1
        call _GRP_523F4A71
        jmp short L_5A79
        nop
L_5A6E:
        shl si, 1
        mov di, word ptr [si+0b24h]
        shr si, 1
        call _GRP_192EA5FD
L_5A79:
        jmp short L_5A87
        nop
L_5A7C:
        inc word ptr ds:[7160h]
        dec bp
        dec bp
        jle short L_5A86
        jmp short L_5A0D
L_5A86:
        ret
L_5A87:
        mov di, bp
        neg di
        mov al, byte ptr [di+0b8ah]
        mov word ptr ds:[0a6ah], di
        or al, al
        jne short L_5A9A
        jmp L_5B28
L_5A9A:
        mov word ptr ds:[0a6ah], di
        xor ah, ah
        mov word ptr ds:[0a66h], ax
        mov bx, ax
        mov di, ax
        mov word ptr ds:[0a68h], bp
        mov si, word ptr [bp+0a16h]
        shl si, 1
        mov dx, word ptr [si+0adch]
        mov bx, word ptr [di+0c0ah]
        neg bx
        call _FN_CIRCUIT_CGA_054C4
        mov bx, word ptr ds:[0a68h]
        mov di, si
        cmp di, 2ch
        jl short L_5AD2
        mov di, word ptr [bx+0a16h]
        shl di, 1
        sub di, 2
L_5AD2:
        add ax, word ptr [di+6f94h]
        shr si, 1
        add bx, 5d0ah
        call _FN_CIRCUIT_CGA_044BC
        add bx, 69c0h
        mov dx, bx
        add dx, 10h
        mov di, word ptr ds:[0a66h]
        add dx, word ptr [di+6704h]
        mov word ptr cs:[0a84ch], 16h
        mov di, dx
        push si
        push ax
        push word ptr [di+2]
        push word ptr [di]
        push si
        push ax
        push word ptr [bx+2]
        push word ptr [bx]
        call _FN_CIRCUIT_CGA_06666
        add sp, 8
        call _FN_CIRCUIT_CGA_0A018
        add sp, 8
        mov di, word ptr ds:[0a6ah]
        mov al, byte ptr [di+0b8bh]
        or al, al
        je short L_5B28
        xor ah, ah
        mov word ptr [di+0b8ah], ax
        jmp L_5A9A
L_5B28:
        mov si, word ptr [bp+0a16h]
        jmp L_5A7C
_grp_b9d4e504 ENDP
_TEXT ENDS
END
