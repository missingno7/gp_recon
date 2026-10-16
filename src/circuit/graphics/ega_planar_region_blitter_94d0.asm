.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _grp_58166242:NEAR
EXTRN _CS_G_0C7BC:WORD
EXTRN _G_4E94:WORD
EXTRN _CS_G_0C7C6:WORD
EXTRN _CS_G_0C7C8:WORD
EXTRN _CS_G_0C7CA:WORD
EXTRN _CS_G_0C7CC:WORD
EXTRN _g_cir_seg0000_94c8:WORD
PUBLIC _fn_circuit_ega_094d0
_fn_circuit_ega_094d0 PROC NEAR
    push bp
    mov bp, sp
    push ds
    push si
    push di
    sub sp, 10h
    mov ax, cs
    mov ds, ax
    mov es, word ptr cs:[_CS_G_0C7BC]
    mov ax, word ptr cs:[_CS_G_0C7C6]
    shl ax, 1
    shl ax, 1
    shl ax, 1
    mov word ptr [bp - 14h], ax
    mov ax, word ptr cs:[_CS_G_0C7C8]
    shl ax, 1
    shl ax, 1
    shl ax, 1
    mov word ptr [bp - 16h], ax
    mov ax, word ptr [bp + 6]
    cmp ax, word ptr [bp + 0ah]
    je short L_9507
    jmp short L_9567
    nop
L_9507:
    cmp ax, word ptr cs:[_CS_G_0C7CA]
    jl short L_9515
    cmp ax, word ptr cs:[_CS_G_0C7CC]
    jl short L_951D
L_9515:
    add sp, 10h
    pop di
    pop si
    pop ds
    pop bp
    ret
L_951D:
    mov cx, word ptr [bp + 8]
    sub cx, word ptr [bp + 4]
    js short L_952B
    mov bx, word ptr [bp + 4]
    jmp short L_9530
    nop
L_952B:
    neg cx
    mov bx, word ptr [bp + 8]
L_9530:
    inc cx
    cmp bx, word ptr [bp - 14h]
    jge short L_9540
    add cx, bx
    sub cx, word ptr [bp - 14h]
    jle short L_9515
    mov bx, word ptr [bp - 14h]
L_9540:
    cmp bx, word ptr [bp - 16h]
    jge short L_9515
    mov ax, cx
    add ax, bx
    sub ax, word ptr [bp - 16h]
    jle short L_9550
    sub cx, ax
L_9550:
    mov ds, word ptr [bp - 2]
    push word ptr [bp + 0ch]
    mov ax, 1
    push ax
    push cx
    push word ptr [bp + 6]
    push bx
    call _grp_58166242
    add sp, 0ah
    jmp short L_9515
L_9567:
    mov ax, word ptr [bp + 4]
    cmp ax, word ptr [bp + 8]
    jne short L_95D0
    cmp ax, word ptr [bp - 14h]
    jl short L_9579
    cmp ax, word ptr [bp - 16h]
    jl short L_957B
L_9579:
    jmp short L_9515
L_957B:
    mov cx, word ptr [bp + 0ah]
    sub cx, word ptr [bp + 6]
    jl short L_9589
    mov si, word ptr [bp + 6]
    jmp short L_958E
    nop
L_9589:
    neg cx
    mov si, word ptr [bp + 0ah]
L_958E:
    inc cx
    cmp si, word ptr cs:[_CS_G_0C7CA]
    jge short L_95A4
    add cx, si
    sub cx, word ptr cs:[_CS_G_0C7CA]
    jle short L_9579
    mov si, word ptr cs:[_CS_G_0C7CA]
L_95A4:
    cmp si, word ptr cs:[_CS_G_0C7CC]
    jge short L_9579
    mov ax, cx
    add ax, si
    sub ax, word ptr cs:[_CS_G_0C7CC]
    jle short L_95B8
    sub cx, ax
L_95B8:
    mov ds, word ptr [bp - 2]
    push word ptr [bp + 0ch]
    push cx
    mov ax, 1
    push ax
    push si
    push word ptr [bp + 4]
    call _grp_58166242
    add sp, 0ah
    jmp near ptr L_9515
L_95D0:
    xor ax, ax
    mov word ptr [bp - 0ah], ax
    mov word ptr [bp - 0eh], ax
    mov bx, word ptr [bp + 8]
    sub bx, word ptr [bp + 4]
    jns short L_95E4
    neg bx
    mov al, 1
L_95E4:
    inc bx
    mov cx, word ptr [bp + 0ah]
    sub cx, word ptr [bp + 6]
    jns short L_95F1
    mov ah, 1
    neg cx
L_95F1:
    inc cx
    cmp bx, cx
    jl short L_9652
    cmp al, 0
    je short L_960C
    mov si, word ptr [bp + 8]
    mov word ptr [bp - 8], si
    mov si, word ptr [bp + 0ah]
    mov word ptr [bp - 0ch], si
    xor ah, 1
    jmp short L_9618
    nop
