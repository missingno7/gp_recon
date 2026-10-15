_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_038C6:NEAR
        EXTRN _FN_CIRCUIT_EGA_08C84:NEAR
        EXTRN _FN_CIRCUIT_EGA_08CD8:NEAR
        EXTRN _FN_CIRCUIT_EGA_0B1B6:NEAR
        EXTRN _FN_CIRCUIT_EGA_0B9D2:NEAR
        EXTRN _GRP_64BAADA8:NEAR
        EXTRN _GRP_7B77C400:NEAR
        PUBLIC _grp_c0c9d9cd
_grp_c0c9d9cd PROC NEAR
        push bp
        mov bp, sp
        sub sp, 4ah
        push si
        call _FN_CIRCUIT_EGA_038C6
        mov ax, 0fh
        push ax
        mov ax, 9
        push ax
        call _FN_CIRCUIT_EGA_08C84
        add sp, 4
        cmp word ptr ds:[990eh], 3
        jne short L_3748
        mov ax, 3ch
        push ax
        mov ax, 30h
        push ax
        mov ax, 9328h
        push ax
        call _FN_CIRCUIT_EGA_0B9D2
        add sp, 6
        mov ax, 48h
        push ax
        mov ax, 30h
        push ax
        mov ax, 9340h
        jmp short L_3779
L_3748:
        cmp word ptr ds:[990eh], 1
        jne short L_375C
        mov ax, 3ch
        push ax
        mov ax, 30h
        push ax
        mov ax, 935ch
        jmp short L_3767
L_375C:
        mov ax, 3ch
        push ax
        mov ax, 30h
        push ax
        mov ax, 9374h
L_3767:
        push ax
        call _FN_CIRCUIT_EGA_0B9D2
        add sp, 6
        mov ax, 48h
        push ax
        mov ax, 30h
        push ax
        mov ax, 938ch
L_3779:
        push ax
        call _FN_CIRCUIT_EGA_0B9D2
        add sp, 6
        mov ax, 0fh
        push ax
        sub ax, ax
        push ax
        call _FN_CIRCUIT_EGA_08C84
        add sp, 4
        mov word ptr [bp-46h], 0
        jmp L_3860
        nop
L_3796:
        mov word ptr [bp-2], 93b8h
        mov bx, word ptr [bp-46h]
        shl bx, 1
        mov bx, word ptr [bx-6710h]
        mov ax, word ptr [bx+0eh]
        mov dx, word ptr [bx+10h]
        mov word ptr [bp-4ah], ax
        mov word ptr [bp-48h], dx
        cmp ax, 0ffffh
        jne short L_37BA
        cmp dx, -1
        je short L_37C9
L_37BA:
        push word ptr [bp-48h]
        push word ptr [bp-4ah]
        call _GRP_64BAADA8
        add sp, 4
        mov word ptr [bp-2], ax
L_37C9:
        mov bx, word ptr [bp-46h]
        shl bx, 1
        mov si, word ptr [bx-6710h]
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
        mov ax, 93bah
        push ax
        lea ax, [bp-42h]
        push ax
        call _GRP_7B77C400
        add sp, 0ah
L_37F5:
        mov ax, word ptr ds:[96d0h]
        cmp word ptr [bp-46h], ax
        jne short L_383C
        mov ax, 0fh
        push ax
        mov ax, 0ch
        push ax
        call _FN_CIRCUIT_EGA_08C84
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
        call _FN_CIRCUIT_EGA_0B9D2
        add sp, 6
        mov ax, 0fh
        push ax
        sub ax, ax
        push ax
        call _FN_CIRCUIT_EGA_08C84
        add sp, 4
        jmp short L_385D
        nop
L_383C:
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
        call _FN_CIRCUIT_EGA_0B9D2
        add sp, 6
L_385D:
        inc word ptr [bp-46h]
L_3860:
        cmp word ptr [bp-46h], 8
        jge short L_38A2
        cmp word ptr ds:[990eh], 3
        je short L_3870
        jmp L_3796
L_3870:
        mov bx, word ptr [bp-46h]
        shl bx, 1
        mov si, word ptr [bx-6710h]
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
        mov ax, 93a8h
        push ax
        lea ax, [bp-42h]
        push ax
        call _GRP_7B77C400
        add sp, 0ch
        jmp L_37F5
L_38A2:
        push word ptr ds:[9b14h]
        push word ptr ds:[9b12h]
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        les bx, dword ptr ds:[9c2eh]
        push word ptr es:[bx+2]
        push word ptr es:[bx]
        call _FN_CIRCUIT_EGA_0B1B6
        add sp, 4
        pop si
        mov sp, bp
        pop bp
        ret
_grp_c0c9d9cd ENDP
_TEXT ENDS
END
