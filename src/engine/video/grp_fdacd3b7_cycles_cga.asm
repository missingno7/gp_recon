.8086
CYCLES_CGA_CLIP_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CYCLES_CGA_CLIP_TEXT
        EXTRN _G_37D1:WORD, _G_4802:WORD, _G_480A:WORD, _G_480C:WORD
        EXTRN _G_480E:WORD, _G_4810:WORD, _G_4812:WORD
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
        cmp ax, word ptr cs:[_G_4810]
        jl L_08C6E
        add ax, cx
        sub ax, word ptr cs:[_G_4812]
        jle L_08C8F
        sub cx, ax
        jg L_08C8F
L_08C66:
        add sp, 10H
        pop di
        pop si
        pop ds
        pop bp
        retf
L_08C6E:
        mov bx, word ptr cs:[_G_4810]
        add ax, cx
        sub ax, bx
        jle L_08C66
        xchg cx, ax
        sub ax, cx
        mul byte ptr [si]
        add dx, ax
        mov ax, bx
        add ax, cx
        sub ax, word ptr cs:[_G_4812]
        jle L_08C8F
        sub cx, ax
        jle L_08C66
L_08C8F:
        mov word ptr [bp - 12H], dx
        mov word ptr [bp - 10H], cx
        mov word ptr [bp - 0AH], bx
        mov byte ptr [bp - 14H], 3
        mov cx, word ptr [si]
        xor dx, dx
        mov bx, word ptr [bp - 8]
        mov ax, bx
        and ax, 3
        mov word ptr [bp - 16H], ax
        sar bx, 1
        sar bx, 1
        mov ax, bx
        cmp ax, word ptr cs:[_G_480C]
        jl L_08CCE
        add ax, cx
        sub ax, word ptr cs:[_G_480E]
        jl L_08CFB
        mov byte ptr [bp - 14H], 2
        sub cx, ax
        jle L_08C66
        mov dx, ax
        jmp short L_08CFB
        nop
L_08CCE:
        mov bx, word ptr cs:[_G_480C]
        add ax, cx
        sub ax, bx
        jl L_08C66
        mov si, cx
        sub si, ax
        add word ptr [bp - 12H], si
        mov byte ptr [bp - 14H], 1
        mov si, word ptr cs:[_G_480E]
        sub si, bx
        cmp ax, si
        jl L_08CF5
        mov ax, si
        mov byte ptr [bp - 14H], 0
L_08CF5:
        xchg cx, dx
        sub dx, ax
        add cx, ax
L_08CFB:
        mov word ptr [bp - 0CH], cx
        mov word ptr [bp - 0EH], dx
        mov word ptr [bp - 8], bx
        cld
        mov es, word ptr cs:[_G_4802]
        mov bx, word ptr [bp - 0AH]
        shl bx, 1
        add bx, word ptr cs:[_G_480A]
        mov si, word ptr [bp - 12H]
        mov di, word ptr [bp - 16H]
        shl di, 1
        jmp word ptr cs:[di+37D1H]
_grp_fdacd3b7 ENDP
CYCLES_CGA_CLIP_TEXT ENDS
        END
