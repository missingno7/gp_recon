_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_03302:NEAR
        PUBLIC _grp_0502459c
_grp_0502459c PROC NEAR
        push bp
        mov bp, sp
        sub sp, 6
        push si
        cmp word ptr ds:[96aeh], 0
        jl short initial_loop
        jg short set_flag
        cmp word ptr ds:[96ach], 0BB8h
        jbe short initial_loop
set_flag:
        mov word ptr ds:[78cch], 1
initial_loop:
        mov word ptr [bp-4], 0
init_loop:
        mov si, word ptr [bp-4]
        shl si, 1
        mov ax, word ptr [si+7404h]
        sub ax, 48h
        shr ax, 1
        add ax, 9
        mov word ptr [si+0a16h], ax
        inc word ptr [bp-4]
        cmp word ptr [bp-4], 14h
        jle short init_loop
        mov word ptr [bp-4], 6Fh
        mov word ptr [bp-6], 27h
        jmp short outer_test1
        nop
body1:
        mov bx, word ptr [bp-6]
        shl bx, 1
        mov word ptr [bx-6456h], 0
cmp_prev1:
        cmp word ptr [bp-2], -1
        jne short assign1
        mov si, word ptr [bp-6]
        shl si, 1
        mov ax, word ptr [si-63fch]
        mov word ptr [si-63feh], ax
        jmp short decrement1
assign1:
        mov bx, word ptr [bp-6]
        shl bx, 1
        mov ax, word ptr [bp-2]
        mov word ptr [bx-63feh], ax
decrement1:
        dec word ptr [bp-4]
        dec word ptr [bp-6]
outer_test1:
        cmp word ptr [bp-4], 48h
        jl short phase2
        mov ax, 28h
        push ax
        push word ptr [bp-4]
        mov ax, 7404h
        push ax
        call _FN_CIRCUIT_CGA_03302
        add sp, 6
        mov word ptr [bp-2], ax
        or ax, ax
        jle short body1
        mov bx, word ptr [bp-6]
        shl bx, 1
        mov word ptr [bx-6456h], 0FFFFh
        jmp short cmp_prev1
        nop
phase2:
        mov word ptr [bp-4], 0Bh
        mov word ptr [bp-6], 0
        jmp short outer_test2
body2:
        mov bx, word ptr [bp-6]
        shl bx, 1
        mov word ptr [bx-63aah], 0
cmp_prev2:
        cmp word ptr [bp-2], -1
        jne short assign2
        mov si, word ptr [bp-6]
        shl si, 1
        mov ax, word ptr [si-636ch]
        mov word ptr [si-636ah], ax
        jmp short increment2
assign2:
        mov bx, word ptr [bp-6]
        shl bx, 1
        mov ax, word ptr [bp-2]
        mov word ptr [bx-636ah], ax
increment2:
        inc word ptr [bp-4]
        inc word ptr [bp-6]
outer_test2:
        cmp word ptr [bp-4], 16h
        jg short done
        mov ax, 14h
        push ax
        push word ptr [bp-4]
        mov ax, 0a16h
        push ax
        call _FN_CIRCUIT_CGA_03302
        add sp, 6
        mov word ptr [bp-2], ax
        or ax, ax
        jle short body2
        mov bx, word ptr [bp-6]
        shl bx, 1
        mov word ptr [bx-63aah], 0FFFFh
        jmp short cmp_prev2
        nop
done:
        pop si
        mov sp, bp
        pop bp
        ret
_grp_0502459c ENDP
_TEXT ENDS
END
