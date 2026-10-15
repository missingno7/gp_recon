        EXTRN   _GRP_09C6B296:FAR, _GRP_63468620:FAR, _GRP_E22A6934:FAR, _CYCLES_MAIN_TEXT:FAR
_CSEG_BF4E SEGMENT PARA PUBLIC 'CODE'
        ASSUME  CS:_CSEG_BF4E
        PUBLIC  _grp_599ebf4e
_grp_599ebf4e PROC FAR
        push bp
        mov bp, sp
        sub sp, 8
        push di
        push si
        mov si, word ptr [bp + 6]
        mov di, word ptr [bp + 0ch]
        mov ax, word ptr [bp + 8]
        mul word ptr [bp + 0ah]
        mov word ptr [bp - 2], ax
        mov word ptr [bp - 4], ax
        cmp word ptr [bp + 8], 0
        je L2E7E
        cmp word ptr [bp + 0ah], 0
        jne L2E84
L2E7E:
        sub ax, ax
        jmp NEAR PTR L2F98
        nop
L2E84:
        test byte ptr [di + 6], 0ch
        jne L2EF3
        mov bx, di
        sub bx, 0a608h
        mov cl, 3
        sar bx, cl
        mov ax, bx
        shl bx, 1
        add bx, ax
        shl bx, 1
        test byte ptr [bx - 22872], 1
        jne L2EF3
        test word ptr [bp - 4], 1ffh
        jne L2ECC
        push word ptr [bp - 4]
        push si
        mov al, byte ptr [di + 7]
        cbw
        push ax
        call FAR PTR _GRP_09C6B296
        add sp, 6
        mov word ptr [bp - 8], ax
        cmp ax, 0ffffh
        je L2E7E
L2EC3:
        sub dx, dx
        div word ptr [bp + 8]
        jmp NEAR PTR L2F98
        nop
L2ECC:
        dec word ptr [di + 2]
        js L2EDC
        mov al, byte ptr [si]
        mov bx, word ptr [di]
        inc word ptr [di]
        mov byte ptr ds:[bx], al
        jmp SHORT L2EE9
        nop
L2EDC:
        push di
        mov al, byte ptr [si]
        cbw
        push ax
        call FAR PTR _GRP_63468620
        add sp, 4
L2EE9:
        test byte ptr [di + 6], 32
        jne L2E7E
        inc si
        dec word ptr [bp - 4]
L2EF3:
        test byte ptr [di + 6], 8
        jne L2F3B
        mov bx, di
        sub bx, 0a608h
        mov cl, 3
        sar bx, cl
        mov ax, bx
        shl bx, 1
        add bx, ax
        shl bx, 1
        test byte ptr [bx - 22872], 1
        je L2F72
        jmp SHORT L2F3B
L2F14:
        dec word ptr [di + 2]
        js L2F24
        mov al, byte ptr [si]
        mov bx, word ptr [di]
        inc word ptr [di]
        mov byte ptr ds:[bx], al
        jmp SHORT L2F31
        nop
L2F24:
        push di
        mov al, byte ptr [si]
        cbw
        push ax
        call FAR PTR _GRP_63468620
        add sp, 4
L2F31:
        test byte ptr [di + 6], 32
        jne L2F8E
        inc si
        dec word ptr [bp - 4]
L2F3B:
        cmp word ptr [bp - 4], 0
        je L2F8E
        cmp word ptr [di + 2], 0
        je L2F14
        mov ax, word ptr [di + 2]
        sub ax, word ptr [bp - 4]
        sbb cx, cx
        and ax, cx
        add ax, word ptr [bp - 4]
        mov word ptr [bp - 6], ax
        push ax
        push si
        push word ptr [di]
        call FAR PTR _GRP_E22A6934
        add sp, 6
        mov ax, word ptr [bp - 6]
        add word ptr [di], ax
        add si, ax
        sub word ptr [bp - 4], ax
        sub word ptr [di + 2], ax
        jmp SHORT L2F3B
L2F72:
        push word ptr [bp - 4]
        push si
        mov al, byte ptr [di + 7]
        cbw
        push ax
        call FAR PTR _GRP_09C6B296
        add sp, 6
        mov word ptr [bp - 8], ax
        cmp ax, 0ffffh
        je L2F8E
        sub word ptr [bp - 4], ax
L2F8E:
        mov ax, word ptr [bp - 2]
        sub ax, word ptr [bp - 4]
        jmp NEAR PTR L2EC3
        nop
L2F98:
        pop si
        pop di
        mov sp, bp
        pop bp
        retf
_grp_599ebf4e ENDP
_CSEG_BF4E ENDS
        END
