        .286
CYCLES_TANDY_TEXT_0555 SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CYCLES_TANDY_TEXT_0555
        EXTRN _grp_7d3b9038:FAR, _fatal_error:FAR, _g_b9ea:WORD
        ORG 045CAh
        PUBLIC _fn_cycles_tandy_09b1a
_fn_cycles_tandy_09b1a PROC FAR
        push bp
        mov bp, sp
        push ds
        push si
        push di
        sub sp, 8
        mov ax, word ptr [bp + 6]
        shr ax, 1
        mov word ptr [bp - 0Eh], ax
        mov bx, word ptr [bp + 8]
        imul bx
        add ax, 10h
        mov cx, 4
        shr ax, cl
        inc ax
        mov bx, ax
        mov word ptr [bp - 0Ch], ax
        push ax
        mov ax, 9E4Ch
        push ax
        call FAR PTR _grp_7d3b9038
        add sp, 4
        mov word ptr [bp - 8], dx
        mov ds, dx
        xor bx, bx
        mov ax, word ptr [bp - 0Eh]
        mov word ptr [bx], ax
        mov ax, word ptr [bp + 8]
        mov word ptr [bx + 2], ax
        xor ax, ax
        mov word ptr [bx + 8], ax
        mov word ptr [bx + 0Ah], ax
        mov word ptr [bx + 4], ax
        mov word ptr [bx + 6], ax
        mov ax, 0Dh
        add ax, word ptr [bp + 8]
        shl ax, 1
        mov bx, word ptr cs:[469Bh]
        mov word ptr [bp - 0Ah], bx
        add ax, bx
        cmp ax, 4E6Dh
        jae SHORT L_TANDY_9BDD
        mov word ptr cs:[469Bh], ax
        mov word ptr cs:[bx], 0
        mov ax, word ptr [bp - 8]
        mov word ptr cs:[bx + 2], ax
        lea ax, [bx + 1Ah]
        mov word ptr cs:[bx + 0Ah], ax
        mov word ptr cs:[bx + 0Ch], 0
        mov ax, word ptr [bp - 0Eh]
        mov word ptr cs:[bx + 0Eh], ax
        mov word ptr cs:[bx + 14h], ax
        mov word ptr cs:[bx + 10h], 0
        mov ax, word ptr [bp + 8]
        mov word ptr cs:[bx + 12h], ax
        mov ax, word ptr [bp + 6]
        mov word ptr cs:[bx + 18h], ax
        mov cx, word ptr [bp + 8]
        mov ax, 10h
L_TANDY_9BC4:
        mov word ptr cs:[bx + 1Ah], ax
        add bx, 2
        add ax, word ptr [bp - 0Eh]
        loop L_TANDY_9BC4
        mov dx, cs
        mov ax, word ptr [bp - 0Ah]
        add sp, 8
        pop di
        pop si
        pop ds
        pop bp
        retf
L_TANDY_9BDD:
        mov ax, SEG _g_b9ea
        mov ds, ax
        mov ax, 9E28h
        push ax
        call FAR PTR _fatal_error
_fn_cycles_tandy_09b1a ENDP
CYCLES_TANDY_TEXT_0555 ENDS
        END
