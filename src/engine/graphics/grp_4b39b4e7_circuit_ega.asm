.8086
CIRCUIT_MAIN_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CIRCUIT_MAIN_TEXT
        PUBLIC _grp_4b39b4e7
_grp_4b39b4e7 PROC NEAR
        push bp
        mov bp, sp
        sub sp, 34h
        push di
        push si
        mov word ptr [bp-6], 0
circuit_ega_copy_loop:
        mov si, word ptr [bp-6]
        shl si, 1
        mov di, word ptr [bp-6]
        mov cl, 2
        shl di, cl
        add di, bp
        sub di, 30h
        mov ax, word ptr [si+0D62h]
        mov word ptr [di+2], ax
        mov ax, word ptr [si+0D4Eh]
        mov word ptr [di], ax
        inc word ptr [bp-6]
        cmp word ptr [bp-6], 0Ah
        jl short circuit_ega_copy_loop
        mov word ptr [bp-6], 0
circuit_ega_outer_init:
        mov si, word ptr [bp-6]
        shl si, 1
        shl si, 1
        mov ax, word ptr [bp+si-30h]
        mov dx, word ptr [bp+si-2Eh]
        mov word ptr [bp-4], ax
        mov word ptr [bp-2], dx
        mov bx, word ptr [bp-6]
        shl bx, 1
        mov ax, word ptr [bp-6]
        mov word ptr [bx-694Ch], ax
        mov word ptr [bp-8], 0
circuit_ega_inner_init:
        mov si, word ptr [bp-8]
        shl si, 1
        shl si, 1
        mov ax, word ptr [bp+si-30h]
        mov dx, word ptr [bp+si-2Eh]
        mov word ptr [bp-34h], ax
        mov word ptr [bp-32h], dx
        mov ax, word ptr [bp-4]
        mov dx, word ptr [bp-2]
        cmp word ptr [bp-32h], dx
        jl short circuit_ega_inner_next
        jg short circuit_ega_candidate
        cmp word ptr [bp-34h], ax
        jbe short circuit_ega_inner_next
circuit_ega_candidate:
        mov ax, word ptr [bp-34h]
        mov dx, word ptr [bp-32h]
        mov word ptr [bp-4], ax
        mov word ptr [bp-2], dx
        mov bx, word ptr [bp-6]
        shl bx, 1
        mov ax, word ptr [bp-8]
        mov word ptr [bx-694Ch], ax
circuit_ega_inner_next:
        inc word ptr [bp-8]
        cmp word ptr [bp-8], 0Ah
        jl short circuit_ega_inner_init
        mov bx, word ptr [bp-6]
        shl bx, 1
        mov si, word ptr [bx-694Ch]
        shl si, 1
        shl si, 1
        mov word ptr [bp+si-30h], 0FFFFh
        mov word ptr [bp+si-2Eh], 0FFFFh
        inc word ptr [bp-6]
        cmp word ptr [bp-6], 0Ah
        jge short circuit_ega_finish
        jmp circuit_ega_outer_init
circuit_ega_finish:
        pop si
        pop di
        mov sp, bp
        pop bp
        ret
_grp_4b39b4e7 ENDP
CIRCUIT_MAIN_TEXT ENDS
        END
