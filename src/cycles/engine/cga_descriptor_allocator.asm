        .286
CYCLES_CGA_TEXT_0555 SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CYCLES_CGA_TEXT_0555
        EXTRN _grp_7d3b9038:FAR, _fatal_error:FAR, _g_b9ea:WORD
        ORG 04A42h
        PUBLIC _fn_cycles_cga_09f92
_fn_cycles_cga_09f92 PROC FAR
        push bp
        mov bp, sp
        sub sp, 8
        push ds
        push si
        push di
        mov ax, word ptr [bp + 6]
        shr ax, 1
        shr ax, 1
        mov word ptr [bp - 8], ax
        mov bx, word ptr [bp + 8]
        imul bx
        add ax, 10h
        mov cx, 4
        shr ax, cl
        inc ax
        mov bx, ax
        mov word ptr [bp - 6], ax
        push ax
        mov ax, 9E44h
        push ax
        call FAR PTR _grp_7d3b9038
        add sp, 4
        mov word ptr [bp - 2], dx
        mov ds, dx
        xor bx, bx
        mov ax, word ptr [bp - 8]
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
        mov bx, word ptr cs:[4B14h]
        mov word ptr [bp - 4], bx
        add ax, bx
        cmp ax, 52E6h
        jae SHORT L_CGA_A056
        mov word ptr cs:[4B14h], ax
        mov word ptr cs:[bx], 0
        mov ax, word ptr [bp - 2]
        mov word ptr cs:[bx + 2], ax
        lea ax, [bx + 1Ah]
        mov word ptr cs:[bx + 0Ah], ax
        mov word ptr cs:[bx + 0Ch], 0
        mov ax, word ptr [bp - 8]
        mov word ptr cs:[bx + 0Eh], ax
        mov word ptr cs:[bx + 14h], ax
        mov word ptr cs:[bx + 10h], 0
        mov ax, word ptr [bp + 8]
        mov word ptr cs:[bx + 12h], ax
        mov ax, word ptr [bp + 6]
        mov word ptr cs:[bx + 18h], ax
        mov cx, word ptr [bp + 8]
        mov ax, 10h
L_CGA_A03E:
        mov word ptr cs:[bx + 1Ah], ax
        add bx, 2
        add ax, word ptr [bp - 8]
        loop L_CGA_A03E
        mov dx, cs
        mov ax, word ptr [bp - 4]
        pop di
        pop si
        pop ds
        mov sp, bp
        pop bp
        retf
L_CGA_A056:
        mov ax, SEG _g_b9ea
        mov ds, ax
        mov ax, 9E20h
        push ax
        call FAR PTR _fatal_error
_fn_cycles_cga_09f92 ENDP
CYCLES_CGA_TEXT_0555 ENDS
        END
