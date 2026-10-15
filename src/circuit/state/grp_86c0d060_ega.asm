_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_020BE:NEAR
        EXTRN _FN_CIRCUIT_EGA_02F80:NEAR
        EXTRN _FN_CIRCUIT_EGA_08C84:NEAR
        EXTRN _FN_CIRCUIT_EGA_09394:NEAR
        EXTRN _GRP_34D2B405:NEAR
        EXTRN _GRP_622C4ED2:NEAR
        EXTRN _GRP_921AA84F:NEAR
        EXTRN _GRP_9E3EFDAA:NEAR
        EXTRN _GRP_BFA4F1CF:NEAR
        EXTRN _GRP_C5EFAE67:NEAR
        EXTRN _GRP_D687851F:NEAR
        EXTRN _GRP_FADCAB13:NEAR
        PUBLIC _grp_86c0d060
_grp_86c0d060 PROC NEAR
        push bp
        mov bp, sp
        sub sp, 4
        mov word ptr [bp-4], 0
L_1C43:
        mov ax, 1ch
        imul word ptr [bp-4]
        mov bx, ax
        mov word ptr [bx+160h], 0
        inc word ptr [bp-4]
        cmp word ptr [bp-4], 0ah
        jl short L_1C43
        mov word ptr [bp-4], 0
L_1C5F:
        mov bx, word ptr [bp-4]
        shl bx, 1
        mov word ptr [bx-6458h], 0
        inc word ptr [bp-4]
        cmp word ptr [bp-4], 8
        jl short L_1C5F
        mov word ptr ds:[288h], 0
L_1C79:
        cmp word ptr ds:[288h], 8
        jl short L_1C83
        jmp L_1D72
L_1C83:
        mov word ptr [bp-4], 0
L_1C88:
        mov ax, 1ch
        imul word ptr [bp-4]
        mov bx, ax
        mov word ptr [bx+162h], 0
        inc word ptr [bp-4]
        cmp word ptr [bp-4], 0ah
        jl short L_1C88
        call _GRP_BFA4F1CF
        cmp ax, 1bh
        jne short L_1CAE
L_1CA7:
        mov ax, 18h
        mov sp, bp
        pop bp
        ret
L_1CAE:
        cmp word ptr ds:[288h], 8
        jl short L_1CBC
        mov ax, 1bh
        mov sp, bp
        pop bp
        ret
L_1CBC:
        call _GRP_D687851F
        mov word ptr [bp-2], ax
        cmp ax, 1bh
        jne short L_1CCE
L_1CC7:
        mov ax, word ptr [bp-2]
        mov sp, bp
        pop bp
        ret
L_1CCE:
        cmp word ptr [bp-2], 0
        je short L_1D1C
        mov byte ptr ds:[2a8h], 0
        mov word ptr ds:[296h], 0
        mov word ptr ds:[298h], 0
L_1CE5:
        call _GRP_34D2B405
        cmp word ptr [bp-2], 0
        jne short L_1D15
        cmp word ptr ds:[296h], 0ah
        jbe short L_1D15
        mov ax, 1
        push ax
        mov ax, 2
        push ax
        mov ax, word ptr ds:[28ah]
        cwd
        push dx
        push ax
        sub ax, ax
        push ax
        push word ptr ds:[296h]
        call _GRP_C5EFAE67
        push dx
        push ax
        call _GRP_9E3EFDAA
        add sp, 8
L_1D15:
        inc word ptr ds:[288h]
        jmp L_1C79
L_1D1C:
        mov byte ptr ds:[2a8h], 1
        mov word ptr ds:[9bd6h], 1
        mov ax, word ptr ds:[28ah]
        mov word ptr ds:[96e4h], ax
        sub ax, ax
        push ax
        call _FN_CIRCUIT_EGA_09394
        add sp, 2
        sub ax, ax
        push ax
        mov ax, 0fh
        push ax
        call _FN_CIRCUIT_EGA_08C84
        add sp, 4
        mov ax, 58h
        push ax
        mov ax, 9062h
        push ax
        call _GRP_622C4ED2
        add sp, 4
        mov ax, 78h
        cwd
        push dx
        push ax
        call _GRP_921AA84F
        add sp, 4
        call _FN_CIRCUIT_EGA_020BE
        mov word ptr [bp-2], ax
        cmp ax, 1bh
        je short L_1D6B
        jmp L_1CE5
L_1D6B:
        call _GRP_FADCAB13
        jmp L_1CA7
        nop
L_1D72:
        call _GRP_BFA4F1CF
        mov word ptr ds:[5ec4h], 1
        mov word ptr [bp-4], 1
L_1D80:
        mov ax, 1ch
        imul word ptr [bp-4]
        mov bx, ax
        mov ax, word ptr ds:[160h]
        cmp word ptr [bx+160h], ax
        jle short L_1D95
        inc word ptr ds:[5ec4h]
L_1D95:
        inc word ptr [bp-4]
        cmp word ptr [bp-4], 0ah
        jl short L_1D80
        call _FN_CIRCUIT_EGA_02F80
        jmp L_1CC7
_grp_86c0d060 ENDP
_TEXT ENDS
END