L_960C:
    mov si, word ptr [bp + 4]
    mov word ptr [bp - 8], si
    mov si, word ptr [bp + 6]
    mov word ptr [bp - 0ch], si
L_9618:
    cmp bx, cx
    jne short L_962D
    mov bx, ax
    xor ax, ax
    mov dx, 1
    cmp bh, 0
    je short L_9646
    neg dx
    jmp short L_9646
    nop
L_962D:
    mov dx, cx
    mov cx, bx
    mov bx, ax
    xor ax, ax
    div cx
    xor dx, dx
    cmp bh, 0
    je short L_9646
    mov dx, 0ffffh
    mov word ptr [bp - 0eh], dx
    neg ax
L_9646:
    mov word ptr [bp - 12h], ax
    mov word ptr [bp - 10h], dx
    mov dx, word ptr [bp - 8]
    jmp short L_9697
    nop
L_9652:
    cmp ah, 0
    je short L_9668
    mov si, word ptr [bp + 8]
    mov word ptr [bp - 8], si
    mov si, word ptr [bp + 0ah]
    mov word ptr [bp - 0ch], si
    xor al, 1
    jmp short L_9674
    nop
L_9668:
    mov si, word ptr [bp + 4]
    mov word ptr [bp - 8], si
    mov si, word ptr [bp + 6]
    mov word ptr [bp - 0ch], si
L_9674:
    mov dx, bx
    mov bx, ax
    xor ax, ax
    div cx
    xor dx, dx
    cmp bl, 0
    je short L_968B
    mov dx, 0ffffh
    mov word ptr [bp - 0ah], dx
    neg ax
L_968B:
    mov word ptr [bp - 12h], ax
    mov word ptr [bp - 10h], dx
    mov si, word ptr [bp - 0ch]
    jmp short L_96C7
    nop
L_9697:
    mov bx, word ptr [bp - 0ch]
    cmp bx, word ptr cs:[_CS_G_0C7CA]
    jl short L_96B5
    cmp bx, word ptr cs:[_CS_G_0C7CC]
    jge short L_96B5
    cmp dx, word ptr [bp - 14h]
    jl short L_96B5
    cmp dx, word ptr [bp - 16h]
    jge short L_96C4
    jmp near ptr L_97F0
L_96B5:
    inc dx
    mov ax, word ptr [bp - 12h]
    add word ptr [bp - 0eh], ax
    mov ax, word ptr [bp - 10h]
    adc word ptr [bp - 0ch], ax
    loop short L_9697
L_96C4:
    jmp near ptr L_9515
L_96C7:
    mov dx, word ptr [bp - 8]
    cmp dx, word ptr [bp - 14h]
    jl short L_96E5
    cmp dx, word ptr [bp - 16h]
    jge short L_96E5
    cmp si, word ptr cs:[_CS_G_0C7CA]
    jl short L_96E5
    cmp si, word ptr cs:[_CS_G_0C7CC]
    jge short L_96F4
    jmp short L_96F7
    nop
L_96E5:
    inc si
    mov ax, word ptr [bp - 12h]
    add word ptr [bp - 0ah], ax
    mov ax, word ptr [bp - 10h]
    adc word ptr [bp - 8], ax
    loop short L_96C7
L_96F4:
    jmp near ptr L_9515
L_96F7:
    cmp word ptr cs:[_CS_G_0C7BC], 0a000h
    je short L_9770
L_9700:
    cmp si, word ptr cs:[_CS_G_0C7CC]
    jge short L_976D
    mov dx, word ptr [bp - 8]
    cmp dx, word ptr [bp - 14h]
    jl short L_976D
    cmp dx, word ptr [bp - 16h]
    jge short L_976D
    mov bx, si
    shl bx, 1
    add bx, word ptr cs:[_G_4E94]
    mov di, word ptr [bx]
    mov bx, dx
    and bx, 7
    mov al, byte ptr cs:[bx + _g_cir_seg0000_94c8]
    mov ah, al
    not ah
    mov bx, dx
    shr bx, 1
    shr bx, 1
    shr bx, 1
    add di, bx
    xor bx, bx
    mov dx, word ptr [bp + 0ch]
L_973C:
    cmp word ptr cs:[bx + _CS_G_0C7BC], 0
    je short L_9754
    mov es, word ptr cs:[bx + _CS_G_0C7BC]
    and byte ptr es:[di], ah
    test dl, 1
    je short L_9754
    or byte ptr es:[di], al
L_9754:
    shr dx, 1
    add bx, 2
    cmp bx, 8
    jl short L_973C
    inc si
    mov ax, word ptr [bp - 12h]
    add word ptr [bp - 0ah], ax
    mov ax, word ptr [bp - 10h]
    adc word ptr [bp - 8], ax
    loop short L_9700
L_976D:
    jmp near ptr L_9515
