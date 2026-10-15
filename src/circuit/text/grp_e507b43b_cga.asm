_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_05989:NEAR
        EXTRN _FN_CIRCUIT_CGA_0599C:NEAR
        EXTRN _FN_CIRCUIT_CGA_0834C:NEAR
        EXTRN _FN_CIRCUIT_CGA_08396:NEAR
        EXTRN _FN_CIRCUIT_CGA_09B70:NEAR
        EXTRN _FN_CIRCUIT_CGA_0AA92:NEAR
        EXTRN _FN_CIRCUIT_CGA_0AABD:NEAR
        EXTRN _FN_CIRCUIT_CGA_0AB24:NEAR
        EXTRN _FN_CIRCUIT_CGA_0B418:NEAR
        EXTRN _FN_CIRCUIT_CGA_0B696:NEAR
        EXTRN _GRP_1490DEE1:NEAR
        EXTRN _GRP_64BAADA8:NEAR
        EXTRN _GRP_7DE44506:NEAR
        EXTRN _GRP_9D44A3BF:NEAR
        EXTRN _GRP_B465AB5E:NEAR
        EXTRN _GRP_C5EFAE67:NEAR
        EXTRN _GRP_E76F1CA2:NEAR
        EXTRN _GRP_F3A4E254:NEAR
        PUBLIC _grp_e507b43b
_grp_e507b43b PROC NEAR
        push bp
        mov bp, sp
        sub sp, 10h
        sub ax, ax
        push ax
        mov ax, 3
        push ax
        call _FN_CIRCUIT_CGA_0AB24
        add sp, 4
        push word ptr ds:[9c00h]
        push word ptr ds:[9bfeh]
        call _FN_CIRCUIT_CGA_0B418
        add sp, 4
        sub ax, ax
        push ax
        call _GRP_E76F1CA2
        add sp, 2
        mov ax, 93d0h
        push ax
        push word ptr ds:[9c92h]
        push word ptr ds:[9c90h]
        call _GRP_F3A4E254
        add sp, 6
        push dx
        push ax
        call _GRP_9D44A3BF
        add sp, 4
        mov ax, word ptr ds:[0eeh]
        mov cx, ax
        shl ax, 1
        shl ax, 1
        add ax, cx
        add ax, 340h
        push ax
        push word ptr ds:[9c92h]
        push word ptr ds:[9c90h]
        call _GRP_F3A4E254
        add sp, 6
        push dx
        push ax
        call _GRP_B465AB5E
        add sp, 4
        push word ptr ds:[9ae4h]
        push word ptr ds:[9ae2h]
        call _FN_CIRCUIT_CGA_0B418
        add sp, 4
        mov word ptr [bp-0ch], 0
        jmp short L_3B45
L_3B42:
        inc word ptr [bp-0ch]
L_3B45:
        cmp word ptr [bp-0ch], 4
        jge short L_3B7A
        mov ax, 1
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_CGA_0AABD
        add sp, 4
        push word ptr [bp-0ch]
        les bx, dword ptr ds:[9bfeh]
        push word ptr es:[bx+2]
        push word ptr es:[bx]
        call _GRP_7DE44506
        add sp, 6
        call _FN_CIRCUIT_CGA_08396
        mov word ptr [bp-4], ax
        cmp ax, 18h
        jne short L_3B42
        mov sp, bp
        pop bp
        ret
L_3B7A:
        mov ax, 93d6h
        push ax
        push word ptr ds:[9c92h]
        push word ptr ds:[9c90h]
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
        call _FN_CIRCUIT_CGA_0B696
        add sp, 8
        call _FN_CIRCUIT_CGA_0AA92
        mov word ptr [bp-10h], ax
        mov word ptr [bp-0eh], dx
        jmp L_3C6D
        nop
L_3BB6:
        cmp word ptr [bp-0ah], 4800h
        je short L_3BC4
        cmp word ptr [bp-0ah], 5000h
        jne short L_3C2E
L_3BC4:
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
        call _FN_CIRCUIT_CGA_0B696
        add sp, 8
        cmp word ptr [bp-0ah], 5000h
        jne short L_3BF2
        inc word ptr [bp-2]
        jmp short L_3BF5
        nop
L_3BF2:
        dec word ptr [bp-2]
L_3BF5:
        cmp word ptr [bp-2], 2
        jle short L_3C02
        mov word ptr [bp-2], 0
        jmp short L_3C0D
L_3C02:
        cmp word ptr [bp-2], 0
        jge short L_3C0D
        mov word ptr [bp-2], 2
L_3C0D:
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
        call _FN_CIRCUIT_CGA_0B696
        add sp, 8
L_3C2E:
        cmp word ptr [bp-0ah], 1bh
        je short L_3C3A
        cmp word ptr [bp-0ah], 18h
        jne short L_3C42
L_3C3A:
        mov ax, word ptr [bp-0ah]
        mov sp, bp
        pop bp
        ret
        nop
L_3C42:
        mov ax, 18h
        push ax
        mov ax, 0e8h
        push ax
        mov ax, 0ah
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_CGA_0AA92
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
        call _FN_CIRCUIT_CGA_09B70
        add sp, 6
L_3C6D:
        call _FN_CIRCUIT_CGA_0834C
        mov word ptr [bp-0ah], ax
        cmp ax, 0dh
        je short L_3C7B
        jmp L_3BB6
L_3C7B:
        cmp word ptr [bp-2], 2
        je short L_3C90
        mov ax, word ptr ds:[33ch]
        sub ax, word ptr ds:[9ba4h]
        shr ax, 1
        add word ptr ds:[9ba4h], ax
        jmp short L_3C93
L_3C90:
        call _FN_CIRCUIT_CGA_0599C
L_3C93:
        call _FN_CIRCUIT_CGA_05989
        push word ptr [bp-2]
        push word ptr [bp-0eh]
        push word ptr [bp-10h]
        call _GRP_1490DEE1
        add sp, 6
        mov ax, 1
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_CGA_0AABD
        add sp, 4
        call _FN_CIRCUIT_CGA_08396
        mov sp, bp
        pop bp
        ret
_grp_e507b43b ENDP
_TEXT ENDS
END
