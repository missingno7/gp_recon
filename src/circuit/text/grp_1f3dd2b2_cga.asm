_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_06A1E:NEAR
        EXTRN _FN_CIRCUIT_CGA_06A72:NEAR
        EXTRN _FN_CIRCUIT_CGA_08396:NEAR
        EXTRN _FN_CIRCUIT_CGA_0A018:NEAR
        EXTRN _FN_CIRCUIT_CGA_0AA92:NEAR
        EXTRN _FN_CIRCUIT_CGA_0B418:NEAR
        EXTRN _GRP_7DE44506:NEAR
        EXTRN _GRP_9D44A3BF:NEAR
        EXTRN _GRP_B9359687:NEAR
        EXTRN _GRP_E76F1CA2:NEAR
        EXTRN _GRP_F3A4E254:NEAR
        PUBLIC _grp_1f3dd2b2
_grp_1f3dd2b2 PROC NEAR
        push bp
        mov bp, sp
        sub sp, 1eh
        push word ptr ds:[9c00h]
        push word ptr ds:[9bfeh]
        call _FN_CIRCUIT_CGA_0B418
        add sp, 4
        sub ax, ax
        push ax
        call _GRP_E76F1CA2
        add sp, 2
        push word ptr ds:[9ae4h]
        push word ptr ds:[9ae2h]
        call _FN_CIRCUIT_CGA_0B418
        add sp, 4
        mov word ptr [bp-16h], 0
L_0902:
        push word ptr [bp-16h]
        les bx, dword ptr ds:[9bfeh]
        push word ptr es:[bx+2]
        push word ptr es:[bx]
        call _GRP_7DE44506
        add sp, 6
        inc word ptr [bp-16h]
        cmp word ptr [bp-16h], 4
        jl short L_0902
        push word ptr ds:[9c00h]
        push word ptr ds:[9bfeh]
        call _FN_CIRCUIT_CGA_0B418
        add sp, 4
        mov ax, 8e3ch
        push ax
        push word ptr ds:[50h]
        push word ptr ds:[4eh]
        call _GRP_F3A4E254
        add sp, 6
        mov word ptr [bp-0eh], ax
        mov word ptr [bp-0ch], dx
        mov ax, 8e42h
        push ax
        push word ptr ds:[50h]
        push word ptr ds:[4eh]
        call _GRP_F3A4E254
        add sp, 6
        mov word ptr [bp-8], ax
        mov word ptr [bp-6], dx
        mov ax, 8e48h
        push ax
        push word ptr ds:[50h]
        push word ptr ds:[4eh]
        call _GRP_F3A4E254
        add sp, 6
        mov word ptr [bp-12h], ax
        mov word ptr [bp-10h], dx
        push word ptr ds:[9ae4h]
        push word ptr ds:[9ae2h]
        call _FN_CIRCUIT_CGA_0B418
        add sp, 4
        les bx, dword ptr [bp-0eh]
        mov ax, word ptr es:[bx+8]
        add ax, word ptr es:[bx+4]
        mov word ptr [bp-1ch], ax
        mov ax, word ptr es:[bx+0ah]
        add ax, word ptr es:[bx+6]
        mov word ptr [bp-1eh], ax
        mov word ptr [bp-1ah], 6
        call _FN_CIRCUIT_CGA_0AA92
        mov word ptr [bp-4], ax
        mov word ptr [bp-2], dx
        mov word ptr [bp-18h], 0
        mov ax, word ptr [bp-1ch]
        add ax, word ptr [bp-1eh]
        mov word ptr [bp-14h], ax
L_09B8:
        mov ax, word ptr [bp-1ah]
        add word ptr [bp-18h], ax
        sub word ptr [bp-14h], ax
        mov ax, word ptr [bp-1eh]
        cmp word ptr [bp-18h], ax
        jl short L_09D2
        mov word ptr [bp-18h], ax
        mov ax, word ptr [bp-1ch]
        mov word ptr [bp-14h], ax
L_09D2:
        push word ptr ds:[9c00h]
        push word ptr ds:[9bfeh]
        call _FN_CIRCUIT_CGA_0B418
        add sp, 4
        sub ax, ax
        push ax
        call _GRP_E76F1CA2
        add sp, 2
        push word ptr [bp-18h]
        push word ptr [bp-1ch]
        push word ptr [bp-0ch]
        push word ptr [bp-0eh]
        call _FN_CIRCUIT_CGA_0A018
        add sp, 8
        push word ptr [bp-18h]
        push word ptr [bp-14h]
        push word ptr [bp-10h]
        push word ptr [bp-12h]
        call _FN_CIRCUIT_CGA_0A018
        add sp, 8
        push word ptr [bp-1eh]
        push word ptr [bp-14h]
        push word ptr [bp-6]
        push word ptr [bp-8]
        call _FN_CIRCUIT_CGA_0A018
        add sp, 8
        push word ptr ds:[9ae4h]
        push word ptr ds:[9ae2h]
        call _FN_CIRCUIT_CGA_0B418
        add sp, 4
        les bx, dword ptr ds:[9bfeh]
        push word ptr es:[bx+2]
        push word ptr es:[bx]
        call _GRP_9D44A3BF
        add sp, 4
        call _FN_CIRCUIT_CGA_0AA92
        sub ax, word ptr [bp-4]
        mov word ptr [bp-1ah], ax
        call _FN_CIRCUIT_CGA_0AA92
        mov word ptr [bp-4], ax
        mov word ptr [bp-2], dx
        call _FN_CIRCUIT_CGA_08396
        mov word ptr [bp-0ah], ax
        or ax, ax
        je short L_0A62
L_0A5A:
        mov ax, word ptr [bp-0ah]
        mov sp, bp
        pop bp
        ret
        nop
L_0A62:
        mov ax, word ptr [bp-1eh]
        cmp word ptr [bp-18h], ax
        jge short L_0A6D
        jmp L_09B8
L_0A6D:
        mov ax, 8e4eh
        push ax
        push word ptr ds:[50h]
        push word ptr ds:[4eh]
        call _GRP_F3A4E254
        add sp, 6
        push dx
        push ax
        call _GRP_9D44A3BF
        add sp, 4
        mov ax, 0eh
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_CGA_06A72
        add sp, 4
        call _FN_CIRCUIT_CGA_06A1E
        mov word ptr [bp-0ah], ax
        or ax, ax
        jne short L_0A5A
        call _GRP_B9359687
        mov ax, 5ah
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_CGA_06A72
        add sp, 4
        call _FN_CIRCUIT_CGA_06A1E
        mov sp, bp
        pop bp
        ret
        nop
_grp_1f3dd2b2 ENDP
_TEXT ENDS
END
