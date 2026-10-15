.8086
CYCLES_TANDY_CLIP_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CYCLES_TANDY_CLIP_TEXT
        EXTRN _G_TANDY_CS_438A:WORD, _G_TANDY_CS_4392:WORD, _G_TANDY_CS_4394:WORD, _G_TANDY_CS_4396:WORD
        EXTRN _G_TANDY_CS_4398:WORD, _G_TANDY_CS_439A:WORD
        PUBLIC _grp_fdacd3b7
_grp_fdacd3b7 PROC FAR
        push bp
        mov bp, sp
        push ds
        push si
        push di
        sub sp, 10H
        mov ds, word ptr [bp + 8]
        mov si, word ptr [bp + 6]
        mov ax, word ptr [si + 8]
        mov word ptr [bp - 8], ax
        mov ax, word ptr [si + 0AH]
        mov word ptr [bp - 0AH], ax
        mov bx, word ptr [bp - 0AH]
        mov cx, word ptr [si + 2]
        lea dx, [si + 10H]
        mov ax, bx
        cmp ax, word ptr cs:[_G_TANDY_CS_4398]
        jl L_08AFE
        add ax, cx
        sub ax, word ptr cs:[_G_TANDY_CS_439A]
        jle L_08B1F
        sub cx, ax
        jg L_08B1F
L_08AF6:
        add sp, 10H
        pop di
        pop si
        pop ds
        pop bp
        retf
L_08AFE:
        mov bx, word ptr cs:[_G_TANDY_CS_4398]
        add ax, cx
        sub ax, bx
        jle L_08AF6
        xchg cx, ax
        sub ax, cx
        mul byte ptr [si]
        add dx, ax
        mov ax, bx
        add ax, cx
        sub ax, word ptr cs:[_G_TANDY_CS_439A]
        jle L_08B1F
        sub cx, ax
        jle L_08AF6
L_08B1F:
        mov word ptr [bp - 12H], dx
        mov word ptr [bp - 10H], cx
        mov word ptr [bp - 0AH], bx
        mov byte ptr [bp - 14H], 3
        mov cx, word ptr [si]
        xor dx, dx
        mov bx, word ptr [bp - 8]
        mov ax, bx
        and ax, 1
        mov word ptr [bp - 16H], ax
        sar bx, 1
        mov ax, bx
        cmp ax, word ptr cs:[_G_TANDY_CS_4394]
        jl L_08B5C
        add ax, cx
        sub ax, word ptr cs:[_G_TANDY_CS_4396]
        jl L_08B89
        mov byte ptr [bp - 14H], 2
        sub cx, ax
        jle L_08AF6
        mov dx, ax
        jmp short L_08B89
        nop
L_08B5C:
        mov bx, word ptr cs:[_G_TANDY_CS_4394]
        add ax, cx
        sub ax, bx
        jl L_08AF6
        mov si, cx
        sub si, ax
        add word ptr [bp - 12H], si
        mov byte ptr [bp - 14H], 1
        mov si, word ptr cs:[_G_TANDY_CS_4396]
        sub si, bx
        cmp ax, si
        jl L_08B83
        mov ax, si
        mov byte ptr [bp - 14H], 0
L_08B83:
        xchg cx, dx
        sub dx, ax
        add cx, ax
L_08B89:
        mov word ptr [bp - 0CH], cx
        mov word ptr [bp - 0EH], dx
        mov word ptr [bp - 8], bx
        cld
        mov es, word ptr cs:[_G_TANDY_CS_438A]
        mov bx, word ptr [bp - 0AH]
        shl bx, 1
        add bx, word ptr cs:[_G_TANDY_CS_4392]
        mov si, word ptr [bp - 12H]
        cmp byte ptr [bp - 16H], 0
        je L_08BAE
        jmp short L_08BCD
        nop
L_08BAE:
        mov dx, word ptr [bp - 10H]
        cmp word ptr [bp - 0CH], 0
        je L_08BCA
L_08BB7:
        mov di, word ptr cs:[bx]
        add di, word ptr [bp - 8]
        mov cx, word ptr [bp - 0CH]
        rep movsb
        add si, word ptr [bp - 0EH]
        inc bx
        inc bx
        dec dx
        jg L_08BB7
L_08BCA:
        jmp L_08AF6
L_08BCD:
        mov dl, byte ptr [bp - 14H]
L_08BD0:
        mov di, word ptr cs:[bx]
        add di, word ptr [bp - 8]
        mov cx, word ptr [bp - 0CH]
        test dl, 2
        jne L_08BF0
        mov dh, byte ptr [si - 1]
        shl dh, 1
        shl dh, 1
        shl dh, 1
        shl dh, 1
        or cx, cx
        je L_08C0D
        jmp short L_08BF6
        nop
L_08BF0:
        mov dh, byte ptr es:[di]
        and dh, 0F0H
L_08BF6:
        xor ah, ah
        lodsb
        ror ax, 1
        ror ax, 1
        ror ax, 1
        ror ax, 1
        or al, dh
        mov dh, ah
        stosb
        loop L_08BF6
        test dl, 1
        je L_08C15
L_08C0D:
        mov al, byte ptr es:[di]
        and al, 0FH
        or al, dh
        stosb
L_08C15:
        add si, word ptr [bp - 0EH]
        inc bx
        inc bx
        dec word ptr [bp - 10H]
        jg L_08BD0
        jmp L_08AF6
_grp_fdacd3b7 ENDP
CYCLES_TANDY_CLIP_TEXT ENDS
        END
