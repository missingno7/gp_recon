.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
BLIT_CIRCUIT_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:BLIT_CIRCUIT_TEXT, DS:DGROUP
        EXTRN _G_989E:BYTE
        EXTRN _G_98A6:BYTE
        EXTRN _G_4E8C:WORD
        EXTRN _G_4E94:WORD
        EXTRN _G_4E9E:WORD
        EXTRN _grp_9c73fa69:NEAR
        PUBLIC _grp_58166242
_grp_58166242 PROC NEAR
        push bp
        mov bp, sp
        push si
        push di
        sub sp, 8h
        cld
        cmp word ptr [bp+8h], 0
        jle SHORT _grp_9c73fa69+67h
        cmp word ptr [bp+0Ah], 0
        jle SHORT _grp_9c73fa69+67h
        mov es, word ptr cs:[_G_4E8C]
        mov cx, word ptr [bp+4h]
        mov bx, cx
        sar bx, 1h
        sar bx, 1h
        sar bx, 1h
        mov word ptr [bp-0Ch], bx
        mov bx, cx
        and bx, 7h
        mov dh, byte ptr DGROUP:[bx+_G_989E]
        add cx, word ptr [bp+8h]
        dec cx
        mov bx, cx
        and bx, 7h
        mov dl, byte ptr DGROUP:[bx+_G_98A6]
        sar cx, 1h
        sar cx, 1h
        sar cx, 1h
        sub cx, word ptr [bp-0Ch]
        mov bx, word ptr [bp+6h]
        shl bx, 1h
        add bx, word ptr cs:[_G_4E94]
        mov di, word ptr cs:[bx]
        add di, word ptr [bp-0Ch]
        mov word ptr [bp-6h], di
        mov ax, word ptr cs:[_G_4E9E]
        sub ax, cx
        mov word ptr [bp-8h], ax
        cmp word ptr cs:[_G_4E8C], 0A000h
        je SHORT L_9A0F
        lea si, word ptr DGROUP:[0C7BCh]
        dec cx
        mov word ptr [bp-0Ah], cx
        jg SHORT L_9A12
        je SHORT L_9A15
        and dh, dl
        mov dl, dh
        not dl
        mov al, byte ptr [bp+0Ch]
        mov ah, 4h
        mov bx, word ptr [bp-8h]
L_99DC:
        cmp word ptr cs:[si], 0
        je SHORT L_99F6
        mov es, word ptr cs:[si]
        mov di, word ptr [bp-6h]
        mov cx, word ptr [bp+0Ah]
        test al, 1h
        je SHORT L_9A06
L_99EF:
        or byte ptr es:[di], dh
        add di, bx
        loop L_99EF
L_99F6:
        shr al, 1h
        add si, 2h
        dec ah
        jg SHORT L_99DC
L_99FF:
        add sp, 8h
        pop di
        pop si
        pop bp
        ret
L_9A06:
        and byte ptr es:[di], dl
        add di, bx
        loop L_9A06
        jmp SHORT L_99F6
L_9A0F:
        jmp NEAR PTR L_9AA9
L_9A12:
        jmp SHORT L_9A57
        nop
L_9A15:
        mov al, byte ptr [bp+0Ch]
        mov ah, 4h
        mov bx, word ptr [bp-8h]
L_9A1D:
        cmp word ptr cs:[si], 0
        je SHORT L_9A3B
        mov es, word ptr cs:[si]
        mov di, word ptr [bp-6h]
        mov cx, word ptr [bp+0Ah]
        test al, 1h
        je SHORT L_9A46
L_9A30:
        or byte ptr es:[di], dh
        inc di
        or byte ptr es:[di], dl
        add di, bx
        loop L_9A30
L_9A3B:
        shr al, 1h
        add si, 2h
        dec ah
        jg SHORT L_9A1D
        jmp SHORT L_99FF
L_9A46:
        not dx
L_9A48:
        and byte ptr es:[di], dh
        inc di
        and byte ptr es:[di], dl
        add di, bx
        loop L_9A48
        not dx
        jmp SHORT L_9A3B
L_9A57:
        mov ah, 4h
L_9A59:
        cmp word ptr cs:[si], 0
        je SHORT L_9A82
        mov es, word ptr cs:[si]
        mov di, word ptr [bp-6h]
        mov bx, word ptr [bp+0Ah]
        test byte ptr [bp+0Ch], 1h
        je SHORT L_9A8F
        mov al, 0FFh
