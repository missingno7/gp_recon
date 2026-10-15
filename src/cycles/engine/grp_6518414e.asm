        EXTRN   _GRP_9AD82DAE:FAR, _CYCLES_MAIN_TEXT:FAR
_CSEG_414E SEGMENT PARA PUBLIC 'CODE'
        EXTRN   _FN_CYCLES_CGA_00C23:NEAR, _GRP_47295F00:NEAR, _GRP_3D9F65A8:NEAR, _GRP_92FAC325:NEAR, _GRP_94E264CE:NEAR, _GRP_34645688:NEAR, _GRP_4B4F6F41:NEAR, _FN_CYCLES_CGA_00ADA:NEAR
        ASSUME  CS:_CSEG_414E
        PUBLIC  _grp_6518414e
_grp_6518414e PROC NEAR
        call _FN_CYCLES_CGA_00C23
        mov ax, word ptr ds:[459eh]
        add ax, 8eh
        mov word ptr ds:[201ah], ax
        mov bp, 8eh
        mov word ptr ds:[201eh], 0ffffh
        cmp byte ptr [bp - 762eh], 3
        jne L0808
        mov word ptr ds:[201eh], bp
L0808:
        mov di, word ptr ds:[45a0h]
        shr di, 1
        shr di, 1
        shr di, 1
        shr di, 1
        shr di, 1
        shl di, 1
        neg di
        add di, 16
        mov word ptr ds:[8216], di
        shl bp, 1
        shl bp, 1
        shl bp, 1
        add di, bp
        shr bp, 1
        shr bp, 1
        shr bp, 1
L082F:
        cmp word ptr [bp + 8786], 0
        je L0869
        mov ax, SEG _CYCLES_MAIN_TEXT
        mov es, ax
        or bp, bp
        jle L0851
        mov si, word ptr [bp - 79c2h]
        sar si, 1
        inc si
        mov word ptr es:[18450], si
        cmp si, 9fh
        jbe L0858
L0851:
        mov word ptr es:[18450], 9fh
L0858:
        push si
        push bp
        push bp
        push word ptr [di + 3f16h]
        call FAR PTR _GRP_9AD82DAE
        add sp, 4
        pop bp
        pop si
L0869:
        mov si, word ptr [bp - 79c0h]
        sar si, 1
        mov ax, SEG _CYCLES_MAIN_TEXT
        mov es, ax
        mov word ptr es:[18450], si
        cmp si, 9fh
        jbe L0886
        mov word ptr es:[18450], 9fh
L0886:
        mov si, word ptr [bp - 77f2h]
        add si, 1
        sar si, 1
        or bp, bp
        jge L0899
        mov si, 9fh
        jmp NEAR PTR L0957
L0899:
        mov al, byte ptr [bp - 76c2h]
        test al, 128
        je L08D6
        xor dh, dh
        mov dl, byte ptr [di + 3a76h]
        push di
        mov di, word ptr [bp + 43b6h]
        shl di, 1
        add di, 48bch
        call _GRP_47295F00
        mov di, word ptr [bp + 43b6h]
        shl di, 1
        add di, 47fch
        mov bx, ax
        and bx, 3
        shl bx, 1
        shl bx, 1
        shl bx, 1
        shl bx, 1
        shl bx, 1
        shl bx, 1
        add di, bx
        call _GRP_47295F00
        pop di
L08D6:
        mov al, byte ptr [bp - 76c2h]
        cmp al, 4
        jne L090A
        call _GRP_3D9F65A8
        mov ax, 8a76h
        mov word ptr ds:[8240], ax
        mov ah, byte ptr [di + 16d8h]
        xor al, al
        call _GRP_92FAC325
        cmp word ptr ds:[45dch], -1
        jne L090A
        xor dx, dx
        push di
        mov di, word ptr [bp + 43b6h]
        shl di, 1
        add di, 18768
        xor al, al
        call _GRP_47295F00
        pop di
L090A:
        cmp byte ptr [bp - 762eh], 3
        jne L0957
        mov al, byte ptr [bp - 76c2h]
        cmp al, 5
        jne L0922
        mov dx, word ptr [di + 3f16h]
        call _GRP_94E264CE
        jmp SHORT L0937
L0922:
        cmp al, 6
        je L0930
        xor dx, dx
        cmp word ptr ds:[201eh], bp
        je L0934
        jmp SHORT L0937
L0930:
        mov dx, word ptr [di + 3f16h]
L0934:
        call _GRP_34645688
L0937:
        cmp byte ptr [bp - 76c2h], 7
        jne L0945
        mov dx, word ptr [di + 3f16h]
        call _GRP_4B4F6F41
L0945:
        cmp byte ptr [bp - 76c2h], 8
        jne L0957
        mov dx, word ptr [di + 3f16h]
        mov bx, word ptr [bp + 43b6h]
        call _FN_CYCLES_CGA_00ADA
L0957:
        dec word ptr ds:[201ah]
        sub di, 16
        dec bp
        dec bp
        jl L0965
        jmp NEAR PTR L082F
L0965:
        ret
_grp_6518414e ENDP
_CSEG_414E ENDS
        END
