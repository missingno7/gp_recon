_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_0681E:NEAR
        EXTRN _FN_CIRCUIT_EGA_06872:NEAR
        EXTRN _FN_CIRCUIT_EGA_06E10:NEAR
        EXTRN _FN_CIRCUIT_EGA_08C1D:NEAR
        EXTRN _FN_CIRCUIT_EGA_08C44:NEAR
        EXTRN _FN_CIRCUIT_EGA_0B9D2:NEAR
        EXTRN _FN_CIRCUIT_EGA_0DFF4:NEAR
        PUBLIC _grp_aace91da
_grp_aace91da PROC NEAR
        push bp
        mov bp, sp
        sub sp, 6
        push si
        mov ax, word ptr [bp+8]
        mov word ptr ds:[9904h], ax
        mov ax, word ptr [bp+0ah]
        mov word ptr ds:[9906h], ax
        mov bx, word ptr [bp+6]
        mov si, word ptr [bp+4]
        mov byte ptr [bx+si], 0
        mov word ptr [bp-4], 0
        jmp short L_6B77
        nop
L_6B74:
        inc word ptr [bp-4]
L_6B77:
        mov bx, word ptr [bp-4]
        mov si, word ptr [bp+4]
        cmp byte ptr [bx+si], 0
        je short L_6B87
        jmp short L_6B74
L_6B84:
        inc word ptr [bp-4]
L_6B87:
        mov ax, word ptr [bp+6]
        cmp word ptr [bp-4], ax
        jge short L_6B9A
        mov bx, word ptr [bp-4]
        mov si, word ptr [bp+4]
        mov byte ptr [bx+si], 20h
        jmp short L_6B84
L_6B9A:
        push word ptr [bp+0ah]
        push word ptr [bp+8]
        push word ptr [bp+4]
        call _FN_CIRCUIT_EGA_0B9D2
        add sp, 6
        mov word ptr ds:[9910h], 0
        mov word ptr ds:[9ba6h], 1
        mov word ptr [bp-2], 0
        mov ax, 1
        push ax
        push word ptr [bp+0ah]
        push word ptr [bp+8]
        call _FN_CIRCUIT_EGA_0DFF4
        add sp, 6
        mov word ptr ds:[9cbeh], 1
        push word ptr [bp+0eh]
        push word ptr [bp+0ch]
        call _FN_CIRCUIT_EGA_08C1D
        add sp, 4
        mov ax, 4
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_EGA_06872
        add sp, 4
L_6BE8:
        call _FN_CIRCUIT_EGA_0681E
        mov word ptr [bp-6], ax
        or ax, ax
        jne short L_6C48
        mov ax, 4
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_EGA_06872
        add sp, 4
        push word ptr ds:[9ba6h]
        push word ptr [bp+0ah]
        mov ax, word ptr [bp+8]
        mov dx, word ptr ds:[9910h]
        mov cl, 3
        shl dx, cl
        add ax, dx
        push ax
        call _FN_CIRCUIT_EGA_0DFF4
        add sp, 6
        cmp word ptr ds:[9cbeh], 0
        je short L_6C28
        mov word ptr ds:[9cbeh], 0
        jmp short L_6C2E
L_6C28:
        mov word ptr ds:[9cbeh], 1
L_6C2E:
        mov ax, word ptr [bp+0ch]
        or ax, word ptr [bp+0eh]
        je short L_6BE8
        call _FN_CIRCUIT_EGA_08C44
        or ax, ax
        je short L_6BE8
L_6C3D:
        call _FN_CIRCUIT_EGA_06E10
        mov ax, word ptr [bp-6]
        pop si
        mov sp, bp
        pop bp
        ret
L_6C48:
        push word ptr [bp+0eh]
        push word ptr [bp+0ch]
        call _FN_CIRCUIT_EGA_08C1D
        add sp, 4
        cmp word ptr [bp-6], 0dh
        je short L_6C3D
        cmp word ptr [bp-6], 1bh
        je short L_6C3D
        cmp word ptr [bp-6], 4800h
        je short L_6C3D
        cmp word ptr [bp-6], 5000h
        je short L_6C3D
        cmp word ptr [bp-6], 9
        je short L_6C3D
        cmp word ptr [bp-6], 4d00h
        jne short L_6C90
        call _FN_CIRCUIT_EGA_06E10
        mov ax, word ptr ds:[9910h]
        cmp word ptr [bp+6], ax
        jg short L_6C89
        jmp L_6D6A
