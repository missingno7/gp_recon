_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_020BC:NEAR
        EXTRN _FN_CIRCUIT_CGA_02F80:NEAR
        EXTRN _FN_CIRCUIT_CGA_0AB24:NEAR
        EXTRN _GRP_34D2B405:NEAR
        EXTRN _GRP_622C4ED2:NEAR
        EXTRN _GRP_921AA84F:NEAR
        EXTRN _GRP_9E3EFDAA:NEAR
        EXTRN _GRP_BFA4F1CF:NEAR
        EXTRN _GRP_C5EFAE67:NEAR
        EXTRN _GRP_D687851F:NEAR
        EXTRN _GRP_E76F1CA2:NEAR
        EXTRN _GRP_FADCAB13:NEAR
        PUBLIC _grp_86c0d060
_grp_86c0d060 PROC NEAR
        push bp
        mov bp, sp
        sub sp, 4
        mov word ptr [bp-4], 0
L_1C41:
        mov ax, 1ch
        imul word ptr [bp-4]
        mov bx, ax
        mov word ptr [bx+160h], 0
        inc word ptr [bp-4]
        cmp word ptr [bp-4], 0ah
        jl short L_1C41
        mov word ptr [bp-4], 0
L_1C5D:
        mov bx, word ptr [bp-4]
        shl bx, 1
        mov word ptr [bx-6488h], 0
        inc word ptr [bp-4]
        cmp word ptr [bp-4], 8
        jl short L_1C5D
        mov word ptr ds:[288h], 0
L_1C77:
        cmp word ptr ds:[288h], 8
        jl short L_1C81
        jmp L_1D70
L_1C81:
        mov word ptr [bp-4], 0
L_1C86:
        mov ax, 1ch
        imul word ptr [bp-4]
        mov bx, ax
        mov word ptr [bx+162h], 0
        inc word ptr [bp-4]
        cmp word ptr [bp-4], 0ah
        jl short L_1C86
        call _GRP_BFA4F1CF
        cmp ax, 1bh
        jne short L_1CAC
L_1CA5:
        mov ax, 18h
        mov sp, bp
        pop bp
        ret
L_1CAC:
        cmp word ptr ds:[288h], 8
        jl short L_1CBA
        mov ax, 1bh
        mov sp, bp
        pop bp
        ret
L_1CBA:
        call _GRP_D687851F
        mov word ptr [bp-2], ax
        cmp ax, 1bh
        jne short L_1CCC
L_1CC5:
        mov ax, word ptr [bp-2]
        mov sp, bp
        pop bp
        ret
L_1CCC:
        cmp word ptr [bp-2], 0
        je short L_1D1A
        mov byte ptr ds:[2a8h], 0
        mov word ptr ds:[296h], 0
        mov word ptr ds:[298h], 0
L_1CE3:
        call _GRP_34D2B405
        cmp word ptr [bp-2], 0
        jne short L_1D13
        cmp word ptr ds:[296h], 0ah
        jbe short L_1D13
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
L_1D13:
        inc word ptr ds:[288h]
        jmp L_1C77
L_1D1A:
        mov byte ptr ds:[2a8h], 1
        mov word ptr ds:[9ba6h], 1
        mov ax, word ptr ds:[28ah]
        mov word ptr ds:[96b4h], ax
        sub ax, ax
        push ax
        call _GRP_E76F1CA2
        add sp, 2
        sub ax, ax
        push ax
        mov ax, 3
        push ax
        call _FN_CIRCUIT_CGA_0AB24
        add sp, 4
        mov ax, 58h
        push ax
        mov ax, 903ah
        push ax
        call _GRP_622C4ED2
        add sp, 4
        mov ax, 78h
        cwd
        push dx
        push ax
        call _GRP_921AA84F
        add sp, 4
        call _FN_CIRCUIT_CGA_020BC
        mov word ptr [bp-2], ax
        cmp ax, 1bh
        je short L_1D69
        jmp L_1CE3
L_1D69:
        call _GRP_FADCAB13
        jmp L_1CA5
        nop
L_1D70:
        call _GRP_BFA4F1CF
        mov word ptr ds:[5ea8h], 1
        mov word ptr [bp-4], 1
L_1D7E:
        mov ax, 1ch
        imul word ptr [bp-4]
        mov bx, ax
        mov ax, word ptr ds:[160h]
        cmp word ptr [bx+160h], ax
        jle short L_1D93
        inc word ptr ds:[5ea8h]
L_1D93:
        inc word ptr [bp-4]
        cmp word ptr [bp-4], 0ah
        jl short L_1D7E
        call _FN_CIRCUIT_CGA_02F80
        jmp L_1CC5
_grp_86c0d060 ENDP
_TEXT ENDS
END
