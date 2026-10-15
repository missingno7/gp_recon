_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_06367:NEAR
        EXTRN _FN_CIRCUIT_EGA_08B08:NEAR
        PUBLIC _grp_b0ef0812
_grp_b0ef0812 PROC NEAR
        push di
        push bp
        mov cx, 5
        mov di, 0
        mov bp, word ptr [di-694Ch]
        shl bp, 1
        xor ax, ax
        cmp word ptr ds:[9BD6h], 0
        je short setup_state
        mov ax, word ptr ds:[5EC6h]
        add ax, 1Dh
setup_state:
        mov bx, 160h
initialize_loop:
        mov word ptr [bp+0C9Ah], ax
        mov word ptr [bp+0D26h], ax
        mov word ptr [bp+0D3Ah], bp
        mov word ptr [bp+0C86h], 0FE20h
        mov word ptr [bp+0C72h], 0
        mov word ptr [bp+0CEAh], bx
        mov word ptr [bp+0CFEh], bx
        mov word ptr [bp+0CC2h], 0
        mov word ptr [bp+0CD6h], 0FE20h
        mov word ptr [bp+0C36h], 0
        inc di
        inc di
        mov bp, word ptr [di-694Ch]
        shl bp, 1
        dec ax
        mov word ptr [bp+0C9Ah], ax
        mov word ptr [bp+0D26h], ax
        mov word ptr [bp+0D3Ah], bp
        mov word ptr [bp+0C86h], 1E0h
        mov word ptr [bp+0C72h], 0
        mov word ptr [bp+0CEAh], bx
        mov word ptr [bp+0CFEh], bx
        mov word ptr [bp+0CC2h], 0
        mov word ptr [bp+0CD6h], 1E0h
        mov word ptr [bp+0C36h], 0
        sub ax, 6
        inc di
        inc di
        mov bp, word ptr [di-694Ch]
        shl bp, 1
        loop initialize_loop
        cmp word ptr ds:[9BD6h], 0
        jne short phase_selected
        mov ax, word ptr ds:[5EC6h]
        add ax, 1Dh
        mov word ptr ds:[5EBAh], ax
        jmp short random_start
        nop
phase_selected:
        mov ax, word ptr ds:[0C9Ah]
        add ax, 1
        mov word ptr ds:[5EBAh], ax
        mov word ptr ds:[0C9Ah], ax
        mov word ptr ds:[5EBEh], ax
        mov ax, word ptr ds:[0C86h]
        mov word ptr ds:[5ED2h], ax
random_start:
        call _FN_CIRCUIT_EGA_06367
        mov cx, 9
        mov bp, 2
random_loop:
        push cx
        call _FN_CIRCUIT_EGA_08B08
        pop cx
        and ax, 0Fh
        add ax, bp
        mov word ptr [bp+0D76h], ax
        inc bp
        inc bp
        loop random_loop
        pop bp
        pop di
        ret
_grp_b0ef0812 ENDP
_TEXT ENDS
END
