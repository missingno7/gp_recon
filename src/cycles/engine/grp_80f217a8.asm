        EXTRN   _GRP_0C93649C:FAR, _GRP_9A209221:FAR
        EXTRN   _GRP_1A9A5E95:FAR, _GRP_A2E49123:FAR
        EXTRN   _GRP_77E01831:FAR, _GRP_183E807A:FAR
        EXTRN   _GRP_07DC1757:FAR
_CSEG_17A8 SEGMENT PARA PUBLIC 'CODE'
        EXTRN   _GRP_3DE068C9:NEAR
        ASSUME  CS:_CSEG_17A8
        PUBLIC  _grp_80f217a8
_grp_80f217a8 PROC FAR
        push bp
        mov bp, sp
        sub sp, 22
        push di
        push si
        mov si, word ptr [bp + 6]
        mov word ptr [bp - 2], 0
        test byte ptr [si + 6], 131
        je L37A8
        cmp word ptr [bp + 0ch], 2
        jg L37A8
        cmp word ptr [bp + 0ch], 0
        jge L37B2
L37A8:
        mov word ptr ds:[0a5abh], 22
        jmp SHORT L382B
        nop
        nop
L37B2:
        mov al, byte ptr [si + 7]
        cbw
        mov word ptr [bp - 18], ax
        mov ax, si
        sub ax, 0a608h
        mov cl, 3
        sar ax, cl
        mov cx, ax
        shl ax, 1
        add ax, cx
        shl ax, 1
        add ax, 0a6a8h
        mov word ptr [bp - 20], ax
        and byte ptr [si + 6], 0efh
        test byte ptr [si + 6], 130
        je L3832
        cmp word ptr [bp + 0ch], 1
        jne L37F4
        push si
        call FAR PTR _GRP_0C93649C
        add sp, 2
        add word ptr [bp + 8], ax
        adc word ptr [bp + 0ah], dx
L37EF:
        mov word ptr [bp + 0ch], 0
L37F4:
        push si
        call FAR PTR _GRP_9A209221
        add sp, 2
        test byte ptr [si + 6], 128
        je L3807
        and byte ptr [si + 6], 0fch
L3807:
        push word ptr [bp + 0ch]
        push word ptr [bp + 0ah]
        push word ptr [bp + 8]
        push word ptr [bp - 18]
        call FAR PTR _GRP_1A9A5E95
        add sp, 8
        cmp ax, 0ffffh
        je L3823
        jmp NEAR PTR L3A36
L3823:
        cmp dx, -1
        je L382B
        jmp NEAR PTR L3A36
L382B:
        mov ax, 0ffffh
        jmp NEAR PTR L3A38
        nop
L3832:
        test byte ptr [si + 6], 0ch
        jne L385A
        mov bx, si
        sub bx, 0a608h
        mov cl, 3
        sar bx, cl
        mov ax, bx
        shl bx, 1
        add bx, ax
        shl bx, 1
        test byte ptr [bx - 22872], 1
        jne L385A
        push si
        call _GRP_3DE068C9
        add sp, 2
        jmp SHORT L386A
L385A:
        mov bx, word ptr [bp - 20]
        test byte ptr ds:[bx], 4
        je L386A
        mov word ptr [bp - 2], 1
        and byte ptr ds:[bx], 0fbh
L386A:
        mov ax, 1
        push ax
        sub ax, ax
        push ax
        push ax
        push word ptr [bp - 18]
        call FAR PTR _GRP_1A9A5E95
        add sp, 8
        mov word ptr [bp - 0ah], ax
        mov word ptr [bp - 8], dx
        cmp ax, 0ffffh
        jne L388D
        cmp dx, -1
        je L382B
L388D:
        cmp word ptr [bp + 0ch], 1
        jne L38B8
        mov ax, word ptr [bp + 8]
        or ax, word ptr [bp + 0ah]
        jne L38A4
        cmp word ptr [bp - 2], 0
        jne L38A4
        jmp NEAR PTR L3A36
L38A4:
        mov ax, word ptr [si + 2]
        cwd
        mov cx, word ptr [bp - 0ah]
        mov bx, word ptr [bp - 8]
        sub cx, ax
        sbb bx, dx
        add word ptr [bp + 8], cx
        adc word ptr [bp + 0ah], bx
L38B8:
        cmp word ptr [bp + 0ch], 2
        je L38D8
        mov bx, word ptr [bp - 20]
        test byte ptr ds:[bx], 8
        jne L38D8
        mov ax, word ptr [bp - 0ah]
        mov dx, word ptr [bp - 8]
        cmp word ptr [bp + 0ah], dx
        jl L3938
        jg L38D8
        cmp word ptr [bp + 8], ax
        jbe L3938
