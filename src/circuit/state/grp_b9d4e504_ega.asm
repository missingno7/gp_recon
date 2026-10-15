_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_04401:NEAR
        EXTRN _FN_CIRCUIT_EGA_044B2:NEAR
        EXTRN _FN_CIRCUIT_EGA_0560E:NEAR
        EXTRN _FN_CIRCUIT_EGA_05C6D:NEAR
        EXTRN _FN_CIRCUIT_EGA_08CF6:NEAR
        EXTRN _FN_CIRCUIT_EGA_0BB7A:NEAR
        EXTRN _GRP_192EA5FD:NEAR
        EXTRN _GRP_487BD94E:NEAR
        EXTRN _GRP_523F4A71:NEAR
        EXTRN _GRP_D4BED92B:NEAR
        PUBLIC _grp_b9d4e504
_grp_b9d4e504 PROC NEAR
        call _FN_CIRCUIT_EGA_05C6D
        mov ax, word ptr ds:[66ch]
        mov bx, word ptr ds:[66eh]
        mov word ptr ds:[66ch], bx
        mov word ptr ds:[66eh], ax
        cmp word ptr ds:[66ah], 0
        je short L_5B2B
        cmp word ptr ds:[66eh], -1
        jne short L_5B2B
        mov word ptr ds:[66eh], 26h
L_5B2B:
        cmp word ptr ds:[66ch], -1
        je short L_5B3F
        cmp word ptr ds:[66eh], -1
        jne short L_5B3F
        mov word ptr ds:[66eh], 26h
L_5B3F:
        mov ax, word ptr ds:[5ebeh]
        sub ax, 14h
        mov word ptr ds:[7188h], ax
        mov bp, 26h
L_5B4B:
        mov si, word ptr [bp+0a1ah]
        mov word ptr cs:[0c7cch], si
        mov al, byte ptr [bp+747eh]
        test al, 8
        je short L_5B71
        xor dh, dh
        mov dl, byte ptr [bp+5c28h]
        shr dl, 1
        mov di, word ptr [bp+5d0eh]
        shl di, 1
        add di, 6190h
        call _GRP_D4BED92B
L_5B71:
        mov al, byte ptr [bp+747eh]
        cmp al, 4
        jne short L_5B7C
        call _GRP_487BD94E
L_5B7C:
        mov al, byte ptr [bp+74d2h]
        cmp al, 4dh
        jl short L_5BB7
        cmp bp, word ptr ds:[66eh]
        je short L_5BAC
        cmp al, 4eh
        je short L_5BAC
        jg short L_5B96
        call _FN_CIRCUIT_EGA_04401
        jmp short L_5BB7
        nop
L_5B96:
        mov si, word ptr [bp+0a1ah]
        mov dl, byte ptr [si+5c9bh]
        shl si, 1
        mov di, word ptr [si+0b28h]
        shr si, 1
        call _GRP_523F4A71
        jmp short L_5BB7
        nop
L_5BAC:
        shl si, 1
        mov di, word ptr [si+0b28h]
        shr si, 1
        call _GRP_192EA5FD
L_5BB7:
        jmp short L_5BC5
        nop
L_5BBA:
        inc word ptr ds:[7188h]
        dec bp
        dec bp
        jle short L_5BC4
        jmp short L_5B4B
L_5BC4:
        ret
L_5BC5:
        mov di, bp
        neg di
        mov al, byte ptr [di+0b8eh]
        mov word ptr ds:[0a6eh], di
        or al, al
        jne short L_5BD8
        jmp L_5C66
L_5BD8:
        mov word ptr ds:[0a6eh], di
        xor ah, ah
        mov word ptr ds:[0a6ah], ax
        mov bx, ax
        mov di, ax
        mov word ptr ds:[0a6ch], bp
        mov si, word ptr [bp+0a1ah]
        shl si, 1
        mov dx, word ptr [si+0ae0h]
        mov bx, word ptr [di+0c0eh]
        neg bx
        call _FN_CIRCUIT_EGA_0560E
        mov bx, word ptr ds:[0a6ch]
        mov di, si
        cmp di, 2ch
        jl short L_5C10
        mov di, word ptr [bx+0a1ah]
        shl di, 1
        sub di, 2
L_5C10:
        add ax, word ptr [di+6fbch]
        shr si, 1
        add bx, 5d0eh
        call _FN_CIRCUIT_EGA_044B2
        add bx, 69dch
        mov dx, bx
        add dx, 10h
        mov di, word ptr ds:[0a6ah]
        add dx, word ptr [di+6720h]
        mov word ptr cs:[0c7cch], 16h
        mov di, dx
        push si
        push ax
        push word ptr [di+2]
        push word ptr [di]
        push si
        push ax
        push word ptr [bx+2]
        push word ptr [bx]
        call _FN_CIRCUIT_EGA_08CF6
        add sp, 8
        call _FN_CIRCUIT_EGA_0BB7A
        add sp, 8
        mov di, word ptr ds:[0a6eh]
        mov al, byte ptr [di+0b8fh]
        or al, al
        je short L_5C66
        xor ah, ah
        mov word ptr [di+0b8eh], ax
        jmp L_5BD8
L_5C66:
        mov si, word ptr [bp+0a1ah]
        jmp L_5BBA
_grp_b9d4e504 ENDP
_TEXT ENDS
END
