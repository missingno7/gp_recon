.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
BLIT_CYCLES_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:BLIT_CYCLES_TEXT, DS:DGROUP
        EXTRN _G_989E:BYTE
        EXTRN _G_98A6:BYTE
        EXTRN _G_4E8C:WORD
        EXTRN _G_4E94:WORD
        EXTRN _G_4E9E:WORD
        EXTRN _grp_9c73fa69:NEAR
        PUBLIC _grp_58166242
_grp_58166242 PROC FAR
        push bp
        mov bp, sp
        push si
        push di
        sub sp, 8h
        cld
        cmp word ptr [bp+0Ah], 0
        jle SHORT _grp_9c73fa69+67h
        cmp word ptr [bp+0Ch], 0
        jle SHORT _grp_9c73fa69+67h
        mov es, word ptr cs:[_G_4E8C]
        mov cx, word ptr [bp+6h]
        mov bx, cx
        sar bx, 1h
        sar bx, 1h
        sar bx, 1h
        mov word ptr [bp-0Ch], bx
        mov bx, cx
        and bx, 7h
        mov dh, byte ptr DGROUP:[bx+_G_989E]
        add cx, word ptr [bp+0Ah]
        dec cx
        mov bx, cx
        and bx, 7h
        mov dl, byte ptr DGROUP:[bx+_G_98A6]
        sar cx, 1h
        sar cx, 1h
        sar cx, 1h
        sub cx, word ptr [bp-0Ch]
        mov bx, word ptr [bp+8h]
        shl bx, 1h
        add bx, word ptr cs:[_G_4E94]
        mov di, word ptr cs:[bx]
        add di, word ptr [bp-0Ch]
        mov word ptr [bp-6h], di
        mov ax, word ptr cs:[_G_4E9E]
        sub ax, cx
        mov word ptr [bp-8h], ax
        cmp word ptr cs:[_G_4E8C], 0A000h
        je SHORT L_7C75
        lea si, word ptr DGROUP:[4E8Ch]
        dec cx
        mov word ptr [bp-0Ah], cx
        jg SHORT L_7C78
        je SHORT L_7C7B
        and dh, dl
        mov dl, dh
        not dl
        mov al, byte ptr [bp+0Eh]
        mov ah, 4h
        mov bx, word ptr [bp-8h]
L_7C42:
        cmp word ptr cs:[si], 0
        je SHORT L_7C5C
        mov es, word ptr cs:[si]
        mov di, word ptr [bp-6h]
        mov cx, word ptr [bp+0Ch]
        test al, 1h
        je SHORT L_7C6C
L_7C55:
        or byte ptr es:[di], dh
        add di, bx
        loop L_7C55
L_7C5C:
        shr al, 1h
        add si, 2h
        dec ah
        jg SHORT L_7C42
L_7C65:
        add sp, 8h
        pop di
        pop si
        pop bp
        retf
L_7C6C:
        and byte ptr es:[di], dl
        add di, bx
        loop L_7C6C
        jmp SHORT L_7C5C
L_7C75:
        jmp NEAR PTR L_7D0F
L_7C78:
        jmp SHORT L_7CBD
        nop
L_7C7B:
        mov al, byte ptr [bp+0Eh]
        mov ah, 4h
        mov bx, word ptr [bp-8h]
L_7C83:
        cmp word ptr cs:[si], 0
        je SHORT L_7CA1
        mov es, word ptr cs:[si]
        mov di, word ptr [bp-6h]
        mov cx, word ptr [bp+0Ch]
        test al, 1h
        je SHORT L_7CAC
L_7C96:
        or byte ptr es:[di], dh
        inc di
        or byte ptr es:[di], dl
        add di, bx
        loop L_7C96
L_7CA1:
        shr al, 1h
        add si, 2h
        dec ah
        jg SHORT L_7C83
        jmp SHORT L_7C65
L_7CAC:
        not dx
L_7CAE:
        and byte ptr es:[di], dh
        inc di
        and byte ptr es:[di], dl
        add di, bx
        loop L_7CAE
        not dx
        jmp SHORT L_7CA1
L_7CBD:
        mov ah, 4h
L_7CBF:
        cmp word ptr cs:[si], 0
        je SHORT L_7CE8
        mov es, word ptr cs:[si]
        mov di, word ptr [bp-6h]
        mov bx, word ptr [bp+0Ch]
        test byte ptr [bp+0Eh], 1h
        je SHORT L_7CF5
        mov al, 0FFh
