.8086
CIRCUIT_MAIN_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CIRCUIT_MAIN_TEXT
        EXTRN _G_A83C:WORD, _G_A844:WORD, _G_A846:WORD
        EXTRN _G_A848:WORD, _G_A84A:WORD, _G_A84C:WORD
        PUBLIC _grp_fdacd3b7
_grp_fdacd3b7 PROC NEAR
        push bp
        mov bp, sp
        push ds
        push si
        push di
        sub sp, 10H
        mov ds, word ptr [bp + 6]
        mov si, word ptr [bp + 4]
        mov ax, word ptr [si + 8]
        mov word ptr [bp - 8], ax
        mov ax, word ptr [si + 0AH]
        mov word ptr [bp - 0AH], ax
        mov bx, word ptr [bp - 0AH]
        mov cx, word ptr [si + 2]
        lea dx, [si + 10H]
        mov ax, bx
        cmp ax, word ptr cs:[_G_A84A]
        jl L_09850
        add ax, cx
        sub ax, word ptr cs:[_G_A84C]
        jle L_09871
        sub cx, ax
        jg L_09871
L_09848:
        add sp, 10H
        pop di
        pop si
        pop ds
        pop bp
        ret
L_09850:
        mov bx, word ptr cs:[_G_A84A]
        add ax, cx
        sub ax, bx
        jle L_09848
        xchg cx, ax
        sub ax, cx
        mul byte ptr [si]
        add dx, ax
        mov ax, bx
        add ax, cx
        sub ax, word ptr cs:[_G_A84C]
        jle L_09871
        sub cx, ax
        jle L_09848
L_09871:
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
        cmp ax, word ptr cs:[_G_A846]
        jl L_098B0
        add ax, cx
        sub ax, word ptr cs:[_G_A848]
        jl L_098DD
        mov byte ptr [bp - 14H], 2
        sub cx, ax
        jle L_09848
        mov dx, ax
        jmp short L_098DD
        nop
L_098B0:
        mov bx, word ptr cs:[_G_A846]
        add ax, cx
        sub ax, bx
        jl L_09848
        mov si, cx
        sub si, ax
        add word ptr [bp - 12H], si
        mov byte ptr [bp - 14H], 1
        mov si, word ptr cs:[_G_A848]
        sub si, bx
        cmp ax, si
        jl L_098D7
        mov ax, si
        mov byte ptr [bp - 14H], 0
L_098D7:
        xchg cx, dx
        sub dx, ax
        add cx, ax
L_098DD:
        mov word ptr [bp - 0CH], cx
        mov word ptr [bp - 0EH], dx
        mov word ptr [bp - 8], bx
        cld
        mov es, word ptr cs:[_G_A83C]
        mov bx, word ptr [bp - 0AH]
        shl bx, 1
        add bx, word ptr cs:[_G_A844]
        mov si, word ptr [bp - 12H]
        mov di, word ptr [bp - 16H]
        shl di, 1
        jmp word ptr cs:[di-66FDH]
_grp_fdacd3b7 ENDP
CIRCUIT_MAIN_TEXT ENDS
        END
