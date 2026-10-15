        EXTRN   _FN_CYCLES_CGA_0763A:FAR, _GRP_E76F1CA2:FAR
        EXTRN   _GRP_7A614CEF:FAR, _GRP_9D44A3BF:FAR
        EXTRN   _FN_CYCLES_CGA_0563E:FAR, _GRP_7DE44506:FAR
        EXTRN   _FN_CYCLES_CGA_10948:FAR, _FN_CYCLES_CGA_072EE:FAR
        EXTRN   _GRP_0F3D9549:FAR, _FN_CYCLES_CGA_06412:FAR
_CSEG_15C8 SEGMENT PARA PUBLIC 'CODE'
        ASSUME  CS:_CSEG_15C8
        PUBLIC  _grp_5c8b15c8
_grp_5c8b15c8 PROC FAR
        push bp
        mov bp, sp
        sub sp, 0eh
        push word ptr ds:[457ch]
        push word ptr ds:[457ah]
        call FAR PTR _FN_CYCLES_CGA_0763A
        add sp, 4
        sub ax, ax
        push ax
        call FAR PTR _GRP_E76F1CA2
        add sp, 2
        mov ax, 320
        push ax
        push word ptr ds:[13ch]
        push word ptr ds:[13ah]
        call FAR PTR _GRP_7A614CEF
        add sp, 6
        push dx
        push ax
        call FAR PTR _GRP_9D44A3BF
        add sp, 4
        mov ax, 325
        push ax
        push word ptr ds:[13ch]
        push word ptr ds:[13ah]
        call FAR PTR _GRP_7A614CEF
        add sp, 6
        push dx
        push ax
        call FAR PTR _GRP_9D44A3BF
        add sp, 4
        mov ax, 14ah
        push ax
        push word ptr ds:[13ch]
        push word ptr ds:[13ah]
        call FAR PTR _GRP_7A614CEF
        add sp, 6
        push dx
        push ax
        call FAR PTR _GRP_9D44A3BF
        add sp, 4
        push word ptr ds:[0b9ech]
        push word ptr ds:[0b9eah]
        call FAR PTR _FN_CYCLES_CGA_0763A
        add sp, 4
        sub ax, ax
        push ax
        call FAR PTR _GRP_E76F1CA2
        add sp, 2
        mov word ptr [bp - 6], 0
        jmp SHORT LC15D
        nop
LC15A:
        inc word ptr [bp - 6]
LC15D:
        cmp word ptr [bp - 6], 4
        jge LC19A
        mov ax, 1
        cwd
        push dx
        push ax
        call FAR PTR _FN_CYCLES_CGA_0563E
        add sp, 4
        push word ptr [bp - 6]
        les bx, dword ptr ds:[457ah]
        push word ptr es:[bx + 2]
        push word ptr es:[bx]
        call FAR PTR _GRP_7DE44506
        add sp, 6
        call FAR PTR _FN_CYCLES_CGA_10948
        mov word ptr [bp - 2], ax
        or ax, ax
        je LC15A
LC193:
        mov ax, word ptr [bp - 2]
        mov sp, bp
        pop bp
        retf
LC19A:
        mov ax, 14fh
        push ax
        push word ptr ds:[13ch]
        push word ptr ds:[13ah]
        call FAR PTR _GRP_7A614CEF
        add sp, 6
        mov word ptr [bp - 0eh], ax
        mov word ptr [bp - 0ch], dx
        les bx, dword ptr [bp - 0eh]
        mov ax, word ptr es:[bx + 0ah]
        mov word ptr [bp - 8], ax
        mov ax, word ptr es:[bx + 8]
        add ax, 3
        mov word ptr [bp - 0ah], ax
        mov word ptr [bp - 4], 0
        jmp SHORT LC1D4
        nop
LC1D0:
        add word ptr [bp - 4], 2
LC1D4:
        mov ax, word ptr [bp - 0ah]
        cmp word ptr [bp - 4], ax
        jge LC20C
        mov ax, 1
        cwd
        push dx
        push ax
        call FAR PTR _FN_CYCLES_CGA_072EE
        add sp, 4
        push word ptr [bp - 8]
        push word ptr [bp - 4]
        push word ptr [bp - 0ch]
        push word ptr [bp - 0eh]
        call FAR PTR _GRP_0F3D9549
        add sp, 8
        call FAR PTR _FN_CYCLES_CGA_06412
        mov word ptr [bp - 2], ax
        or ax, ax
        je LC1D0
        jmp SHORT LC193
LC20C:
        mov ax, 2dh
        cwd
        push dx
        push ax
        call FAR PTR _FN_CYCLES_CGA_0563E
        add sp, 4
        call FAR PTR _FN_CYCLES_CGA_10948
        mov sp, bp
        pop bp
        retf
_grp_5c8b15c8 ENDP
_CSEG_15C8 ENDS
        END
