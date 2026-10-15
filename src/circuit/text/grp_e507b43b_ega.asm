_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_05AD3:NEAR
        EXTRN _FN_CIRCUIT_EGA_05AE6:NEAR
        EXTRN _FN_CIRCUIT_EGA_078A0:NEAR
        EXTRN _FN_CIRCUIT_EGA_078EA:NEAR
        EXTRN _FN_CIRCUIT_EGA_08BF2:NEAR
        EXTRN _FN_CIRCUIT_EGA_08C1D:NEAR
        EXTRN _FN_CIRCUIT_EGA_08C84:NEAR
        EXTRN _FN_CIRCUIT_EGA_08CD8:NEAR
        EXTRN _FN_CIRCUIT_EGA_09394:NEAR
        EXTRN _FN_CIRCUIT_EGA_09C18:NEAR
        EXTRN _FN_CIRCUIT_EGA_0B1B6:NEAR
        EXTRN _FN_CIRCUIT_EGA_0B9D2:NEAR
        EXTRN _FN_CIRCUIT_EGA_0D908:NEAR
        EXTRN _FN_CIRCUIT_EGA_0D922:NEAR
        EXTRN _GRP_1490DEE1:NEAR
        EXTRN _GRP_64BAADA8:NEAR
        EXTRN _GRP_C5EFAE67:NEAR
        EXTRN _GRP_F3A4E254:NEAR
        PUBLIC _grp_e507b43b
_grp_e507b43b PROC NEAR
        push bp
        mov bp, sp
        sub sp, 10h
        sub ax, ax
        push ax
        mov ax, 0fh
        push ax
        call _FN_CIRCUIT_EGA_08C84
        add sp, 4
        push word ptr ds:[9c30h]
        push word ptr ds:[9c2eh]
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        sub ax, ax
        push ax
        call _FN_CIRCUIT_EGA_09394
        add sp, 2
        mov ax, 93f8h
        push ax
        push word ptr ds:[9cc2h]
        push word ptr ds:[9cc0h]
        call _GRP_F3A4E254
        add sp, 6
        push dx
        push ax
        call _FN_CIRCUIT_EGA_0B1B6
        add sp, 4
        mov ax, word ptr ds:[0eeh]
        mov cx, ax
        shl ax, 1
        shl ax, 1
        add ax, cx
        add ax, 340h
        push ax
        push word ptr ds:[9cc2h]
        push word ptr ds:[9cc0h]
        call _GRP_F3A4E254
        add sp, 6
        push dx
        push ax
        call _FN_CIRCUIT_EGA_0D922
        add sp, 4
        push word ptr ds:[9b14h]
        push word ptr ds:[9b12h]
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        mov word ptr [bp-0ch], 0
        jmp short L_3B3B
L_3B38:
        inc word ptr [bp-0ch]
L_3B3B:
        cmp word ptr [bp-0ch], 4
        jge short L_3B70
        mov ax, 1
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_EGA_08C1D
        add sp, 4
        push word ptr [bp-0ch]
        les bx, dword ptr ds:[9c2eh]
        push word ptr es:[bx+2]
        push word ptr es:[bx]
        call _FN_CIRCUIT_EGA_09C18
        add sp, 6
        call _FN_CIRCUIT_EGA_078EA
        mov word ptr [bp-4], ax
        cmp ax, 18h
        jne short L_3B38
        mov sp, bp
        pop bp
        ret
L_3B70:
        mov ax, 93feh
        push ax
        push word ptr ds:[9cc2h]
        push word ptr ds:[9cc0h]
        call _GRP_F3A4E254
        add sp, 6
        mov word ptr [bp-8], ax
        mov word ptr [bp-6], dx
        mov word ptr [bp-2], 0
        mov ax, 9dh
        push ax
        mov ax, 68h
        push ax
        push dx
        push word ptr [bp-8]
        call _FN_CIRCUIT_EGA_0D908
        add sp, 8
        call _FN_CIRCUIT_EGA_08BF2
        mov word ptr [bp-10h], ax
        mov word ptr [bp-0eh], dx
        jmp L_3C63
        nop
L_3BAC:
        cmp word ptr [bp-0ah], 4800h
        je short L_3BBA
        cmp word ptr [bp-0ah], 5000h
        jne short L_3C24
L_3BBA:
        mov ax, word ptr [bp-2]
        mov cx, ax
        shl ax, 1
        add ax, cx
        shl ax, 1
        shl ax, 1
        add ax, 9dh
        push ax
        mov ax, 68h
        push ax
        push word ptr [bp-6]
        push word ptr [bp-8]
        call _FN_CIRCUIT_EGA_0D908
        add sp, 8
        cmp word ptr [bp-0ah], 5000h
        jne short L_3BE8
        inc word ptr [bp-2]
        jmp short L_3BEB
        nop
L_3BE8:
        dec word ptr [bp-2]
L_3BEB:
        cmp word ptr [bp-2], 2
        jle short L_3BF8
        mov word ptr [bp-2], 0
        jmp short L_3C03
L_3BF8:
        cmp word ptr [bp-2], 0
        jge short L_3C03
        mov word ptr [bp-2], 2
L_3C03:
        mov ax, word ptr [bp-2]
        mov cx, ax
        shl ax, 1
        add ax, cx
        shl ax, 1
        shl ax, 1
        add ax, 9dh
        push ax
        mov ax, 68h
        push ax
        push word ptr [bp-6]
        push word ptr [bp-8]
        call _FN_CIRCUIT_EGA_0D908
        add sp, 8
L_3C24:
        cmp word ptr [bp-0ah], 1bh
        je short L_3C30
        cmp word ptr [bp-0ah], 18h
        jne short L_3C38
L_3C30:
        mov ax, word ptr [bp-0ah]
        mov sp, bp
        pop bp
        ret
        nop
L_3C38:
        mov ax, 18h
        push ax
        mov ax, 0e8h
        push ax
        mov ax, 0ah
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_EGA_08BF2
        sub ax, word ptr [bp-10h]
        sbb dx, word ptr [bp-0eh]
        push dx
        push ax
        call _GRP_C5EFAE67
        push dx
        push ax
        call _GRP_64BAADA8
        add sp, 4
        push ax
        call _FN_CIRCUIT_EGA_0B9D2
        add sp, 6
L_3C63:
        call _FN_CIRCUIT_EGA_078A0
        mov word ptr [bp-0ah], ax
        cmp ax, 0dh
        je short L_3C71
        jmp L_3BAC
L_3C71:
        cmp word ptr [bp-2], 2
        je short L_3C86
        mov ax, word ptr ds:[33ch]
        sub ax, word ptr ds:[9bd4h]
        shr ax, 1
        add word ptr ds:[9bd4h], ax
        jmp short L_3C89
L_3C86:
        call _FN_CIRCUIT_EGA_05AE6
L_3C89:
        call _FN_CIRCUIT_EGA_05AD3
        push word ptr [bp-2]
        push word ptr [bp-0eh]
        push word ptr [bp-10h]
        call _GRP_1490DEE1
        add sp, 6
        mov ax, 1
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_EGA_08C1D
        add sp, 4
        call _FN_CIRCUIT_EGA_078EA
        mov sp, bp
        pop bp
        ret
_grp_e507b43b ENDP
_TEXT ENDS
END
