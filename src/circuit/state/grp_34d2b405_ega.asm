_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_02CB6:NEAR
        EXTRN _FN_CIRCUIT_EGA_078D2:NEAR
        EXTRN _FN_CIRCUIT_EGA_078DB:NEAR
        EXTRN _FN_CIRCUIT_EGA_08C84:NEAR
        EXTRN _FN_CIRCUIT_EGA_08CD8:NEAR
        EXTRN _FN_CIRCUIT_EGA_0B1B6:NEAR
        EXTRN _FN_CIRCUIT_EGA_0B9D2:NEAR
        EXTRN _GRP_4B39B4E7:NEAR
        EXTRN _GRP_60B99719:NEAR
        EXTRN _GRP_7B77C400:NEAR
        EXTRN _GRP_CDDC44DB:NEAR
        PUBLIC _grp_34d2b405
_grp_34d2b405 PROC NEAR
        push bp
        mov bp, sp
        sub sp, 46h
        push si
        call _FN_CIRCUIT_EGA_02CB6
        mov word ptr [bp-46h], 0
L_29FF:
        mov ax, 1ch
        imul word ptr [bp-46h]
        mov bx, ax
        cmp word ptr [bx+162h], -1
        jne short L_2A1F
        mov si, word ptr [bp-46h]
        shl si, 1
        mov word ptr [si+0d4eh], 0
        mov word ptr [si+0d62h], 0
L_2A1F:
        inc word ptr [bp-46h]
        cmp word ptr [bp-46h], 0ah
        jl short L_29FF
        cmp byte ptr ds:[2a8h], 0
        je short L_2A32
        call _GRP_4B39B4E7
L_2A32:
        sub ax, ax
        push ax
        mov ax, 0fh
        push ax
        call _FN_CIRCUIT_EGA_08C84
        add sp, 4
        mov ax, 60h
        push ax
        mov ax, 68h
        push ax
        mov ax, 91e8h
        push ax
        call _FN_CIRCUIT_EGA_0B9D2
        add sp, 6
        mov ax, 6ah
        push ax
        mov ax, 20h
        push ax
        mov ax, 91f6h
        push ax
        call _FN_CIRCUIT_EGA_0B9D2
        add sp, 6
        sub ax, ax
        push ax
        mov ax, 0ch
        push ax
        call _FN_CIRCUIT_EGA_08C84
        add sp, 4
        mov word ptr [bp-46h], 0
        jmp short L_2AB2
        nop
L_2A78:
        mov ax, word ptr [bp-46h]
        shl ax, 1
        add ax, 274h
L_2A80:
        push ax
        lea ax, [bp-40h]
        push ax
        call _GRP_CDDC44DB
        add sp, 4
        mov ax, word ptr [bp-46h]
        mov cl, 3
        shl ax, cl
        add ax, 74h
        push ax
        sub ax, ax
        push ax
        lea ax, [bp-40h]
        push ax
        call _FN_CIRCUIT_EGA_0B9D2
        add sp, 6
        cmp word ptr [bp-44h], 0
        jne short L_2AAF
        mov ax, word ptr [bp-46h]
        mov word ptr [bp-42h], ax
L_2AAF:
        inc word ptr [bp-46h]
L_2AB2:
        cmp word ptr [bp-46h], 0ah
        jge short L_2AF6
        mov bx, word ptr [bp-46h]
        shl bx, 1
        mov ax, word ptr [bx-694ch]
        mov word ptr [bp-44h], ax
        mov ax, 1ch
        imul word ptr [bp-44h]
        mov si, ax
        add ax, 15ch
        push ax
        mov ax, si
        add ax, 164h
        push ax
        mov ax, word ptr [bp-46h]
        inc ax
        push ax
        mov ax, 9218h
        push ax
        lea ax, [bp-40h]
        push ax
        call _GRP_7B77C400
        add sp, 0ah
        cmp word ptr [si+162h], -1
        jne short L_2A78
        mov ax, 9232h
        jmp short L_2A80
        nop
L_2AF6:
        push word ptr ds:[9b14h]
        push word ptr ds:[9b12h]
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        les bx, dword ptr ds:[9c2eh]
        push word ptr es:[bx+2]
        push word ptr es:[bx]
        call _FN_CIRCUIT_EGA_0B1B6
        add sp, 4
        mov ax, word ptr [bp-42h]
        mov word ptr [bp-46h], ax
        mov word ptr [bp-44h], 0
        mov ax, 15ch
        push ax
        mov ax, 164h
        push ax
        mov ax, word ptr [bp-46h]
        inc ax
        push ax
        mov ax, 9236h
        push ax
        lea ax, [bp-40h]
        push ax
        call _GRP_7B77C400
        add sp, 0ah
        cmp word ptr ds:[162h], -1
        jne short L_2B48
        mov ax, 9250h
        jmp short L_2B50
        nop
L_2B48:
        mov ax, word ptr [bp-46h]
        shl ax, 1
        add ax, 274h
L_2B50:
        push ax
        lea ax, [bp-40h]
        push ax
        call _GRP_CDDC44DB
        add sp, 4
        call _FN_CIRCUIT_EGA_078DB
        sub ax, ax
        push ax
        mov ax, 0fh
        push ax
        mov ax, 0ch
        push ax
        mov ax, word ptr [bp-46h]
        mov cl, 3
        shl ax, cl
        add ax, 74h
        push ax
        sub ax, ax
        push ax
        lea ax, [bp-40h]
        push ax
        call _GRP_60B99719
        add sp, 0ch
        mov ax, 1ch
        imul word ptr ds:[96b4h]
        mov si, ax
        mov bx, word ptr ds:[288h]
        shl bx, 1
        add ax, 164h
        mov word ptr [bx-6458h], ax
        add word ptr [si+160h], 9
        mov ax, 1ch
        imul word ptr ds:[96b6h]
        mov bx, ax
        add word ptr [bx+160h], 6
        mov ax, 1ch
        imul word ptr ds:[96b8h]
        mov bx, ax
        add word ptr [bx+160h], 4
        mov ax, 1ch
        imul word ptr ds:[96bah]
        mov bx, ax
        add word ptr [bx+160h], 3
        mov ax, 1ch
        imul word ptr ds:[96bch]
        mov bx, ax
        add word ptr [bx+160h], 2
        mov ax, 1ch
        imul word ptr ds:[96beh]
        mov bx, ax
        inc word ptr [bx+160h]
        call _FN_CIRCUIT_EGA_078D2
        pop si
        mov sp, bp
        pop bp
        ret
_grp_34d2b405 ENDP
_TEXT ENDS
END