L_9770:
    mov dx, 3ceh
    mov al, 5
    out dx, al
    inc dx
    mov al, 2
    out dx, al
    mov dx, 3c4h
    mov al, 2
    out dx, al
    inc dx
    mov al, 0fh
    out dx, al
L_9784:
    cmp si, word ptr cs:[_CS_G_0C7CC]
    jge short L_97D9
    mov dx, word ptr [bp - 8]
    cmp dx, word ptr [bp - 14h]
    jl short L_97D9
    cmp dx, word ptr [bp - 16h]
    jge short L_97D9
    mov bx, si
    shl bx, 1
    add bx, word ptr cs:[_G_4E94]
    mov di, word ptr [bx]
    mov bx, dx
    shr bx, 1
    shr bx, 1
    shr bx, 1
    add di, bx
    mov bx, dx
    and bx, 7
    mov bl, byte ptr cs:[bx + _g_cir_seg0000_94c8]
    mov dx, 3ceh
    mov al, 8
    out dx, al
    inc dx
    mov al, bl
    out dx, al
    mov ax, word ptr [bp + 0ch]
    mov ah, byte ptr es:[di]
    mov byte ptr es:[di], al
    inc si
    mov ax, word ptr [bp - 12h]
    add word ptr [bp - 0ah], ax
    mov ax, word ptr [bp - 10h]
    adc word ptr [bp - 8], ax
    loop short L_9784
L_97D9:
    mov dx, 3ceh
    mov al, 5
    out dx, al
    inc dx
    mov al, 0
    out dx, al
    mov dx, 3ceh
    mov al, 8
    out dx, al
    inc dx
    mov al, 0
    out dx, al
    jmp near ptr L_9515
L_97F0:
    cmp word ptr cs:[_CS_G_0C7BC], 0a000h
    je short L_986A
L_97F9:
    mov bx, word ptr [bp - 0ch]
    cmp bx, word ptr cs:[_CS_G_0C7CA]
    jl short L_9867
    cmp bx, word ptr cs:[_CS_G_0C7CC]
    jge short L_9867
    cmp dx, word ptr [bp - 16h]
    jge short L_9867
    shl bx, 1
    add bx, word ptr cs:[_G_4E94]
    mov di, word ptr [bx]
    mov bx, dx
    and bx, 7
    mov al, byte ptr cs:[bx + _g_cir_seg0000_94c8]
    mov ah, al
    not ah
    mov bx, dx
    shr bx, 1
    shr bx, 1
    shr bx, 1
    add di, bx
    xor bx, bx
    mov si, word ptr [bp + 0ch]
L_9835:
    cmp word ptr cs:[bx + _CS_G_0C7BC], 0
    je short L_984E
    mov es, word ptr cs:[bx + _CS_G_0C7BC]
    and byte ptr es:[di], ah
    test si, 1
    je short L_984E
    or byte ptr es:[di], al
L_984E:
    shr si, 1
    add bx, 2
    cmp bx, 8
    jl short L_9835
    inc dx
    mov ax, word ptr [bp - 12h]
    add word ptr [bp - 0eh], ax
    mov ax, word ptr [bp - 10h]
    adc word ptr [bp - 0ch], ax
    loop short L_97F9
L_9867:
    jmp near ptr L_9515
L_986A:
    mov si, dx
    mov dx, 3ceh
    mov al, 5
    out dx, al
    inc dx
    mov al, 2
    out dx, al
    mov dx, 3c4h
    mov al, 2
    out dx, al
    inc dx
    mov al, 0fh
    out dx, al
L_9880:
    mov bx, word ptr [bp - 0ch]
    cmp bx, word ptr cs:[_CS_G_0C7CA]
    jl short L_98D5
    cmp bx, word ptr cs:[_CS_G_0C7CC]
    jge short L_98D5
    cmp si, word ptr [bp - 16h]
    jge short L_98D5
    shl bx, 1
    add bx, word ptr cs:[_G_4E94]
    mov di, word ptr [bx]
    mov bx, si
    shr bx, 1
    shr bx, 1
    shr bx, 1
    add di, bx
    mov bx, si
    and bx, 7
    mov bl, byte ptr cs:[bx + _g_cir_seg0000_94c8]
    mov dx, 3ceh
    mov al, 8
    out dx, al
    inc dx
    mov al, bl
    out dx, al
    mov ax, word ptr [bp + 0ch]
    mov ah, byte ptr es:[di]
    mov byte ptr es:[di], al
    inc si
    mov ax, word ptr [bp - 12h]
    add word ptr [bp - 0eh], ax
    mov ax, word ptr [bp - 10h]
    adc word ptr [bp - 0ch], ax
    loop short L_9880
L_98D5:
    mov dx, 3ceh
    mov al, 5
    out dx, al
    inc dx
    mov al, 0
    out dx, al
    mov dx, 3ceh
    mov al, 8
    out dx, al
    inc dx
    mov al, 0
    out dx, al
    jmp near ptr L_9515
_fn_circuit_ega_094d0 ENDP
_TEXT ENDS
END
