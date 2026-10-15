_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_06A1E:NEAR
        EXTRN _FN_CIRCUIT_CGA_06A72:NEAR
        EXTRN _FN_CIRCUIT_CGA_08396:NEAR
        EXTRN _FN_CIRCUIT_CGA_097F0:NEAR
        EXTRN _FN_CIRCUIT_CGA_0AABD:NEAR
        EXTRN _FN_CIRCUIT_CGA_0B418:NEAR
        EXTRN _GRP_7DE44506:NEAR
        EXTRN _GRP_9D44A3BF:NEAR
        EXTRN _GRP_E76F1CA2:NEAR
        EXTRN _GRP_F3A4E254:NEAR
        PUBLIC _grp_f8ffa5a4
_grp_f8ffa5a4 PROC NEAR
        push bp
        mov bp, sp
        sub sp, 0eh
        push word ptr ds:[9c00h]
        push word ptr ds:[9bfeh]
        call _FN_CIRCUIT_CGA_0B418
        add sp, 4
        sub ax, ax
        push ax
        call _GRP_E76F1CA2
        add sp, 2
        mov ax, 8e24h
        push ax
        push word ptr ds:[58h]
        push word ptr ds:[56h]
        call _GRP_F3A4E254
        add sp, 6
        push dx
        push ax
        call _GRP_9D44A3BF
        add sp, 4
        mov ax, 8e2ah
        push ax
        push word ptr ds:[58h]
        push word ptr ds:[56h]
        call _GRP_F3A4E254
        add sp, 6
        push dx
        push ax
        call _GRP_9D44A3BF
        add sp, 4
        mov ax, 8e30h
        push ax
        push word ptr ds:[58h]
        push word ptr ds:[56h]
        call _GRP_F3A4E254
        add sp, 6
        push dx
        push ax
        call _GRP_9D44A3BF
        add sp, 4
        push word ptr ds:[9ae4h]
        push word ptr ds:[9ae2h]
        call _FN_CIRCUIT_CGA_0B418
        add sp, 4
        sub ax, ax
        push ax
        call _GRP_E76F1CA2
        add sp, 2
        mov word ptr [bp-6], 0
        jmp short L_081D
        nop
L_081A:
        inc word ptr [bp-6]
L_081D:
        cmp word ptr [bp-6], 4
        jge short L_0854
        mov ax, 1
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_CGA_06A72
        add sp, 4
        push word ptr [bp-6]
        les bx, dword ptr ds:[9bfeh]
        push word ptr es:[bx+2]
        push word ptr es:[bx]
        call _GRP_7DE44506
        add sp, 6
        call _FN_CIRCUIT_CGA_06A1E
        mov word ptr [bp-2], ax
        or ax, ax
        je short L_081A
L_084D:
        mov ax, word ptr [bp-2]
        mov sp, bp
        pop bp
        ret
L_0854:
        mov ax, 8e36h
        push ax
        push word ptr ds:[58h]
        push word ptr ds:[56h]
        call _GRP_F3A4E254
        add sp, 6
        mov word ptr [bp-0eh], ax
        mov word ptr [bp-0ch], dx
        les bx, dword ptr [bp-0eh]
        mov ax, word ptr es:[bx+0ah]
        mov word ptr [bp-8], ax
        mov ax, word ptr es:[bx+8]
        add ax, 3
        mov word ptr [bp-0ah], ax
        mov word ptr [bp-4], 0
        jmp short L_088C
        nop
L_0888:
        add word ptr [bp-4], 2
L_088C:
        mov ax, word ptr [bp-0ah]
        cmp word ptr [bp-4], ax
        jge short L_08BE
        mov ax, 1
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_CGA_0AABD
        add sp, 4
        push word ptr [bp-8]
        push word ptr [bp-4]
        push word ptr [bp-0ch]
        push word ptr [bp-0eh]
        call _FN_CIRCUIT_CGA_097F0
        add sp, 8
        call _FN_CIRCUIT_CGA_08396
        mov word ptr [bp-2], ax
        or ax, ax
        je short L_0888
        jmp short L_084D
L_08BE:
        mov ax, 2dh
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_CGA_06A72
        add sp, 4
        call _FN_CIRCUIT_CGA_06A1E
        mov sp, bp
        pop bp
        ret
_grp_f8ffa5a4 ENDP
_TEXT ENDS
END