L_9A70:
        or byte ptr es:[di], dh
        inc di
        mov cx, word ptr [bp-0Ah]
        rep stosb
        or byte ptr es:[di], dl
        add di, word ptr [bp-8h]
        dec bx
        jg SHORT L_9A70
L_9A82:
        shr byte ptr [bp+0Ch], 1h
        add si, 2h
        dec ah
        jg SHORT L_9A59
        jmp NEAR PTR L_99FF
L_9A8F:
        not dx
        xor al, al
L_9A93:
        and byte ptr es:[di], dh
        inc di
        mov cx, word ptr [bp-0Ah]
        rep stosb
        and byte ptr es:[di], dl
        add di, word ptr [bp-8h]
        dec bx
        jg SHORT L_9A93
        not dx
        jmp SHORT L_9A82
L_9AA9:
        mov bx, dx
        mov dx, 3CEh
        mov al, 5h
        out dx, al
        inc dx
        mov al, 2h
        out dx, al
        mov dx, 3C4h
        mov al, 2h
        out dx, al
        inc dx
        mov al, 0FFh
        out dx, al
        dec cx
        mov word ptr [bp-0Ah], cx
        jg SHORT L_9B04
        je SHORT L_9B07
        and bh, bl
        mov dx, 3CEh
        mov al, 8h
        out dx, al
        inc dx
        mov al, bh
        out dx, al
        mov di, word ptr [bp-6h]
        mov cx, word ptr [bp+0Ah]
        mov al, byte ptr [bp+0Ch]
        mov dx, 28h
L_9ADF:
        mov ah, byte ptr es:[di]
        mov byte ptr es:[di], al
        add di, dx
        loop L_9ADF
L_9AE9:
        mov dx, 3CEh
        mov al, 8h
        out dx, al
        inc dx
        mov al, 0FFh
        out dx, al
        mov dx, 3CEh
        mov al, 5h
        out dx, al
        inc dx
        mov al, 0
        out dx, al
        add sp, 8h
        pop di
        pop si
        pop bp
        ret
L_9B04:
        jmp SHORT L_9B4A
        nop
L_9B07:
        mov dx, 3CEh
        mov al, 8h
        out dx, al
        inc dx
        mov al, bh
        out dx, al
        mov di, word ptr [bp-6h]
        mov cx, word ptr [bp+0Ah]
        mov al, byte ptr [bp+0Ch]
        mov dx, 28h
L_9B1D:
        mov ah, byte ptr es:[di]
        mov byte ptr es:[di], al
        add di, dx
        loop L_9B1D
        mov dx, 3CEh
        mov al, 8h
        out dx, al
        inc dx
        mov al, bl
        out dx, al
        mov di, word ptr [bp-6h]
        inc di
        mov cx, word ptr [bp+0Ah]
        mov al, byte ptr [bp+0Ch]
        mov dx, 28h
L_9B3E:
        mov ah, byte ptr es:[di]
        mov byte ptr es:[di], al
        add di, dx
        loop L_9B3E
        jmp SHORT L_9AE9
L_9B4A:
        mov dx, 3CEh
        mov al, 8h
        out dx, al
        inc dx
        mov al, bh
        out dx, al
        mov di, word ptr [bp-6h]
        mov cx, word ptr [bp+0Ah]
        mov al, byte ptr [bp+0Ch]
        mov dx, 28h
L_9B60:
        mov ah, byte ptr es:[di]
        mov byte ptr es:[di], al
        add di, dx
        loop L_9B60
        mov dx, 3CEh
        mov al, 8h
        out dx, al
        inc dx
        mov al, bl
        out dx, al
        mov di, word ptr [bp-6h]
        add di, word ptr [bp-0Ah]
        inc di
        mov cx, word ptr [bp+0Ah]
        mov al, byte ptr [bp+0Ch]
        mov dx, 28h
L_9B84:
        mov ah, byte ptr es:[di]
        mov byte ptr es:[di], al
        add di, dx
        loop L_9B84
        mov dx, 3CEh
        mov al, 8h
        out dx, al
        inc dx
        mov al, 0FFh
        out dx, al
        mov di, word ptr [bp-6h]
        inc di
        mov bx, word ptr [bp+0Ah]
        mov al, byte ptr [bp+0Ch]
        mov dx, word ptr [bp-8h]
        inc dx
L_9BA6:
        mov cx, word ptr [bp-0Ah]
L_9BA9:
        mov ah, byte ptr es:[di]
        stosb
        loop L_9BA9
        add di, dx
        dec bx
        jg SHORT L_9BA6
        jmp NEAR PTR L_9AE9
_grp_58166242 ENDP
BLIT_CIRCUIT_TEXT ENDS
        END
