_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_06A1E:NEAR
        EXTRN _FN_CIRCUIT_CGA_06A72:NEAR
        EXTRN _FN_CIRCUIT_CGA_0767A:NEAR
        EXTRN _FN_CIRCUIT_CGA_09B70:NEAR
        EXTRN _FN_CIRCUIT_CGA_0AABD:NEAR
        EXTRN _FN_CIRCUIT_CGA_0AAE4:NEAR
        EXTRN _FN_CIRCUIT_CGA_0BADE:NEAR
        PUBLIC _grp_aace91da
_grp_aace91da PROC NEAR
        push bp
        mov bp, sp
        sub sp, 6
        push si
        mov ax, word ptr [bp+8]
        mov word ptr ds:[98d4h], ax
        mov ax, word ptr [bp+0ah]
        mov word ptr ds:[98d6h], ax
        mov bx, word ptr [bp+6]
        mov si, word ptr [bp+4]
        mov byte ptr [bx+si], 0
        mov word ptr [bp-4], 0
        jmp short L_73E1
        nop
L_73DE:
        inc word ptr [bp-4]
L_73E1:
        mov bx, word ptr [bp-4]
        mov si, word ptr [bp+4]
        cmp byte ptr [bx+si], 0
        je short L_73F1
        jmp short L_73DE
L_73EE:
        inc word ptr [bp-4]
L_73F1:
        mov ax, word ptr [bp+6]
        cmp word ptr [bp-4], ax
        jge short L_7404
        mov bx, word ptr [bp-4]
        mov si, word ptr [bp+4]
        mov byte ptr [bx+si], 20h
        jmp short L_73EE
L_7404:
        push word ptr [bp+0ah]
        push word ptr [bp+8]
        push word ptr [bp+4]
        call _FN_CIRCUIT_CGA_09B70
        add sp, 6
        mov word ptr ds:[98e0h], 0
        mov word ptr ds:[9b76h], 1
        mov word ptr [bp-2], 0
        mov ax, 1
        push ax
        push word ptr [bp+0ah]
        push word ptr [bp+8]
        call _FN_CIRCUIT_CGA_0BADE
        add sp, 6
        mov word ptr ds:[9c8eh], 1
        push word ptr [bp+0eh]
        push word ptr [bp+0ch]
        call _FN_CIRCUIT_CGA_0AABD
        add sp, 4
        mov ax, 4
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_CGA_06A72
        add sp, 4
L_7452:
        call _FN_CIRCUIT_CGA_06A1E
        mov word ptr [bp-6], ax
        or ax, ax
        jne short L_74B2
        mov ax, 4
        cwd
        push dx
        push ax
        call _FN_CIRCUIT_CGA_06A72
        add sp, 4
        push word ptr ds:[9b76h]
        push word ptr [bp+0ah]
        mov ax, word ptr [bp+8]
        mov dx, word ptr ds:[98e0h]
        mov cl, 3
        shl dx, cl
        add ax, dx
        push ax
        call _FN_CIRCUIT_CGA_0BADE
        add sp, 6
        cmp word ptr ds:[9c8eh], 0
        je short L_7492
        mov word ptr ds:[9c8eh], 0
        jmp short L_7498
L_7492:
        mov word ptr ds:[9c8eh], 1
L_7498:
        mov ax, word ptr [bp+0ch]
        or ax, word ptr [bp+0eh]
        je short L_7452
        call _FN_CIRCUIT_CGA_0AAE4
        or ax, ax
        je short L_7452
L_74A7:
        call _FN_CIRCUIT_CGA_0767A
        mov ax, word ptr [bp-6]
        pop si
        mov sp, bp
        pop bp
        ret
L_74B2:
        push word ptr [bp+0eh]
        push word ptr [bp+0ch]
        call _FN_CIRCUIT_CGA_0AABD
        add sp, 4
        cmp word ptr [bp-6], 0dh
        je short L_74A7
        cmp word ptr [bp-6], 1bh
        je short L_74A7
        cmp word ptr [bp-6], 4800h
        je short L_74A7
        cmp word ptr [bp-6], 5000h
        je short L_74A7
        cmp word ptr [bp-6], 9
        je short L_74A7
        cmp word ptr [bp-6], 4d00h
        jne short L_74FA
        call _FN_CIRCUIT_CGA_0767A
        mov ax, word ptr ds:[98e0h]
        cmp word ptr [bp+6], ax
        jg short L_74F3
        jmp L_75D4
