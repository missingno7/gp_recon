_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_038C8:NEAR
        EXTRN _FN_CIRCUIT_CGA_09B70:NEAR
        EXTRN _FN_CIRCUIT_CGA_0AB24:NEAR
        EXTRN _FN_CIRCUIT_CGA_0B418:NEAR
        EXTRN _GRP_64BAADA8:NEAR
        EXTRN _GRP_7B77C400:NEAR
        EXTRN _GRP_9D44A3BF:NEAR
        PUBLIC _grp_c0c9d9cd
_grp_c0c9d9cd PROC NEAR
        push bp
        mov bp, sp
        sub sp, 4ah
        push si
        call _FN_CIRCUIT_CGA_038C8
        mov ax, 3
        push ax
        mov ax, 1
        push ax
        call _FN_CIRCUIT_CGA_0AB24
        add sp, 4
        cmp word ptr ds:[98deh], 3
        jne short L_374A
        mov ax, 3ch
        push ax
        mov ax, 30h
        push ax
        mov ax, 9300h
        push ax
        call _FN_CIRCUIT_CGA_09B70
        add sp, 6
        mov ax, 48h
        push ax
        mov ax, 30h
        push ax
        mov ax, 9318h
        jmp short L_377B
L_374A:
        cmp word ptr ds:[98deh], 1
        jne short L_375E
        mov ax, 3ch
        push ax
        mov ax, 30h
        push ax
        mov ax, 9334h
        jmp short L_3769
L_375E:
        mov ax, 3ch
        push ax
        mov ax, 30h
        push ax
        mov ax, 934ch
L_3769:
        push ax
        call _FN_CIRCUIT_CGA_09B70
        add sp, 6
        mov ax, 48h
        push ax
        mov ax, 30h
        push ax
        mov ax, 9364h
L_377B:
        push ax
        call _FN_CIRCUIT_CGA_09B70
        add sp, 6
        mov ax, 3
        push ax
        sub ax, ax
        push ax
        call _FN_CIRCUIT_CGA_0AB24
        add sp, 4
        mov word ptr [bp-46h], 0
        jmp L_3862
        nop
L_3798:
        mov word ptr [bp-2], 9390h
        mov bx, word ptr [bp-46h]
        shl bx, 1
        mov bx, word ptr [bx-6740h]
        mov ax, word ptr [bx+0eh]
        mov dx, word ptr [bx+10h]
        mov word ptr [bp-4ah], ax
        mov word ptr [bp-48h], dx
        cmp ax, 0ffffh
        jne short L_37BC
        cmp dx, -1
        je short L_37CB
L_37BC:
        push word ptr [bp-48h]
        push word ptr [bp-4ah]
        call _GRP_64BAADA8
        add sp, 4
        mov word ptr [bp-2], ax
L_37CB:
        mov bx, word ptr [bp-46h]
        shl bx, 1
        mov si, word ptr [bx-6740h]
        push word ptr [bp-2]
        mov ax, word ptr [si+0ch]
        mov cx, ax
        shl ax, 1
        shl ax, 1
        add ax, cx
        shl ax, 1
        add ax, 312h
        push ax
        push si
        mov ax, 9392h
        push ax
        lea ax, [bp-42h]
        push ax
        call _GRP_7B77C400
        add sp, 0ah
L_37F7:
        mov ax, word ptr ds:[96a0h]
        cmp word ptr [bp-46h], ax
        jne short L_383E
        mov ax, 3
        push ax
        mov ax, 2
        push ax
        call _FN_CIRCUIT_CGA_0AB24
        add sp, 4
        mov ax, word ptr [bp-46h]
        mov cx, ax
        shl ax, 1
        add ax, cx
        shl ax, 1
        add ax, cx
        shl ax, 1
        add ax, 56h
        push ax
        mov ax, 30h
        push ax
        lea ax, [bp-42h]
        push ax
        call _FN_CIRCUIT_CGA_09B70
        add sp, 6
        mov ax, 3
        push ax
        sub ax, ax
        push ax
        call _FN_CIRCUIT_CGA_0AB24
        add sp, 4
        jmp short L_385F
        nop
L_383E:
        mov ax, word ptr [bp-46h]
        mov cx, ax
        shl ax, 1
        add ax, cx
        shl ax, 1
        add ax, cx
        shl ax, 1
        add ax, 56h
        push ax
        mov ax, 30h
        push ax
        lea ax, [bp-42h]
        push ax
        call _FN_CIRCUIT_CGA_09B70
        add sp, 6
L_385F:
        inc word ptr [bp-46h]
L_3862:
        cmp word ptr [bp-46h], 8
        jge short L_38A4
        cmp word ptr ds:[98deh], 3
        je short L_3872
        jmp L_3798
L_3872:
        mov bx, word ptr [bp-46h]
        shl bx, 1
        mov si, word ptr [bx-6740h]
        push word ptr [si+10h]
        push word ptr [si+0eh]
        mov ax, word ptr [si+0ch]
        mov cx, ax
        shl ax, 1
        shl ax, 1
        add ax, cx
        shl ax, 1
        add ax, 312h
        push ax
        push si
        mov ax, 9380h
        push ax
        lea ax, [bp-42h]
        push ax
        call _GRP_7B77C400
        add sp, 0ch
        jmp L_37F7
L_38A4:
        push word ptr ds:[9ae4h]
        push word ptr ds:[9ae2h]
        call _FN_CIRCUIT_CGA_0B418
        add sp, 4
        les bx, dword ptr ds:[9bfeh]
        push word ptr es:[bx+2]
        push word ptr es:[bx]
        call _GRP_9D44A3BF
        add sp, 4
        pop si
        mov sp, bp
        pop bp
        ret
_grp_c0c9d9cd ENDP
_TEXT ENDS
END
