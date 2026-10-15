        EXTRN   _FN_CYCLES_CGA_04FD6:FAR, _GRP_09C6B296:FAR, _GRP_1A9A5E95:FAR, _CYCLES_MAIN_TEXT:FAR
_CSEG_8620 SEGMENT PARA PUBLIC 'CODE'
        EXTRN   _GRP_3DE068C9:NEAR
        ASSUME  CS:_CSEG_8620
        PUBLIC  _grp_63468620
_grp_63468620 PROC FAR
        push bp
        mov bp, sp
        sub sp, 8
        push di
        push si
        mov si, word ptr [bp + 8]
        mov al, byte ptr [si + 7]
        cbw
        mov word ptr [bp - 6], ax
        mov ax, si
        sub ax, 0a608h
        mov cl, 3
        sar ax, cl
        mov cx, ax
        shl ax, 1
        add ax, cx
        shl ax, 1
        add ax, 0a6a8h
        mov word ptr [bp - 8], ax
        test byte ptr [si + 6], 131
        je L30D7
        test byte ptr [si + 6], 64
        je L30E2
L30D7:
        or byte ptr [si + 6], 32
        mov ax, 0ffffh
        jmp NEAR PTR L31F9
        nop
L30E2:
        test byte ptr [si + 6], 1
        jne L30D7
        or byte ptr [si + 6], 2
        and byte ptr [si + 6], 0efh
        sub ax, ax
        mov word ptr [si + 2], ax
        mov di, ax
        mov word ptr [bp - 4], di
        test byte ptr [si + 6], 0ch
        jne L3161
        mov bx, si
        sub bx, 0a608h
        mov cl, 3
        sar bx, cl
        mov ax, bx
        shl bx, 1
        add bx, ax
        shl bx, 1
        test byte ptr [bx - 22872], 1
        jne L3161
        cmp si, 0a610h
        je L3125
        cmp si, 0a618h
        jne L315A
L3125:
        push word ptr [bp - 6]
        call FAR PTR _FN_CYCLES_CGA_04FD6
        add sp, 2
        or ax, ax
        jne L3161
        inc word ptr ds:[0a606h]
        cmp si, 0a610h
        jne L3144
        mov ax, 0b58ch
        jmp SHORT L3147
        nop
L3144:
        mov ax, 0cd32h
L3147:
        mov word ptr [si + 4], ax
        mov word ptr [si], ax
        mov bx, word ptr [bp - 8]
        mov word ptr [bx + 2], 512
        mov byte ptr ds:[bx], 1
        jmp SHORT L3161
        nop
L315A:
        push si
        call _GRP_3DE068C9
        add sp, 2
L3161:
        test byte ptr [si + 6], 8
        jne L3180
        mov bx, si
        sub bx, 0a608h
        mov cl, 3
        sar bx, cl
        mov ax, bx
        shl bx, 1
        add bx, ax
        shl bx, 1
        test byte ptr [bx - 22872], 1
        je L31D4
L3180:
        mov di, word ptr [si]
        sub di, word ptr [si + 4]
        mov ax, word ptr [si + 4]
        inc ax
        mov word ptr [si], ax
        mov bx, word ptr [bp - 8]
        mov ax, word ptr [bx + 2]
        dec ax
        mov word ptr [si + 2], ax
        or di, di
        jle L31AE
        push di
        push word ptr [si + 4]
        push word ptr [bp - 6]
        call FAR PTR _GRP_09C6B296
        add sp, 6
        mov word ptr [bp - 4], ax
        jmp SHORT L31C9
        nop
L31AE:
        mov bx, word ptr [bp - 6]
        test byte ptr [bx - 5a46h], 32
        je L31C9
        mov ax, 2
        push ax
        sub ax, ax
        push ax
        push ax
        push bx
        call FAR PTR _GRP_1A9A5E95
        add sp, 8
L31C9:
        mov bx, word ptr [si + 4]
        mov al, byte ptr [bp + 6]
        mov byte ptr ds:[bx], al
        jmp SHORT L31EC
        nop
L31D4:
        mov di, 1
        mov ax, di
        push ax
        lea ax, [bp + 6]
        push ax
        push word ptr [bp - 6]
        call FAR PTR _GRP_09C6B296
        add sp, 6
        mov word ptr [bp - 4], ax
L31EC:
        cmp word ptr [bp - 4], di
        je L31F4
        jmp NEAR PTR L30D7
L31F4:
        mov al, byte ptr [bp + 6]
        sub ah, ah
L31F9:
        pop si
        pop di
        mov sp, bp
        pop bp
        retf
_grp_63468620 ENDP
_CSEG_8620 ENDS
        END