L_74F3:
        inc word ptr ds:[98e0h]
        jmp L_75D4
L_74FA:
        cmp word ptr [bp-6], 4b00h
        jne short L_7516
        call _FN_CIRCUIT_CGA_0767A
        cmp word ptr ds:[98e0h], 0
        jne short L_750E
        jmp L_75D4
L_750E:
        dec word ptr ds:[98e0h]
        jmp L_75D4
        nop
L_7516:
        cmp word ptr [bp-6], 4700h
        jne short L_752A
        call _FN_CIRCUIT_CGA_0767A
        mov word ptr ds:[98e0h], 0
        jmp L_75D4
        nop
L_752A:
        cmp word ptr [bp-6], 4f00h
        jne short L_753E
        call _FN_CIRCUIT_CGA_0767A
        mov ax, word ptr [bp+6]
        mov word ptr ds:[98e0h], ax
        jmp L_75D4
        nop
L_753E:
        cmp word ptr [bp-6], 5200h
        jne short L_756A
        call _FN_CIRCUIT_CGA_0767A
        cmp word ptr [bp-2], 0
        jne short L_755C
        mov word ptr [bp-2], 1
        mov word ptr ds:[9b76h], 8
        jmp short L_75D4
        nop
L_755C:
        mov word ptr [bp-2], 0
        mov word ptr ds:[9b76h], 1
        jmp short L_75D4
        nop
L_756A:
        cmp word ptr [bp-6], 5300h
        jne short L_75A6
        mov ax, word ptr ds:[98e0h]
        cmp word ptr [bp+6], ax
        jg short L_757C
        jmp L_7452
L_757C:
        mov word ptr [bp-4], ax
        jmp short L_7590
        nop
L_7582:
        mov si, word ptr [bp-4]
        add si, word ptr [bp+4]
        mov al, byte ptr [si+1]
        mov byte ptr [si], al
        inc word ptr [bp-4]
L_7590:
        mov ax, word ptr [bp+6]
        dec ax
        cmp ax, word ptr [bp-4]
        jg short L_7582
        mov si, word ptr [bp+6]
        mov bx, word ptr [bp+4]
        mov byte ptr [bx+si-1], 20h
        jmp short L_75C7
        nop
L_75A6:
        cmp word ptr [bp-6], 8
        jne short L_75DA
        cmp word ptr ds:[98e0h], 0
        jne short L_75B6
        jmp L_7452
L_75B6:
        call _FN_CIRCUIT_CGA_0767A
        dec word ptr ds:[98e0h]
        mov bx, word ptr [bp+4]
        mov si, word ptr ds:[98e0h]
        mov byte ptr [bx+si], 20h
L_75C7:
        push word ptr [bp+0ah]
        push word ptr [bp+8]
        push bx
        call _FN_CIRCUIT_CGA_09B70
        add sp, 6
L_75D4:
        call _FN_CIRCUIT_CGA_0767A
        jmp L_7452
L_75DA:
        cmp word ptr [bp-6], 20h
        jge short L_75E3
        jmp L_7452
L_75E3:
        cmp word ptr [bp-6], 7ah
        jle short L_75EC
        jmp L_7452
L_75EC:
        mov ax, word ptr ds:[98e0h]
        cmp word ptr [bp+6], ax
        jg short L_75F7
        jmp L_7452
L_75F7:
        call _FN_CIRCUIT_CGA_0767A
        cmp word ptr [bp-2], 0
        je short L_7622
        mov ax, word ptr [bp+6]
        sub ax, 2
        mov word ptr [bp-4], ax
        jmp short L_761A
        nop
L_760C:
        mov si, word ptr [bp-4]
        add si, word ptr [bp+4]
        mov al, byte ptr [si]
        mov byte ptr [si+1], al
        dec word ptr [bp-4]
L_761A:
        mov ax, word ptr ds:[98e0h]
        cmp word ptr [bp-4], ax
        jge short L_760C
L_7622:
        mov bx, word ptr [bp+4]
        mov si, word ptr ds:[98e0h]
        mov al, byte ptr [bp-6]
        mov byte ptr [bx+si], al
        mov ax, si
        cmp word ptr [bp+6], ax
        jle short L_75C7
        inc word ptr ds:[98e0h]
        jmp short L_75C7
_grp_aace91da ENDP
_TEXT ENDS
END
