_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_0620D:NEAR
        EXTRN _FN_CIRCUIT_CGA_0A6B8:NEAR
        PUBLIC _grp_b0ef0812
_grp_b0ef0812 PROC NEAR
        push di
        push bp
        mov cx, 5
        mov di, 0
        mov bp, word ptr [di-697Ch]
        shl bp, 1
        xor ax, ax
        cmp word ptr ds:[9BA6h], 0
        je short setup_state
        mov ax, word ptr ds:[5EAAh]
        add ax, 1Dh
setup_state:
        mov bx, 160h
initialize_loop:
        mov word ptr [bp+0C96h], ax
        mov word ptr [bp+0D22h], ax
        mov word ptr [bp+0D36h], bp
        mov word ptr [bp+0C82h], 0FE20h
        mov word ptr [bp+0C6Eh], 0
        mov word ptr [bp+0CE6h], bx
        mov word ptr [bp+0CFAh], bx
        mov word ptr [bp+0CBEh], 0
        mov word ptr [bp+0CD2h], 0FE20h
        mov word ptr [bp+0C32h], 0
        inc di
        inc di
        mov bp, word ptr [di-697Ch]
        shl bp, 1
        dec ax
        mov word ptr [bp+0C96h], ax
        mov word ptr [bp+0D22h], ax
        mov word ptr [bp+0D36h], bp
        mov word ptr [bp+0C82h], 1E0h
        mov word ptr [bp+0C6Eh], 0
        mov word ptr [bp+0CE6h], bx
        mov word ptr [bp+0CFAh], bx
        mov word ptr [bp+0CBEh], 0
        mov word ptr [bp+0CD2h], 1E0h
        mov word ptr [bp+0C32h], 0
        sub ax, 6
        inc di
        inc di
        mov bp, word ptr [di-697Ch]
        shl bp, 1
        loop initialize_loop
        cmp word ptr ds:[9BA6h], 0
        jne short phase_selected
        mov ax, word ptr ds:[5EAAh]
        add ax, 1Dh
        mov word ptr ds:[5E9Eh], ax
        jmp short random_start
        nop
phase_selected:
        mov ax, word ptr ds:[0C96h]
        add ax, 1
        mov word ptr ds:[5E9Eh], ax
        mov word ptr ds:[0C96h], ax
        mov word ptr ds:[5EA2h], ax
        mov ax, word ptr ds:[0C82h]
        mov word ptr ds:[5EB6h], ax
random_start:
        call _FN_CIRCUIT_CGA_0620D
        mov cx, 9
        mov bp, 2
random_loop:
        push cx
        call _FN_CIRCUIT_CGA_0A6B8
        pop cx
        and ax, 0Fh
        add ax, bp
        mov word ptr [bp+0D72h], ax
        inc bp
        inc bp
        loop random_loop
        pop bp
        pop di
        ret
_grp_b0ef0812 ENDP
_TEXT ENDS
END