L_6C89:
        inc word ptr ds:[9910h]
        jmp L_6D6A
L_6C90:
        cmp word ptr [bp-6], 4b00h
        jne short L_6CAC
        call _FN_CIRCUIT_EGA_06E10
        cmp word ptr ds:[9910h], 0
        jne short L_6CA4
        jmp L_6D6A
L_6CA4:
        dec word ptr ds:[9910h]
        jmp L_6D6A
        nop
L_6CAC:
        cmp word ptr [bp-6], 4700h
        jne short L_6CC0
        call _FN_CIRCUIT_EGA_06E10
        mov word ptr ds:[9910h], 0
        jmp L_6D6A
        nop
L_6CC0:
        cmp word ptr [bp-6], 4f00h
        jne short L_6CD4
        call _FN_CIRCUIT_EGA_06E10
        mov ax, word ptr [bp+6]
        mov word ptr ds:[9910h], ax
        jmp L_6D6A
        nop
L_6CD4:
        cmp word ptr [bp-6], 5200h
        jne short L_6D00
        call _FN_CIRCUIT_EGA_06E10
        cmp word ptr [bp-2], 0
        jne short L_6CF2
        mov word ptr [bp-2], 1
        mov word ptr ds:[9ba6h], 8
        jmp short L_6D6A
        nop
L_6CF2:
        mov word ptr [bp-2], 0
        mov word ptr ds:[9ba6h], 1
        jmp short L_6D6A
        nop
L_6D00:
        cmp word ptr [bp-6], 5300h
        jne short L_6D3C
        mov ax, word ptr ds:[9910h]
        cmp word ptr [bp+6], ax
        jg short L_6D12
        jmp L_6BE8
L_6D12:
        mov word ptr [bp-4], ax
        jmp short L_6D26
        nop
L_6D18:
        mov si, word ptr [bp-4]
        add si, word ptr [bp+4]
        mov al, byte ptr [si+1]
        mov byte ptr [si], al
        inc word ptr [bp-4]
L_6D26:
        mov ax, word ptr [bp+6]
        dec ax
        cmp ax, word ptr [bp-4]
        jg short L_6D18
        mov si, word ptr [bp+6]
        mov bx, word ptr [bp+4]
        mov byte ptr [bx+si-1], 20h
        jmp short L_6D5D
        nop
L_6D3C:
        cmp word ptr [bp-6], 8
        jne short L_6D70
        cmp word ptr ds:[9910h], 0
        jne short L_6D4C
        jmp L_6BE8
L_6D4C:
        call _FN_CIRCUIT_EGA_06E10
        dec word ptr ds:[9910h]
        mov bx, word ptr [bp+4]
        mov si, word ptr ds:[9910h]
        mov byte ptr [bx+si], 20h
L_6D5D:
        push word ptr [bp+0ah]
        push word ptr [bp+8]
        push bx
        call _FN_CIRCUIT_EGA_0B9D2
        add sp, 6
L_6D6A:
        call _FN_CIRCUIT_EGA_06E10
        jmp L_6BE8
L_6D70:
        cmp word ptr [bp-6], 20h
        jge short L_6D79
        jmp L_6BE8
L_6D79:
        cmp word ptr [bp-6], 7ah
        jle short L_6D82
        jmp L_6BE8
L_6D82:
        mov ax, word ptr ds:[9910h]
        cmp word ptr [bp+6], ax
        jg short L_6D8D
        jmp L_6BE8
L_6D8D:
        call _FN_CIRCUIT_EGA_06E10
        cmp word ptr [bp-2], 0
        je short L_6DB8
        mov ax, word ptr [bp+6]
        sub ax, 2
        mov word ptr [bp-4], ax
        jmp short L_6DB0
        nop
L_6DA2:
        mov si, word ptr [bp-4]
        add si, word ptr [bp+4]
        mov al, byte ptr [si]
        mov byte ptr [si+1], al
        dec word ptr [bp-4]
L_6DB0:
        mov ax, word ptr ds:[9910h]
        cmp word ptr [bp-4], ax
        jge short L_6DA2
L_6DB8:
        mov bx, word ptr [bp+4]
        mov si, word ptr ds:[9910h]
        mov al, byte ptr [bp-6]
        mov byte ptr [bx+si], al
        mov ax, si
        cmp word ptr [bp+6], ax
        jle short L_6D5D
        inc word ptr ds:[9910h]
        jmp short L_6D5D
_grp_aace91da ENDP
_TEXT ENDS
END
