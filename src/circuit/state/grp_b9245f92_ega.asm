_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_0F28E:NEAR
        EXTRN _GRP_0376AEFE:NEAR
        EXTRN _GRP_1A9A5E95:NEAR
        EXTRN _GRP_2DE0858F:NEAR
        EXTRN _GRP_58B528F2:NEAR
        EXTRN _GRP_B6CBA47C:NEAR
        PUBLIC _grp_b9245f92
_grp_b9245f92 PROC NEAR
        push bp
        mov bp, sp
        sub sp, 4
        push si
        mov word ptr ds:[96d0h], 0ffffh
        mov ax, 480h
        cwd
        push dx
        push ax
        mov ax, word ptr ds:[990eh]
        dec ax
        cwd
        push dx
        push ax
        call _GRP_B6CBA47C
        mov word ptr ds:[98ech], ax
        mov word ptr ds:[98eeh], dx
        cmp word ptr ds:[990eh], 3
        jne short L_34A8
        jmp L_355C
L_34A8:
        mov ax, 90h
        cwd
        push dx
        push ax
        mov ax, word ptr ds:[288h]
        cwd
        push dx
        push ax
        call _GRP_B6CBA47C
        add word ptr ds:[98ech], ax
        adc word ptr ds:[98eeh], dx
        jmp L_355C
L_34C2:
        mov ax, 180h
        push ax
        mov ax, 8102h
        push ax
        push word ptr [bp+4]
        call _GRP_0376AEFE
        add sp, 6
        mov word ptr [bp-4], ax
        mov word ptr [bp-2], 0
L_34DB:
        mov ax, 12h
        imul word ptr [bp-2]
        mov si, ax
        mov byte ptr [si-64eah], 0
        mov word ptr [si-64deh], 0
        mov word ptr [si-64dch], 0ffffh
        mov word ptr [si-64dah], 0ffffh
        inc word ptr [bp-2]
        cmp word ptr [bp-2], 8
        jl short L_34DB
        mov word ptr [bp-2], 0
L_3508:
        mov ax, 90h
        push ax
        mov ax, 9b16h
        push ax
        push word ptr [bp-4]
        call _GRP_2DE0858F
        add sp, 6
        inc word ptr [bp-2]
        cmp word ptr [bp-2], 10h
        jl short L_3508
        mov word ptr [bp-2], 0
L_3527:
        mov ax, 12h
        imul word ptr [bp-2]
        mov bx, ax
        sub ax, ax
        mov word ptr [bx-64dah], ax
        mov word ptr [bx-64dch], ax
        inc word ptr [bp-2]
        cmp word ptr [bp-2], 8
        jl short L_3527
        mov ax, 90h
        push ax
        mov ax, 9b16h
        push ax
        push word ptr [bp-4]
        call _GRP_2DE0858F
        add sp, 6
        push word ptr [bp-4]
        call _FN_CIRCUIT_EGA_0F28E
        add sp, 2
L_355C:
        mov ax, 8002h
        push ax
        push word ptr [bp+4]
        call _GRP_0376AEFE
        add sp, 4
        mov word ptr [bp-4], ax
        or ax, ax
        jg short L_3573
        jmp L_34C2
L_3573:
        sub ax, ax
        push ax
        push word ptr ds:[98eeh]
        push word ptr ds:[98ech]
        push word ptr [bp-4]
        call _GRP_1A9A5E95
        add sp, 8
        mov ax, 90h
        push ax
        mov ax, 9b16h
        push ax
        push word ptr [bp-4]
        call _GRP_58B528F2
        add sp, 6
        push word ptr [bp-4]
        call _FN_CIRCUIT_EGA_0F28E
        add sp, 2
        mov word ptr [bp-2], 0
L_35A6:
        mov ax, 12h
        imul word ptr [bp-2]
        add ax, 9b16h
        mov bx, word ptr [bp-2]
        shl bx, 1
        mov word ptr [bx-6710h], ax
        inc word ptr [bp-2]
        cmp word ptr [bp-2], 8
        jl short L_35A6
        pop si
        mov sp, bp
        pop bp
        ret
_grp_b9245f92 ENDP
_TEXT ENDS
END
