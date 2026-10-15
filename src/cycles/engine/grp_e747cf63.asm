        EXTRN   _GRP_07DC1757:FAR, _GRP_E99C915A:FAR
        EXTRN   _GRP_E22A6934:FAR
_CSEG_CF63 SEGMENT PARA PUBLIC 'CODE'
        ASSUME  CS:_CSEG_CF63
        PUBLIC  _grp_e747cf63
_grp_e747cf63 PROC FAR
        push bp
        mov bp, sp
        sub sp, 0ah
        push di
        push si
        mov si, word ptr [bp + 0ch]
        mov ax, word ptr [bp + 8]
        mul word ptr [bp + 0ah]
        mov word ptr [bp - 2], ax
        mov word ptr [bp - 4], ax
        cmp word ptr [bp + 8], 0
        je L2C89
        cmp word ptr [bp + 0ah], 0
        jne L2C90
L2C89:
        mov ax, word ptr [bp - 4]
        jmp NEAR PTR L2E52
        nop
L2C90:
        test byte ptr [si + 6], 0ch
        je L2C99
        jmp NEAR PTR L2D3B
L2C99:
        mov bx, si
        sub bx, 0a608h
        mov cl, 3
        sar bx, cl
        mov ax, bx
        shl bx, 1
        add bx, ax
        shl bx, 1
        test byte ptr [bx - 22872], 1
        je L2CB5
        jmp NEAR PTR L2D3B
L2CB5:
        mov al, byte ptr [si + 7]
        cbw
        mov bx, ax
        test byte ptr [bx - 5a46h], 128
        jne L2D0A
        test word ptr [bp - 4], 1ffh
        jne L2D0A
        cmp word ptr [bp - 4], 0
        jne L2CD2
        jmp NEAR PTR L2D9E
L2CD2:
        cbw
        mov word ptr [bp - 0ah], ax
L2CD6:
        push word ptr [bp - 4]
        push word ptr [bp + 6]
        push word ptr [bp - 0ah]
        call FAR PTR _GRP_07DC1757
        add sp, 6
        mov di, ax
        or di, di
        jne L2CF0
        jmp NEAR PTR L2E33
L2CF0:
        cmp di, -1
        jne L2CF8
        jmp NEAR PTR L2E33
L2CF8:
        sub word ptr [bp - 4], di
        add word ptr [bp + 6], di
        cmp word ptr [bp - 4], 0
        jne L2D07
        jmp NEAR PTR L2D9E
L2D07:
        jmp SHORT L2CD6
        nop
L2D0A:
        dec word ptr [si + 2]
        js L2D1A
        mov bx, word ptr [si]
        inc word ptr [si]
        mov al, byte ptr ds:[bx]
        sub ah, ah
        jmp SHORT L2D23
        nop
L2D1A:
        push si
        call FAR PTR _GRP_E99C915A
        add sp, 2
L2D23:
        mov di, ax
        inc ax
        jne L2D2E
        sub ax, ax
        jmp NEAR PTR L2E52
        nop
L2D2E:
        mov bx, word ptr [bp + 6]
        inc word ptr [bp + 6]
        mov ax, di
        mov byte ptr ds:[bx], al
        dec word ptr [bp - 4]
L2D3B:
        test byte ptr [si + 6], 8
        je L2D44
        jmp NEAR PTR L2DCF
L2D44:
        mov bx, si
        sub bx, 0a608h
        mov cl, 3
        sar bx, cl
        mov ax, bx
        shl bx, 1
        add bx, ax
        shl bx, 1
        test byte ptr [bx - 22872], 1
        jne L2D60
        jmp NEAR PTR L2E0A
L2D60:
        jmp SHORT L2DCF
L2D62:
        cmp word ptr [bp - 4], 512
        jb L2DB4
        mov ax, word ptr [bp - 4]
        mov cl, 9
        shr ax, cl
        shl ax, cl
        mov word ptr [bp - 6], ax
        push ax
        push word ptr [bp + 6]
        mov al, byte ptr [si + 7]
        cbw
        push ax
        call FAR PTR _GRP_07DC1757
        add sp, 6
        mov di, ax
        or di, di
        je L2D91
        cmp di, -1
        jne L2DAC
L2D91:
        cmp di, -1
        jne L2D99
        jmp NEAR PTR L2E3B
L2D99:
        mov al, 16
L2D9B:
        or byte ptr [si + 6], al
L2D9E:
        mov ax, word ptr [bp - 2]
        sub ax, word ptr [bp - 4]
        sub dx, dx
        div word ptr [bp + 8]
        jmp NEAR PTR L2E52
L2DAC:
        sub word ptr [bp - 4], di
        add word ptr [bp + 6], di
        jmp SHORT L2DCF
L2DB4:
        push si
        call FAR PTR _GRP_E99C915A
        add sp, 2
        mov di, ax
        inc ax
        je L2D9E
        mov bx, word ptr [bp + 6]
        mov ax, di
        mov byte ptr ds:[bx], al
        inc word ptr [bp + 6]
        dec word ptr [bp - 4]
L2DCF:
        cmp word ptr [bp - 4], 0
        je L2D9E
        cmp word ptr [si + 2], 0
        je L2D62
        mov ax, word ptr [si + 2]
        sub ax, word ptr [bp - 4]
        sbb cx, cx
        and ax, cx
        add ax, word ptr [bp - 4]
        mov word ptr [bp - 6], ax
        push ax
        push word ptr [si]
        push word ptr [bp + 6]
        call FAR PTR _GRP_E22A6934
        add sp, 6
        mov ax, word ptr [bp - 6]
        add word ptr [si], ax
        add word ptr [bp + 6], ax
        sub word ptr [bp - 4], ax
        sub word ptr [si + 2], ax
        jmp SHORT L2DCF
        nop
L2E0A:
        cmp word ptr [bp - 4], 0
        je L2D9E
        mov al, byte ptr [si + 7]
        cbw
        mov word ptr [bp - 0ah], ax
L2E17:
        push word ptr [bp - 4]
        push word ptr [bp + 6]
        push word ptr [bp - 0ah]
        call FAR PTR _GRP_07DC1757
        add sp, 6
        mov di, ax
        or di, di
        je L2E33
        cmp di, -1
        jne L2E40
L2E33:
        cmp di, -1
        je L2E3B
        jmp NEAR PTR L2D99
L2E3B:
        mov al, 32
        jmp NEAR PTR L2D9B
L2E40:
        sub word ptr [bp - 4], di
        add word ptr [bp + 6], di
        cmp word ptr [bp - 4], 0
        jne L2E4F
        jmp NEAR PTR L2D9E
L2E4F:
        jmp SHORT L2E17
        nop
L2E52:
        pop si
        pop di
        mov sp, bp
        pop bp
        retf
_grp_e747cf63 ENDP
_CSEG_CF63 ENDS
        END
