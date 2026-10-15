_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_08CD8:NEAR
        EXTRN _FN_CIRCUIT_EGA_0D922:NEAR
        EXTRN _GRP_F3A4E254:NEAR
        EXTRN _FN_CIRCUIT_EGA_0B1B6:NEAR
        EXTRN _FN_CIRCUIT_EGA_09C18:NEAR
        EXTRN _FN_CIRCUIT_EGA_078DB:NEAR
        PUBLIC _grp_2a8a2e47
_grp_2a8a2e47 PROC NEAR
        push bp
        mov bp, sp
        sub sp, 2
        cmp word ptr [bp+4], 4800h
        jne short check_next
        dec word ptr ds:[0eeh]
        jns short after_decrement
        mov word ptr ds:[0eeh], 2
after_decrement:
        mov word ptr [bp+6], 1
check_next:
        cmp word ptr [bp+4], 5000h
        jne short check_flag
        inc word ptr ds:[0eeh]
        cmp word ptr ds:[0eeh], 3
        jl short after_increment
        mov word ptr ds:[0eeh], 0
after_increment:
        mov word ptr [bp+6], 1
check_flag:
        cmp word ptr [bp+6], 0
        jne short render
        jmp done
render:
        push word ptr ds:[9c30h]
        push word ptr ds:[9c2eh]
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        mov bx, word ptr ds:[98e6h]
        shl bx, 1
        shl bx, 1
        push word ptr [bx-634ch]
        push word ptr [bx-634eh]
        call _FN_CIRCUIT_EGA_0D922
        add sp, 4
        mov bx, word ptr ds:[0eeh]
        shl bx, 1
        shl bx, 1
        push word ptr [bx-634ch]
        push word ptr [bx-634eh]
        call _FN_CIRCUIT_EGA_0D922
        add sp, 4
        mov ax, word ptr ds:[0eeh]
        mov cx, ax
        shl ax, 1
        shl ax, 1
        shl ax, 1
        add ax, cx
        add ax, 0d3h
        push ax
        push word ptr ds:[96a6h]
        push word ptr ds:[96a4h]
        call _GRP_F3A4E254
        add sp, 6
        push dx
        push ax
        call _FN_CIRCUIT_EGA_0B1B6
        add sp, 4
        mov ax, word ptr ds:[0eeh]
        mov word ptr ds:[98e6h], ax
        push word ptr ds:[9b14h]
        push word ptr ds:[9b12h]
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        mov word ptr [bp-2], 0
copy_loop:
        push word ptr [bp-2]
        les bx, dword ptr ds:[9c2eh]
        push word ptr es:[bx+2]
        push word ptr es:[bx]
        call _FN_CIRCUIT_EGA_09C18
        add sp, 6
        inc word ptr [bp-2]
        cmp word ptr [bp-2], 4
        jl short copy_loop
        call _FN_CIRCUIT_EGA_078DB
        mov word ptr [bp+6], 0
done:
        mov sp, bp
        pop bp
        ret
_grp_2a8a2e47 ENDP
_TEXT ENDS
END
