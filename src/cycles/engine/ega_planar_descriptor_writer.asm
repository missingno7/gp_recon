        .286
EGA_PLANAR_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:EGA_PLANAR_TEXT
        EXTRN _grp_7d3b9038:FAR, _fatal_error:FAR
        ORG 050CCh
        PUBLIC _fn_cycles_ega_0a76c
_fn_cycles_ega_0a76c PROC FAR
        push bp
        mov bp, sp
        push ds
        push si
        push di
        sub sp, 0Ch
        mov ax, word ptr [bp + 6]
        shr ax, 1
        shr ax, 1
        shr ax, 1
        mov word ptr [bp - 12h], ax
        mov bx, word ptr [bp + 8]
        mul bx
        mov bx, ax
        and bx, 0Fh
        neg bx
        and bx, 0Fh
        mov word ptr [bp - 10h], bx
        add ax, bx
        mov word ptr [bp - 0Ch], ax
        xor dx, dx
        mov cx, 4
        mov bx, word ptr [bp + 0Ah]
        xor bh, bh
L_EGA_A7A2:
        shr bl, 1
        jae SHORT L_EGA_A7AB
        add dx, ax
        adc bh, 0
L_EGA_A7AB:
        loop L_EGA_A7A2
        add dx, 10h
        adc bh, 0
        shr bh, 1
        rcr dx, 1
        shr bh, 1
        rcr dx, 1
        shr bh, 1
        rcr dx, 1
        shr bh, 1
        rcr dx, 1
        inc dx
        mov word ptr [bp - 0Eh], dx
        push dx
        mov ax, 99D2h
        push ax
        call FAR PTR _grp_7d3b9038
        add sp, 4
        mov word ptr [bp - 8], dx
        mov ds, dx
        xor bx, bx
        mov ax, word ptr [bp - 12h]
        mov word ptr [bx], ax
        mov ax, word ptr [bp + 8]
        mov word ptr [bx + 2], ax
        xor ax, ax
        mov word ptr [bx + 4], ax
        mov word ptr [bx + 6], ax
        mov word ptr [bx + 8], ax
        mov word ptr [bx + 0Ah], ax
        mov cx, 4
        lea di, [bx + 0Ch]
        xor ax, ax
        mov es, word ptr [bp - 8]
        rep stosb
        lea di, [bx + 0Ch]
        mov cx, 4
        mov dx, 1
L_EGA_A80A:
        mov ax, word ptr [bp + 0Ah]
        and ax, dx
        je SHORT L_EGA_A812
        stosb
L_EGA_A812:
        shl dx, 1
        loop L_EGA_A80A
        mov ax, word ptr [bp - 10h]
        shl ax, 1
        shl ax, 1
        shl ax, 1
        shl ax, 1
        or byte ptr [bx + 0Fh], al
        mov ax, 0Dh
        add ax, word ptr [bp + 8]
        shl ax, 1
        mov bx, word ptr cs:[5237h]
        mov word ptr [bp - 0Ah], bx
        add ax, bx
        cmp ax, 5A09h
        jb SHORT L_EGA_A83E
        jmp L_EGA_A8CB
L_EGA_A83E:
        mov word ptr cs:[5237h], ax
        mov word ptr cs:[bx], 0
        mov dx, word ptr [bp + 0Ah]
        mov cx, 4
        mov ax, word ptr [bp - 8]
        mov si, word ptr [bp - 0Ch]
        shr si, 1
        shr si, 1
        shr si, 1
        shr si, 1
L_EGA_A85B:
        mov word ptr cs:[bx + 2], 0
        test dl, 1
        je SHORT L_EGA_A86C
        mov word ptr cs:[bx + 2], ax
        add ax, si
L_EGA_A86C:
        add bx, 2
        shr dx, 1
        loop L_EGA_A85B
        mov bx, word ptr [bp - 0Ah]
        lea ax, [bx + 1Ah]
        mov word ptr cs:[bx + 0Ah], ax
        mov word ptr cs:[bx + 0Ch], 0
        mov ax, word ptr [bp + 6]
        mov word ptr cs:[bx + 18h], ax
        shr ax, 1
        shr ax, 1
        shr ax, 1
        mov word ptr cs:[bx + 0Eh], ax
        mov word ptr cs:[bx + 14h], ax
        mov word ptr cs:[bx + 10h], 0
        mov ax, word ptr [bp + 8]
        mov word ptr cs:[bx + 12h], ax
        mov ax, word ptr [bp - 10h]
        mov word ptr cs:[bx + 16h], ax
        mov cx, word ptr [bp + 8]
        mov ax, 10h
L_EGA_A8B2:
        mov word ptr cs:[bx + 1Ah], ax
        add bx, 2
        add ax, word ptr [bp - 12h]
        loop L_EGA_A8B2
        mov dx, cs
        mov ax, word ptr [bp - 0Ah]
        add sp, 0Ch
        pop di
        pop si
        pop ds
        pop bp
        retf
L_EGA_A8CB:
        mov ds, word ptr [bp - 2]
        mov ax, 99D9h
        push ax
        call FAR PTR _fatal_error
_fn_cycles_ega_0a76c ENDP
EGA_PLANAR_TEXT ENDS
        END
