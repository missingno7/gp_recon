_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_015B0:NEAR
        EXTRN _FN_CIRCUIT_EGA_0369E:NEAR
        EXTRN _FN_CIRCUIT_EGA_038C6:NEAR
        EXTRN _FN_CIRCUIT_EGA_03952:NEAR
        EXTRN _FN_CIRCUIT_EGA_078DB:NEAR
        EXTRN _FN_CIRCUIT_EGA_08C84:NEAR
        EXTRN _FN_CIRCUIT_EGA_08CD8:NEAR
        EXTRN _FN_CIRCUIT_EGA_09394:NEAR
        EXTRN _FN_CIRCUIT_EGA_0B1B6:NEAR
        EXTRN _GRP_312E39EB:NEAR
        EXTRN _GRP_622C4ED2:NEAR
        EXTRN _GRP_6C437B35:NEAR
        EXTRN _GRP_B9245F92:NEAR
        EXTRN _GRP_C0C9D9CD:NEAR
        EXTRN _GRP_DDEFCAE4:NEAR
        PUBLIC _grp_9e3efdaa
_grp_9e3efdaa PROC NEAR
        push bp
        mov bp, sp
        sub sp, 4
        mov ax, word ptr [bp+8]
        mov word ptr ds:[990eh], ax
        sub ax, ax
        push ax
        call _FN_CIRCUIT_EGA_09394
        add sp, 2
        mov word ptr [bp-4], 92fah
        cmp word ptr ds:[4ah], 0
        je short L_3374
        mov ax, 92fah
        push ax
        call _GRP_B9245F92
        add sp, 2
        call _GRP_C0C9D9CD
        mov ax, 3fh
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_EGA_015B0
        jmp L_3470
L_3374:
        push word ptr [bp-4]
        call _GRP_B9245F92
        add sp, 2
        cmp word ptr ds:[990eh], 3
        je short L_3397
        mov ax, word ptr ds:[9ba2h]
        mov dx, word ptr ds:[9ba4h]
        cmp word ptr [bp+6], dx
        jb short L_33BA
        ja short L_3397
        cmp word ptr [bp+4], ax
        jb short L_33BA
L_3397:
        cmp word ptr ds:[990eh], 3
        je short L_33A1
        jmp L_3452
L_33A1:
        mov ax, word ptr ds:[9ba2h]
        mov dx, word ptr ds:[9ba4h]
        cmp word ptr [bp+6], dx
        jae short L_33B0
        jmp L_3452
L_33B0:
        ja short L_33BA
        cmp word ptr [bp+4], ax
        ja short L_33BA
        jmp L_3452
L_33BA:
        cmp byte ptr ds:[164h], 0
        je short L_33C8
        cmp byte ptr ds:[164h], 20h
        jne short L_343B
L_33C8:
        call _FN_CIRCUIT_EGA_038C6
        push word ptr ds:[9b14h]
        push word ptr ds:[9b12h]
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        les bx, dword ptr ds:[9c2eh]
        push word ptr es:[bx+2]
        push word ptr es:[bx]
        call _FN_CIRCUIT_EGA_0B1B6
        add sp, 4
        call _FN_CIRCUIT_EGA_078DB
        mov ax, 0fh
        push ax
        sub ax, ax
        push ax
        call _FN_CIRCUIT_EGA_08C84
        add sp, 4
        mov ax, 5ah
        push ax
        mov ax, 9302h
        push ax
        call _GRP_622C4ED2
        add sp, 4
        mov ax, 0ch
        push ax
        mov ax, 71h
        push ax
        mov ax, 0d0h
        push ax
        mov ax, 66h
        push ax
        push ax
        call _GRP_312E39EB
        add sp, 0ah
        mov ax, 7530h
        cwd
        push dx
        push ax
        mov ax, 69h
        push ax
        mov ax, 68h
        push ax
        mov ax, 0bh
        push ax
        mov ax, 164h
        push ax
        call _FN_CIRCUIT_EGA_03952
        add sp, 0ch
L_343B:
        push word ptr [bp+6]
        push word ptr [bp+4]
        call _GRP_DDEFCAE4
        add sp, 4
        push word ptr [bp-4]
        call _FN_CIRCUIT_EGA_0369E
        add sp, 2
        jmp short L_345E
L_3452:
        cmp word ptr [bp+0ah], 0
        jne short L_345E
        sub ax, ax
        mov sp, bp
        pop bp
        ret
L_345E:
        call _FN_CIRCUIT_EGA_078DB
        call _GRP_C0C9D9CD
        mov word ptr [bp-2], ax
        mov ax, 2328h
        cwd
        push dx
        push ax
        call _GRP_6C437B35
L_3470:
        add sp, 4
        mov ax, word ptr [bp-2]
        mov sp, bp
        pop bp
        ret
_grp_9e3efdaa ENDP
_TEXT ENDS
END
