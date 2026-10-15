_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_02CB2:NEAR
        EXTRN _FN_CIRCUIT_CGA_0837E:NEAR
        EXTRN _FN_CIRCUIT_CGA_08387:NEAR
        EXTRN _FN_CIRCUIT_CGA_09B70:NEAR
        EXTRN _FN_CIRCUIT_CGA_0AB24:NEAR
        EXTRN _FN_CIRCUIT_CGA_0B418:NEAR
        EXTRN _GRP_4B39B4E7:NEAR
        EXTRN _GRP_60B99719:NEAR
        EXTRN _GRP_7B77C400:NEAR
        EXTRN _GRP_9D44A3BF:NEAR
        EXTRN _GRP_CDDC44DB:NEAR
        PUBLIC _grp_34d2b405
_grp_34d2b405 PROC NEAR
        push bp
        mov bp, sp
        sub sp, 46h
        push si
        call _FN_CIRCUIT_CGA_02CB2
        mov word ptr [bp-46h], 0
L_29FB:
        mov ax, 1ch
        imul word ptr [bp-46h]
        mov bx, ax
        cmp word ptr [bx+162h], -1
        jne short L_2A1B
        mov si, word ptr [bp-46h]
        shl si, 1
        mov word ptr [si+0d4ah], 0
        mov word ptr [si+0d5eh], 0
L_2A1B:
        inc word ptr [bp-46h]
        cmp word ptr [bp-46h], 0ah
        jl short L_29FB
        cmp byte ptr ds:[2a8h], 0
        je short L_2A2E
        call _GRP_4B39B4E7
L_2A2E:
        sub ax, ax
        push ax
        mov ax, 3
        push ax
        call _FN_CIRCUIT_CGA_0AB24
        add sp, 4
        mov ax, 60h
        push ax
        mov ax, 68h
        push ax
        mov ax, 91c0h
        push ax
        call _FN_CIRCUIT_CGA_09B70
        add sp, 6
        mov ax, 6ah
        push ax
        mov ax, 20h
        push ax
        mov ax, 91ceh
        push ax
        call _FN_CIRCUIT_CGA_09B70
        add sp, 6
        sub ax, ax
        push ax
        mov ax, 2
        push ax
        call _FN_CIRCUIT_CGA_0AB24
        add sp, 4
        mov word ptr [bp-46h], 0
        jmp short L_2AAE
        nop
L_2A74:
        mov ax, word ptr [bp-46h]
        shl ax, 1
        add ax, 274h
L_2A7C:
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
        call _FN_CIRCUIT_CGA_09B70
        add sp, 6
        cmp word ptr [bp-44h], 0
        jne short L_2AAB
        mov ax, word ptr [bp-46h]
        mov word ptr [bp-42h], ax
L_2AAB:
        inc word ptr [bp-46h]
L_2AAE:
        cmp word ptr [bp-46h], 0ah
        jge short L_2AF2
        mov bx, word ptr [bp-46h]
        shl bx, 1
        mov ax, word ptr [bx-697ch]
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
        mov ax, 91f0h
        push ax
        lea ax, [bp-40h]
        push ax
        call _GRP_7B77C400
        add sp, 0ah
        cmp word ptr [si+162h], -1
        jne short L_2A74
        mov ax, 920ah
        jmp short L_2A7C
        nop
L_2AF2:
        push word ptr ds:[9ae4h]
        push word ptr ds:[9ae2h]
        call _FN_CIRCUIT_CGA_0B418
        add sp, 4
        les bx, dword ptr ds:[9bfeh]
        push word ptr es:[bx+2]
        push word ptr es:[bx]
        call _GRP_9D44A3BF
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
        mov ax, 920eh
        push ax
        lea ax, [bp-40h]
        push ax
        call _GRP_7B77C400
        add sp, 0ah
        cmp word ptr ds:[162h], -1
        jne short L_2B44
        mov ax, 9228h
        jmp short L_2B4C
        nop
L_2B44:
        mov ax, word ptr [bp-46h]
        shl ax, 1
        add ax, 274h
L_2B4C:
        push ax
        lea ax, [bp-40h]
        push ax
        call _GRP_CDDC44DB
        add sp, 4
        call _FN_CIRCUIT_CGA_08387
        sub ax, ax
        push ax
        mov ax, 3
        push ax
        mov ax, 2
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
        imul word ptr ds:[9684h]
        mov si, ax
        mov bx, word ptr ds:[288h]
        shl bx, 1
        add ax, 164h
        mov word ptr [bx-6488h], ax
        add word ptr [si+160h], 9
        mov ax, 1ch
        imul word ptr ds:[9686h]
        mov bx, ax
        add word ptr [bx+160h], 6
        mov ax, 1ch
        imul word ptr ds:[9688h]
        mov bx, ax
        add word ptr [bx+160h], 4
        mov ax, 1ch
        imul word ptr ds:[968ah]
        mov bx, ax
        add word ptr [bx+160h], 3
        mov ax, 1ch
        imul word ptr ds:[968ch]
        mov bx, ax
        add word ptr [bx+160h], 2
        mov ax, 1ch
        imul word ptr ds:[968eh]
        mov bx, ax
        inc word ptr [bx+160h]
        call _FN_CIRCUIT_CGA_0837E
        pop si
        mov sp, bp
        pop bp
        ret
_grp_34d2b405 ENDP
_TEXT ENDS
END
