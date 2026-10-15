_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_015AE:NEAR
        EXTRN _FN_CIRCUIT_CGA_0369E:NEAR
        EXTRN _FN_CIRCUIT_CGA_038C8:NEAR
        EXTRN _FN_CIRCUIT_CGA_03956:NEAR
        EXTRN _FN_CIRCUIT_CGA_08387:NEAR
        EXTRN _FN_CIRCUIT_CGA_0AB24:NEAR
        EXTRN _FN_CIRCUIT_CGA_0B418:NEAR
        EXTRN _GRP_312E39EB:NEAR
        EXTRN _GRP_622C4ED2:NEAR
        EXTRN _GRP_6C437B35:NEAR
        EXTRN _GRP_9D44A3BF:NEAR
        EXTRN _GRP_B9245F92:NEAR
        EXTRN _GRP_C0C9D9CD:NEAR
        EXTRN _GRP_DDEFCAE4:NEAR
        EXTRN _GRP_E76F1CA2:NEAR
        PUBLIC _grp_9e3efdaa
_grp_9e3efdaa PROC NEAR
        push bp
        mov bp, sp
        sub sp, 4
        mov ax, word ptr [bp+8]
        mov word ptr ds:[98deh], ax
        sub ax, ax
        push ax
        call _GRP_E76F1CA2
        add sp, 2
        mov word ptr [bp-4], 92d2h
        cmp word ptr ds:[4ah], 0
        je short L_3374
        mov ax, 92d2h
        push ax
        call _GRP_B9245F92
        add sp, 2
        call _GRP_C0C9D9CD
        mov ax, 3fh
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_CGA_015AE
        jmp L_3470
L_3374:
        push word ptr [bp-4]
        call _GRP_B9245F92
        add sp, 2
        cmp word ptr ds:[98deh], 3
        je short L_3397
        mov ax, word ptr ds:[9b72h]
        mov dx, word ptr ds:[9b74h]
        cmp word ptr [bp+6], dx
        jb short L_33BA
        ja short L_3397
        cmp word ptr [bp+4], ax
        jb short L_33BA
L_3397:
        cmp word ptr ds:[98deh], 3
        je short L_33A1
        jmp L_3452
L_33A1:
        mov ax, word ptr ds:[9b72h]
        mov dx, word ptr ds:[9b74h]
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
        call _FN_CIRCUIT_CGA_038C8
        push word ptr ds:[9ae4h]
        push word ptr ds:[9ae2h]
        call _FN_CIRCUIT_CGA_0B418
        add sp, 4
        les bx, dword ptr ds:[9bfeh]
        push word ptr es:[bx+2]
        push word ptr es:[bx]
        call _GRP_9D44A3BF
        add sp, 4
        call _FN_CIRCUIT_CGA_08387
        mov ax, 3
        push ax
        sub ax, ax
        push ax
        call _FN_CIRCUIT_CGA_0AB24
        add sp, 4
        mov ax, 5ah
        push ax
        mov ax, 92dah
        push ax
        call _GRP_622C4ED2
        add sp, 4
        mov ax, 0aaaah
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
        call _FN_CIRCUIT_CGA_03956
        add sp, 0ch
L_343B:
        push word ptr [bp+6]
        push word ptr [bp+4]
        call _GRP_DDEFCAE4
        add sp, 4
        push word ptr [bp-4]
        call _FN_CIRCUIT_CGA_0369E
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
        call _FN_CIRCUIT_CGA_08387
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