L_7CD6:
        or byte ptr es:[di], dh
        inc di
        mov cx, word ptr [bp-0Ah]
        rep stosb
        or byte ptr es:[di], dl
        add di, word ptr [bp-8h]
        dec bx
        jg SHORT L_7CD6
L_7CE8:
        shr byte ptr [bp+0Eh], 1h
        add si, 2h
        dec ah
        jg SHORT L_7CBF
        jmp NEAR PTR L_7C65
L_7CF5:
        not dx
        xor al, al
L_7CF9:
        and byte ptr es:[di], dh
        inc di
        mov cx, word ptr [bp-0Ah]
        rep stosb
        and byte ptr es:[di], dl
        add di, word ptr [bp-8h]
        dec bx
        jg SHORT L_7CF9
        not dx
        jmp SHORT L_7CE8
L_7D0F:
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
        jg SHORT L_7D6C
        je SHORT L_7D6F
        and bh, bl
        mov dx, 3CEh
        mov al, 8h
        out dx, al
        inc dx
        mov al, bh
        out dx, al
        mov di, word ptr [bp-6h]
        mov cx, word ptr [bp+0Ch]
        mov al, byte ptr [bp+0Eh]
        mov dx, word ptr cs:[_G_4E9E]
L_7D47:
        mov ah, byte ptr es:[di]
        mov byte ptr es:[di], al
        add di, dx
        loop L_7D47
L_7D51:
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
        retf
L_7D6C:
        jmp SHORT L_7DB6
        nop
L_7D6F:
        mov dx, 3CEh
        mov al, 8h
        out dx, al
        inc dx
        mov al, bh
        out dx, al
        mov di, word ptr [bp-6h]
        mov cx, word ptr [bp+0Ch]
        mov al, byte ptr [bp+0Eh]
        mov dx, word ptr cs:[_G_4E9E]
L_7D87:
        mov ah, byte ptr es:[di]
        mov byte ptr es:[di], al
        add di, dx
        loop L_7D87
        mov dx, 3CEh
        mov al, 8h
        out dx, al
        inc dx
        mov al, bl
        out dx, al
        mov di, word ptr [bp-6h]
        inc di
        mov cx, word ptr [bp+0Ch]
        mov al, byte ptr [bp+0Eh]
        mov dx, word ptr cs:[_G_4E9E]
L_7DAA:
        mov ah, byte ptr es:[di]
        mov byte ptr es:[di], al
        add di, dx
        loop L_7DAA
        jmp SHORT L_7D51
L_7DB6:
        mov dx, 3CEh
        mov al, 8h
        out dx, al
        inc dx
        mov al, bh
        out dx, al
        mov di, word ptr [bp-6h]
        mov cx, word ptr [bp+0Ch]
        mov al, byte ptr [bp+0Eh]
        mov dx, word ptr cs:[_G_4E9E]
L_7DCE:
        mov ah, byte ptr es:[di]
        mov byte ptr es:[di], al
        add di, dx
        loop L_7DCE
        mov dx, 3CEh
        mov al, 8h
        out dx, al
        inc dx
        mov al, bl
        out dx, al
        mov di, word ptr [bp-6h]
        add di, word ptr [bp-0Ah]
        inc di
        mov cx, word ptr [bp+0Ch]
        mov al, byte ptr [bp+0Eh]
        mov dx, word ptr cs:[_G_4E9E]
L_7DF4:
        mov ah, byte ptr es:[di]
        mov byte ptr es:[di], al
        add di, dx
        loop L_7DF4
        mov dx, 3CEh
        mov al, 8h
        out dx, al
        inc dx
        mov al, 0FFh
        out dx, al
        mov di, word ptr [bp-6h]
        inc di
        mov bx, word ptr [bp+0Ch]
        mov al, byte ptr [bp+0Eh]
        mov dx, word ptr [bp-8h]
        inc dx
L_7E16:
        mov cx, word ptr [bp-0Ah]
L_7E19:
        mov ah, byte ptr es:[di]
        stosb
        loop L_7E19
        add di, dx
        dec bx
        jg SHORT L_7E16
        jmp NEAR PTR L_7D51
_grp_58166242 ENDP
BLIT_CYCLES_TEXT ENDS
        END
