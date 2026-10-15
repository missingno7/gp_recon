_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_0681E:NEAR
        EXTRN _FN_CIRCUIT_EGA_06872:NEAR
        EXTRN _FN_CIRCUIT_EGA_078EA:NEAR
        EXTRN _FN_CIRCUIT_EGA_08C1D:NEAR
        EXTRN _FN_CIRCUIT_EGA_08CD8:NEAR
        EXTRN _FN_CIRCUIT_EGA_09394:NEAR
        EXTRN _FN_CIRCUIT_EGA_09C18:NEAR
        EXTRN _FN_CIRCUIT_EGA_0A6AA:NEAR
        EXTRN _FN_CIRCUIT_EGA_0B1B6:NEAR
        EXTRN _GRP_F3A4E254:NEAR
        PUBLIC _grp_f8ffa5a4
_grp_f8ffa5a4 PROC NEAR
        push bp
        mov bp, sp
        sub sp, 0eh
        push word ptr ds:[9c30h]
        push word ptr ds:[9c2eh]
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        sub ax, ax
        push ax
        call _FN_CIRCUIT_EGA_09394
        add sp, 2
        mov ax, 8e4ch
        push ax
        push word ptr ds:[58h]
        push word ptr ds:[56h]
        call _GRP_F3A4E254
        add sp, 6
        push dx
        push ax
        call _FN_CIRCUIT_EGA_0B1B6
        add sp, 4
        mov ax, 8e52h
        push ax
        push word ptr ds:[58h]
        push word ptr ds:[56h]
        call _GRP_F3A4E254
        add sp, 6
        push dx
        push ax
        call _FN_CIRCUIT_EGA_0B1B6
        add sp, 4
        mov ax, 8e58h
        push ax
        push word ptr ds:[58h]
        push word ptr ds:[56h]
        call _GRP_F3A4E254
        add sp, 6
        push dx
        push ax
        call _FN_CIRCUIT_EGA_0B1B6
        add sp, 4
        push word ptr ds:[9b14h]
        push word ptr ds:[9b12h]
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        sub ax, ax
        push ax
        call _FN_CIRCUIT_EGA_09394
        add sp, 2
        mov word ptr [bp-6], 0
        jmp short L_0823
        nop
L_0820:
        inc word ptr [bp-6]
L_0823:
        cmp word ptr [bp-6], 4
        jge short L_085A
        mov ax, 1
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_EGA_06872
        add sp, 4
        push word ptr [bp-6]
        les bx, dword ptr ds:[9c2eh]
        push word ptr es:[bx+2]
        push word ptr es:[bx]
        call _FN_CIRCUIT_EGA_09C18
        add sp, 6
        call _FN_CIRCUIT_EGA_0681E
        mov word ptr [bp-2], ax
        or ax, ax
        je short L_0820
L_0853:
        mov ax, word ptr [bp-2]
        mov sp, bp
        pop bp
        ret
L_085A:
        mov ax, 8e5eh
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
        jmp short L_0892
        nop
L_088E:
        add word ptr [bp-4], 2
L_0892:
        mov ax, word ptr [bp-0ah]
        cmp word ptr [bp-4], ax
        jge short L_08C4
        mov ax, 1
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_EGA_08C1D
        add sp, 4
        push word ptr [bp-8]
        push word ptr [bp-4]
        push word ptr [bp-0ch]
        push word ptr [bp-0eh]
        call _FN_CIRCUIT_EGA_0A6AA
        add sp, 8
        call _FN_CIRCUIT_EGA_078EA
        mov word ptr [bp-2], ax
        or ax, ax
        je short L_088E
        jmp short L_0853
L_08C4:
        mov ax, 2dh
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_EGA_06872
        add sp, 4
        call _FN_CIRCUIT_EGA_0681E
        mov sp, bp
        pop bp
        ret
_grp_f8ffa5a4 ENDP
_TEXT ENDS
END
