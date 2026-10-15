_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_0681E:NEAR
        EXTRN _FN_CIRCUIT_EGA_06872:NEAR
        EXTRN _FN_CIRCUIT_EGA_078EA:NEAR
        EXTRN _FN_CIRCUIT_EGA_08BF2:NEAR
        EXTRN _FN_CIRCUIT_EGA_08CD8:NEAR
        EXTRN _FN_CIRCUIT_EGA_09394:NEAR
        EXTRN _FN_CIRCUIT_EGA_09C18:NEAR
        EXTRN _FN_CIRCUIT_EGA_0B1B6:NEAR
        EXTRN _FN_CIRCUIT_EGA_0BB7A:NEAR
        EXTRN _GRP_B9359687:NEAR
        EXTRN _GRP_F3A4E254:NEAR
        PUBLIC _grp_1f3dd2b2
_grp_1f3dd2b2 PROC NEAR
        push bp
        mov bp, sp
        sub sp, 1eh
        push word ptr ds:[9c30h]
        push word ptr ds:[9c2eh]
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        sub ax, ax
        push ax
        call _FN_CIRCUIT_EGA_09394
        add sp, 2
        push word ptr ds:[9b14h]
        push word ptr ds:[9b12h]
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        mov word ptr [bp-16h], 0
L_0908:
        push word ptr [bp-16h]
        les bx, dword ptr ds:[9c2eh]
        push word ptr es:[bx+2]
        push word ptr es:[bx]
        call _FN_CIRCUIT_EGA_09C18
        add sp, 6
        inc word ptr [bp-16h]
        cmp word ptr [bp-16h], 4
        jl short L_0908
        push word ptr ds:[9c30h]
        push word ptr ds:[9c2eh]
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        mov ax, 8e64h
        push ax
        push word ptr ds:[50h]
        push word ptr ds:[4eh]
        call _GRP_F3A4E254
        add sp, 6
        mov word ptr [bp-0eh], ax
        mov word ptr [bp-0ch], dx
        mov ax, 8e6ah
        push ax
        push word ptr ds:[50h]
        push word ptr ds:[4eh]
        call _GRP_F3A4E254
        add sp, 6
        mov word ptr [bp-8], ax
        mov word ptr [bp-6], dx
        mov ax, 8e70h
        push ax
        push word ptr ds:[50h]
        push word ptr ds:[4eh]
        call _GRP_F3A4E254
        add sp, 6
        mov word ptr [bp-12h], ax
        mov word ptr [bp-10h], dx
        push word ptr ds:[9b14h]
        push word ptr ds:[9b12h]
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        les bx, dword ptr [bp-0eh]
        mov ax, word ptr es:[bx+8]
        add ax, word ptr es:[bx+4]
        mov word ptr [bp-1ch], ax
        mov ax, word ptr es:[bx+0ah]
        add ax, word ptr es:[bx+6]
        mov word ptr [bp-1eh], ax
        mov word ptr [bp-1ah], 6
        call _FN_CIRCUIT_EGA_08BF2
        mov word ptr [bp-4], ax
        mov word ptr [bp-2], dx
        mov word ptr [bp-18h], 0
        mov ax, word ptr [bp-1ch]
        add ax, word ptr [bp-1eh]
        mov word ptr [bp-14h], ax
L_09BE:
        mov ax, word ptr [bp-1ah]
        add word ptr [bp-18h], ax
        sub word ptr [bp-14h], ax
        mov ax, word ptr [bp-1eh]
        cmp word ptr [bp-18h], ax
        jl short L_09D8
        mov word ptr [bp-18h], ax
        mov ax, word ptr [bp-1ch]
        mov word ptr [bp-14h], ax
L_09D8:
        push word ptr ds:[9c30h]
        push word ptr ds:[9c2eh]
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        sub ax, ax
        push ax
        call _FN_CIRCUIT_EGA_09394
        add sp, 2
        push word ptr [bp-18h]
        push word ptr [bp-1ch]
        push word ptr [bp-0ch]
        push word ptr [bp-0eh]
        call _FN_CIRCUIT_EGA_0BB7A
        add sp, 8
        push word ptr [bp-18h]
        push word ptr [bp-14h]
        push word ptr [bp-10h]
        push word ptr [bp-12h]
        call _FN_CIRCUIT_EGA_0BB7A
        add sp, 8
        push word ptr [bp-1eh]
        push word ptr [bp-14h]
        push word ptr [bp-6]
        push word ptr [bp-8]
        call _FN_CIRCUIT_EGA_0BB7A
        add sp, 8
        push word ptr ds:[9b14h]
        push word ptr ds:[9b12h]
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        les bx, dword ptr ds:[9c2eh]
        push word ptr es:[bx+2]
        push word ptr es:[bx]
        call _FN_CIRCUIT_EGA_0B1B6
        add sp, 4
        call _FN_CIRCUIT_EGA_08BF2
        sub ax, word ptr [bp-4]
        mov word ptr [bp-1ah], ax
        call _FN_CIRCUIT_EGA_08BF2
        mov word ptr [bp-4], ax
        mov word ptr [bp-2], dx
        call _FN_CIRCUIT_EGA_078EA
        mov word ptr [bp-0ah], ax
        or ax, ax
        je short L_0A68
L_0A60:
        mov ax, word ptr [bp-0ah]
        mov sp, bp
        pop bp
        ret
        nop
L_0A68:
        mov ax, word ptr [bp-1eh]
        cmp word ptr [bp-18h], ax
        jge short L_0A73
        jmp L_09BE
L_0A73:
        mov ax, 8e76h
        push ax
        push word ptr ds:[50h]
        push word ptr ds:[4eh]
        call _GRP_F3A4E254
        add sp, 6
        push dx
        push ax
        call _FN_CIRCUIT_EGA_0B1B6
        add sp, 4
        mov ax, 0eh
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_EGA_06872
        add sp, 4
        call _FN_CIRCUIT_EGA_0681E
        mov word ptr [bp-0ah], ax
        or ax, ax
        jne short L_0A60
        call _GRP_B9359687
        mov ax, 5ah
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_EGA_06872
        add sp, 4
        call _FN_CIRCUIT_EGA_0681E
        mov sp, bp
        pop bp
        ret
        nop
_grp_1f3dd2b2 ENDP
_TEXT ENDS
END
