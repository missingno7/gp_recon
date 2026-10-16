.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _G_4E8C:WORD
PUBLIC _fn_circuit_ega_0b9d2
PUBLIC _raster_mode_body_ega_b9e9
_fn_circuit_ega_0b9d2 PROC NEAR
    push bp
    mov bp, sp
    push si
    push di
    sub sp, 0Ch
    mov ax, word ptr [bp + 6]
    mov word ptr ds:[8B4Ah], ax
    mov ax, word ptr [bp + 8]
    mov word ptr ds:[8B4Ch], ax
    jmp short L_B9F1
    nop
_fn_circuit_ega_0b9d2 ENDP
_raster_mode_body_ega_b9e9 PROC NEAR
    push bp
    mov bp, sp
    push si
    push di
    sub sp, 0Ch
L_B9F1:
    cmp word ptr cs:[0C7BCh], 0A000h
    jne short L_BA21
    mov cl, byte ptr ds:[8B44h]
    mov ch, byte ptr ds:[8B46h]
    mov bx, cx
    xor cl, ch
    not cl
    mov byte ptr [bp - 10h], cl
    mov dx, 03CEh
    mov al, 1
    out dx, al
    inc dx
    mov al, cl
    out dx, al
    and bl, bh
    mov dx, 03CEh
    mov al, 0
    out dx, al
    inc dx
    mov al, bl
    out dx, al
L_BA21:
    mov ax, word ptr cs:[0C7CEh]
    mov word ptr [bp - 6], ax
    mov es, word ptr cs:[0C7BCh]
    cld
    mov ax, word ptr ds:[8B5Ah]
    cmp ax, 1
    je short L_BA47
L_BA36:
    mov dx, 03CEh
    mov al, 1
    out dx, al
    inc dx
    mov al, 0
    out dx, al
    add sp, 0Ch
    pop di
    pop si
    pop bp
    ret
L_BA47:
    mov si, word ptr [bp + 4]
    mov bl, byte ptr [si]
    cmp bl, 0
    je short L_BA36
    mov al, bl
    inc word ptr [bp + 4]
    xor bh, bh
    shl bx, 1
    add bx, word ptr ds:[8B52h]
    mov si, word ptr [bx]
    cmp si, 0
    jne short L_BA7C
    cmp al, 0Dh
    je short L_BA6D
    cmp al, 0Ah
    jne short L_BA47
L_BA6D:
    mov ax, word ptr ds:[8B48h]
    mov word ptr ds:[8B4Ah], ax
    mov ax, word ptr ds:[8B58h]
    add word ptr ds:[8B4Ch], ax
    jmp short L_BA47
L_BA7C:
    mov word ptr [bp - 0Ah], si
    mov ax, word ptr ds:[8B4Ah]
    shr ax, 1
    shr ax, 1
    shr ax, 1
    mov bx, word ptr ds:[8B4Ch]
    shl bx, 1
    add bx, word ptr cs:[0C7C4h]
    add ax, word ptr cs:[bx]
    mov word ptr [bp - 8], ax
    cmp word ptr cs:[0C7BCh], 0A000h
    jne short L_BAA5
    jmp short L_BB18
    nop
L_BAA5:
    mov dl, byte ptr ds:[8B44h]
    mov dh, byte ptr ds:[8B46h]
    xor dh, dl
    lea ax, _G_4E8C
    mov word ptr [bp - 0Ch], ax
    mov byte ptr [bp - 0Eh], 4
L_BABA:
    mov si, word ptr [bp - 0Ch]
    mov ax, word ptr cs:[si]
    or ax, ax
    je short L_BAE5
    mov es, ax
    mov cx, word ptr ds:[8B50h]
    mov di, word ptr [bp - 8]
    mov bx, word ptr [bp - 6]
    test dh, 1
    jne short L_BAFA
    xor ax, ax
    test dl, 1
    je short L_BADE
    not ax
L_BADE:
    mov byte ptr es:[di], al
    add di, bx
    loop L_BADE
L_BAE5:
    shr dx, 1
    add word ptr [bp - 0Ch], 2
    dec byte ptr [bp - 0Eh]
    jg short L_BABA
L_BAF0:
    mov ax, word ptr ds:[8B56h]
    add word ptr ds:[8B4Ah], ax
    jmp near ptr L_BA47
L_BAFA:
    mov si, word ptr [bp - 0Ah]
    test dl, 1
    je short L_BB0C
L_BB02:
    lodsb
    mov byte ptr es:[di], al
    add di, bx
    loop L_BB02
    jmp short L_BAE5
L_BB0C:
    lodsb
    not al
    mov byte ptr es:[di], al
    add di, bx
    loop L_BB0C
    jmp short L_BAE5
L_BB18:
    mov cl, byte ptr ds:[8B44h]
    or cl, byte ptr [bp - 10h]
    mov dx, 03C4h
    mov al, 2
    out dx, al
    inc dx
    mov al, cl
    out dx, al
    mov di, word ptr [bp - 8]
    mov bx, word ptr [bp - 6]
    mov cx, word ptr ds:[8B50h]
    mov si, word ptr [bp - 0Ah]
L_BB36:
    lodsb
    mov ah, byte ptr es:[di]
    mov byte ptr es:[di], al
    add di, bx
    loop L_BB36
    mov ch, byte ptr ds:[8B44h]
    mov cl, byte ptr ds:[8B46h]
    xor ch, cl
    and ch, cl
    je short L_BB77
    mov cl, byte ptr ds:[8B46h]
    or cl, byte ptr [bp - 10h]
    mov dx, 03C4h
    mov al, 2
    out dx, al
    inc dx
    mov al, cl
    out dx, al
    mov di, word ptr [bp - 8]
    mov cx, word ptr ds:[8B50h]
    mov si, word ptr [bp - 0Ah]
L_BB6A:
    lodsb
    not al
    mov ah, byte ptr es:[di]
    mov byte ptr es:[di], al
    add di, bx
    loop L_BB6A
L_BB77:
    jmp near ptr L_BAF0
_raster_mode_body_ega_b9e9 ENDP
_TEXT ENDS
END

