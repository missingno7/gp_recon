        EXTRN   _GRP_1A9A5E95:FAR
_CSEG_649C SEGMENT PARA PUBLIC 'CODE'
        ASSUME  CS:_CSEG_649C
        PUBLIC  _grp_0c93649c
_grp_0c93649c PROC FAR
        push bp
        mov bp, sp
        sub sp, 0eh
        push di
        push si
        mov si, word ptr [bp + 6]
        cmp word ptr [si + 2], 0
        jge L5010
        mov word ptr [si + 2], 0
L5010:
        mov al, byte ptr [si + 7]
        cbw
        mov word ptr [bp - 0ch], ax
        mov ax, 1
        push ax
        sub ax, ax
        push ax
        push ax
        push word ptr [bp - 0ch]
        call FAR PTR _GRP_1A9A5E95
        add sp, 8
        mov word ptr [bp - 6], ax
        mov word ptr [bp - 4], dx
        or dx, dx
        jge L503C
L5034:
        mov ax, 0ffffh
L5037:
        cwd
        jmp NEAR PTR L5176
        nop
L503C:
        test byte ptr [si + 6], 8
        jne L5070
        mov bx, si
        sub bx, 0a608h
        mov cl, 3
        sar bx, cl
        mov ax, bx
        shl bx, 1
        add bx, ax
        shl bx, 1
        test byte ptr [bx - 22872], 1
        jne L5070
        mov ax, word ptr [si + 2]
        cwd
        mov cx, ax
        mov bx, dx
        mov ax, word ptr [bp - 6]
        mov dx, word ptr [bp - 4]
        sub ax, cx
        sbb dx, bx
        jmp NEAR PTR L5176
L5070:
        mov ax, word ptr [si]
        sub ax, word ptr [si + 4]
        mov word ptr [bp - 0ah], ax
        test byte ptr [si + 6], 3
        je L50AC
        mov bx, word ptr [bp - 0ch]
        test byte ptr [bx - 5a46h], 128
        je L509E
        mov di, word ptr [si + 4]
        mov cx, ax
        jmp SHORT L5097
        nop
L5090:
        cmp byte ptr [di], 0ah
        jne L5096
        inc cx
L5096:
        inc di
L5097:
        cmp word ptr [si], di
        ja L5090
        mov word ptr [bp - 0ah], cx
L509E:
        mov ax, word ptr [bp - 6]
        or ax, word ptr [bp - 4]
        jne L50BC
        mov ax, word ptr [bp - 0ah]
        jmp SHORT L5037
        nop
L50AC:
        test byte ptr [si + 6], 128
        jne L509E
        mov word ptr ds:[0a5abh], 22
        jmp NEAR PTR L5034
        nop
L50BC:
        test byte ptr [si + 6], 1
        jne L50C5
        jmp NEAR PTR L516C
L50C5:
        cmp word ptr [si + 2], 0
        jne L50D4
        mov word ptr [bp - 0ah], 0
        jmp NEAR PTR L516C
        nop
L50D4:
        mov ax, word ptr [si]
        sub ax, word ptr [si + 4]
        add ax, word ptr [si + 2]
        mov word ptr [bp - 0eh], ax
        mov bx, word ptr [bp - 0ch]
        test byte ptr [bx - 5a46h], 128
        je L5162
        mov ax, 2
        push ax
        sub ax, ax
        push ax
        push ax
        push bx
        call FAR PTR _GRP_1A9A5E95
        add sp, 8
        cmp ax, word ptr [bp - 6]
        jne L5128
        cmp dx, word ptr [bp - 4]
        jne L5128
        mov ax, word ptr [bp - 0eh]
        add ax, word ptr [si + 4]
        mov word ptr [bp - 8], ax
        mov di, word ptr [si + 4]
        mov dx, ax
        mov cx, word ptr [bp - 0eh]
        jmp SHORT L511F
        nop
L5118:
        cmp byte ptr [di], 0ah
        jne L511E
        inc cx
L511E:
        inc di
L511F:
        cmp dx, di
        ja L5118
        mov word ptr [bp - 0eh], cx
        jmp SHORT L5162
L5128:
        sub ax, ax
        push ax
        push word ptr [bp - 4]
        push word ptr [bp - 6]
        push word ptr [bp - 0ch]
        call FAR PTR _GRP_1A9A5E95
        add sp, 8
        mov bx, si
        sub bx, 0a608h
        mov cl, 3
        sar bx, cl
        mov ax, bx
        shl bx, 1
        add bx, ax
        shl bx, 1
        mov ax, word ptr [bx - 22870]
        mov word ptr [bp - 0eh], ax
        mov bx, word ptr [bp - 0ch]
        test byte ptr [bx - 5a46h], 4
        je L5162
        inc word ptr [bp - 0eh]
L5162:
        mov ax, word ptr [bp - 0eh]
        cwd
        sub word ptr [bp - 6], ax
        sbb word ptr [bp - 4], dx
L516C:
        mov ax, word ptr [bp - 0ah]
        cwd
        add ax, word ptr [bp - 6]
        adc dx, word ptr [bp - 4]
L5176:
        pop si
        pop di
        mov sp, bp
        pop bp
        retf
_grp_0c93649c ENDP
_CSEG_649C ENDS
        END
