        EXTRN   _GRP_9AD82DAE:FAR, _CYCLES_MAIN_TEXT:FAR
_CSEG_0171 SEGMENT PARA PUBLIC 'CODE'
        EXTRN   _FN_CYCLES_CGA_00C23:NEAR, _GRP_47295F00:NEAR, _GRP_3D9F65A8:NEAR, _GRP_94E264CE:NEAR, _GRP_34645688:NEAR, _GRP_4B4F6F41:NEAR, _FN_CYCLES_CGA_00ADA:NEAR
        ASSUME  CS:_CSEG_0171
        PUBLIC  _grp_e24a0171
_grp_e24a0171 PROC NEAR
        cmp word ptr ds:[0ef6h], 40
        jg L1FF7
        mov word ptr ds:[0ef6h], 40
L1FF7:
        call _FN_CYCLES_CGA_00C23
        mov ax, word ptr ds:[459eh]
        add ax, 4ah
        mov word ptr ds:[8706], ax
        mov bp, 4ah
        mov word ptr ds:[201ch], 0ffffh
        cmp byte ptr [bp - 762eh], 3
        jne L2017
        mov word ptr ds:[201ch], bp
L2017:
        mov di, word ptr ds:[45a0h]
        shr di, 1
        shr di, 1
        shr di, 1
        shr di, 1
        shr di, 1
        shl di, 1
        mov word ptr ds:[8704], di
        shl bp, 1
        shl bp, 1
        shl bp, 1
        add di, bp
        shr bp, 1
        shr bp, 1
        shr bp, 1
L2039:
        mov si, word ptr [bp - 79c0h]
        sar si, 1
        mov ax, SEG _CYCLES_MAIN_TEXT
        mov es, ax
        mov word ptr es:[18450], si
        cmp si, 3ch
        jbe L2055
        mov word ptr es:[18450], 3ch
L2055:
        mov si, word ptr [bp - 77f2h]
        add si, 1
        sar si, 1
        mov bx, bp
        neg bx
        cmp word ptr [bx + 8786], 0
        je L207A
        push si
        push bp
        push bp
        push word ptr [di + 3f16h]
        call FAR PTR _GRP_9AD82DAE
        add sp, 4
        pop bp
        pop si
L207A:
        or bp, bp
        jge L2084
        mov si, 9fh
        jmp NEAR PTR L211D
L2084:
        mov al, byte ptr [bp - 76c2h]
        test al, 128
        je L20B0
        xor dh, dh
        mov dl, byte ptr [di + 3a76h]
        shr dl, 1
        push di
        mov di, word ptr [bp + 44f0h]
        shl di, 1
        add di, 48bch
        call _GRP_47295F00
        mov di, word ptr [bp + 44f0h]
        shl di, 1
        add di, 47dch
        call _GRP_47295F00
        pop di
L20B0:
        cmp byte ptr [bp - 76c2h], 4
        jne L20C9
        call _GRP_3D9F65A8
        mov ax, word ptr ds:[1808]
        cmp ax, word ptr ds:[0b57ah]
        jne L20C9
        mov word ptr ds:[45dch], 0ffffh
L20C9:
        cmp byte ptr [bp - 762eh], 3
        jne L211D
        mov al, byte ptr [bp - 76c2h]
        cmp al, 6
        jne L20E3
        mov dx, word ptr [di + 3f16h]
        shr dx, 1
        call _GRP_94E264CE
        jmp SHORT L2100
L20E3:
        cmp al, 5
        je L20F1
        xor dx, dx
        cmp word ptr ds:[201ch], bp
        je L20F7
        jmp SHORT L2100
L20F1:
        mov dx, word ptr [di + 3f16h]
        shr dx, 1
L20F7:
        mov ax, word ptr ds:[201eh]
        mov word ptr ds:[201ch], ax
        call _GRP_34645688
L2100:
        cmp byte ptr [bp - 76c2h], 0
        je L211D
        mov dx, word ptr [di + 3f16h]
        shr dx, 1
        call _GRP_4B4F6F41
        mov dx, word ptr [di + 3f16h]
        shr dx, 1
        mov bx, word ptr [bp + 43b6h]
        call _FN_CYCLES_CGA_00ADA
L211D:
        dec word ptr ds:[8706]
        dec bp
        dec bp
        sub di, 16
        or bp, bp
        jle L212D
        jmp NEAR PTR L2039
L212D:
        ret
_grp_e24a0171 ENDP
_CSEG_0171 ENDS
        END