L38D8:
        mov ax, 2
        push ax
        sub ax, ax
        push ax
        push ax
        push word ptr [bp - 18]
        call FAR PTR _GRP_1A9A5E95
        add sp, 8
        mov word ptr [bp - 16], ax
        mov word ptr [bp - 0eh], dx
        sub ax, ax
        push ax
        push word ptr [bp - 8]
        push word ptr [bp - 0ah]
        push word ptr [bp - 18]
        call FAR PTR _GRP_1A9A5E95
        add sp, 8
        cmp word ptr [bp + 0ch], 2
        jne L3917
        mov ax, word ptr [bp - 16]
        mov dx, word ptr [bp - 0eh]
        add word ptr [bp + 8], ax
        adc word ptr [bp + 0ah], dx
L3917:
        mov ax, word ptr [bp - 16]
        mov dx, word ptr [bp - 0eh]
        cmp word ptr [bp + 0ah], dx
        jg L3932
        jl L3929
        cmp word ptr [bp + 8], ax
        ja L3932
L3929:
        mov bx, word ptr [bp - 20]
        and byte ptr ds:[bx], 0f7h
        jmp SHORT L3938
        nop
L3932:
        mov bx, word ptr [bp - 20]
        or byte ptr ds:[bx], 8
L3938:
        mov ax, word ptr [bx + 2]
        mov word ptr [bp - 22], ax
        cmp word ptr [bp + 0ah], 0
        jge L3947
        jmp NEAR PTR L37A8
L3947:
        test byte ptr ds:[bx], 8
        je L394F
        jmp NEAR PTR L37EF
L394F:
        test byte ptr [si + 6], 4
        je L3958
        jmp NEAR PTR L37EF
L3958:
        cwd
        push dx
        push ax
        push word ptr [bp + 0ah]
        push word ptr [bp + 8]
        call FAR PTR _GRP_A2E49123
        mov di, ax
        cwd
        mov cx, word ptr [bp + 8]
        mov bx, word ptr [bp + 0ah]
        sub cx, ax
        sbb bx, dx
        mov word ptr [bp - 6], cx
        mov word ptr [bp - 4], bx
        cmp word ptr [si + 2], 0
        je L39D8
        cmp word ptr [bp - 2], 0
        jne L39D8
        mov ax, word ptr [bp - 22]
        cwd
        push dx
        push ax
        cwd
        push dx
        push ax
        mov ax, word ptr [bp - 0ah]
        mov dx, word ptr [bp - 8]
        sub ax, 1
        sbb dx, 0
        push dx
        push ax
        call FAR PTR _GRP_77E01831
        push dx
        push ax
        call FAR PTR _GRP_183E807A
        cmp ax, word ptr [bp - 6]
        jne L39D8
        cmp dx, word ptr [bp - 4]
        jne L39D8
        mov ax, word ptr [si]
        sub ax, word ptr [si + 4]
        add word ptr [si + 2], ax
L39BA:
        mov bx, word ptr [bp - 18]
        test byte ptr [bx - 5a46h], 128
        je L3A2C
        test byte ptr [bx - 5a46h], 4
        je L39D0
        or di, di
        je L39D0
        inc di
L39D0:
        mov ax, word ptr [si + 4]
        mov word ptr [si], ax
        jmp SHORT L3A23
        nop
L39D8:
        sub ax, ax
        push ax
        push word ptr [bp - 4]
        push word ptr [bp - 6]
        push word ptr [bp - 18]
        call FAR PTR _GRP_1A9A5E95
        add sp, 8
        cmp ax, 0ffffh
        jne L39F9
        cmp dx, -1
        jne L39F9
        jmp NEAR PTR L37A8
L39F9:
        mov bx, word ptr [bp - 20]
        push word ptr [bx + 2]
        push word ptr [si + 4]
        push word ptr [bp - 18]
        call FAR PTR _GRP_07DC1757
        add sp, 6
        mov word ptr [si + 2], ax
        inc ax
        jne L39BA
        jmp NEAR PTR L37A8
L3A16:
        mov bx, word ptr [si]
        cmp byte ptr ds:[bx], 0ah
        jne L3A1E
        dec di
L3A1E:
        dec word ptr [si + 2]
        inc word ptr [si]
L3A23:
        mov ax, di
        dec di
        or ax, ax
        jle L3A36
        jmp SHORT L3A16
L3A2C:
        mov ax, word ptr [si + 4]
        add ax, di
        mov word ptr [si], ax
        sub word ptr [si + 2], di
L3A36:
        sub ax, ax
L3A38:
        pop si
        pop di
        mov sp, bp
        pop bp
        retf
_grp_80f217a8 ENDP
_CSEG_17A8 ENDS
        END
