.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _CS_G_0C7BC:WORD
EXTRN _G_A844:WORD
EXTRN _CS_G_0A846:WORD
EXTRN _CS_G_0A848:WORD
EXTRN _CS_G_0A84A:WORD
EXTRN _CS_G_0C7CC:WORD
EXTRN _G_7286:WORD
EXTRN _G_7292:WORD
EXTRN _g_cir_seg0000_6bea:WORD
EXTRN _g_cir_seg0000_6bde:WORD
EXTRN _g_cir_seg0000_6be2:WORD
EXTRN _g_cir_seg0000_6be6:WORD
PUBLIC _fn_circuit_cga_06bee
_fn_circuit_cga_06bee PROC NEAR
    push bp
    mov bp, sp
    sub sp, 10h
    push ds
    push si
    push di
    mov ax, cs
    mov ds, ax
    mov es, word ptr cs:[_CS_G_0C7BC]
    mov ax, word ptr cs:[_CS_G_0A846]
    shl ax, 1
    shl ax, 1
    mov word ptr [bp - 0eh], ax
    mov ax, word ptr cs:[_CS_G_0A848]
    shl ax, 1
    shl ax, 1
    mov word ptr [bp - 10h], ax
    mov ax, word ptr [bp + 6]
    cmp ax, word ptr [bp + 0ah]
    je short L_6C21
    jmp near ptr L_6CCA
L_6C21:
    cmp ax, word ptr cs:[_CS_G_0A84A]
    jl short L_6C2F
    cmp ax, word ptr cs:[_CS_G_0C7CC]
    jl short L_6C36
L_6C2F:
    pop di
    pop si
    pop ds
    mov sp, bp
    pop bp
    ret
L_6C36:
    mov si, ax
    shl si, 1
    add si, word ptr cs:[_G_A844]
    mov di, word ptr [si]
    mov cx, word ptr [bp + 8]
    sub cx, word ptr [bp + 4]
    js short L_6C4F
    mov bx, word ptr [bp + 4]
    jmp short L_6C54
    nop
L_6C4F:
    neg cx
    mov bx, word ptr [bp + 8]
L_6C54:
    inc cx
    cmp bx, word ptr [bp - 0eh]
    jge short L_6C64
    add cx, bx
    sub cx, word ptr [bp - 0eh]
    jle short L_6C2F
    mov bx, word ptr [bp - 0eh]
L_6C64:
    cmp bx, word ptr [bp - 10h]
    jge short L_6C2F
    mov ax, cx
    add ax, bx
    sub ax, word ptr [bp - 10h]
    jle short L_6C74
    sub cx, ax
L_6C74:
    mov ax, bx
    shr ax, 1
    shr ax, 1
    add di, ax
    and bx, 3
    mov al, byte ptr cs:[bx + _g_cir_seg0000_6bde]
    mov ah, al
    and al, byte ptr [bp + 0ch]
    sub cl, byte ptr cs:[bx + _g_cir_seg0000_6be2]
    sbb ch, 0
    jl short L_6CC3
    not ah
    and byte ptr es:[di], ah
    or byte ptr es:[di], al
    inc di
    mov al, byte ptr [bp + 0ch]
    mov ah, 0ffh
    mov bx, cx
    and bx, 3
    shr cx, 1
    shr cx, 1
    je short L_6CAE
    rep stosb
L_6CAE:
    and ah, byte ptr cs:[bx + _g_cir_seg0000_6be6]
    not ah
    and byte ptr es:[di], ah
    and al, byte ptr cs:[bx + _g_cir_seg0000_6be6]
    or byte ptr es:[di], al
    jmp near ptr L_6C2F
L_6CC3:
    add cx, 4
    mov bx, cx
    jmp short L_6CAE
L_6CCA:
    mov ax, word ptr [bp + 4]
    cmp ax, word ptr [bp + 8]
    jne short L_6D4F
    cmp ax, word ptr [bp - 0eh]
    jle short L_6CDC
    cmp ax, word ptr [bp - 10h]
    jl short L_6CDF
L_6CDC:
    jmp near ptr L_6C2F
L_6CDF:
    mov cx, word ptr [bp + 0ah]
    sub cx, word ptr [bp + 6]
    jl short L_6CED
    mov si, word ptr [bp + 6]
    jmp short L_6CF2
    nop
L_6CED:
    neg cx
    mov si, word ptr [bp + 0ah]
L_6CF2:
    inc cx
    cmp si, word ptr cs:[_CS_G_0A84A]
    jge short L_6D08
    add cx, si
    sub cx, word ptr cs:[_CS_G_0A84A]
    jle short L_6CDC
    mov si, word ptr cs:[_CS_G_0A84A]
L_6D08:
    cmp si, word ptr cs:[_CS_G_0C7CC]
    jge short L_6CDC
    mov ax, cx
    add ax, si
    sub ax, word ptr cs:[_CS_G_0C7CC]
    jle short L_6D1C
    sub cx, ax
L_6D1C:
    shl si, 1
    add si, word ptr cs:[_G_A844]
    mov dx, word ptr [bp + 4]
    mov bx, dx
    shr dx, 1
    shr dx, 1
    add di, ax
    and bx, 3
    mov al, byte ptr cs:[bx + _g_cir_seg0000_6bea]
    mov ah, al
    not ah
    and al, byte ptr [bp + 0ch]
    mov bx, dx
L_6D3F:
    mov di, word ptr [si]
    and byte ptr es:[bx + di], ah
    or byte ptr es:[bx + di], al
    add si, 2
    loop short L_6D3F
    jmp near ptr L_6C2F
L_6D4F:
    xor ax, ax
    mov word ptr [bp - 4], ax
    mov word ptr [bp - 8], ax
    mov bx, word ptr [bp + 8]
    sub bx, word ptr [bp + 4]
    jns short L_6D63
    neg bx
    mov al, 1
L_6D63:
    inc bx
    mov cx, word ptr [bp + 0ah]
    sub cx, word ptr [bp + 6]
    jns short L_6D70
    mov ah, 1
    neg cx
L_6D70:
    inc cx
    cmp bx, cx
    jl short L_6DD1
    cmp al, 0
    je short L_6D8B
    mov si, word ptr [bp + 8]
    mov word ptr [bp - 2], si
    mov si, word ptr [bp + 0ah]
    mov word ptr [bp - 6], si
    xor ah, 1
    jmp short L_6D97
    nop
L_6D8B:
    mov si, word ptr [bp + 4]
    mov word ptr [bp - 2], si
    mov si, word ptr [bp + 6]
    mov word ptr [bp - 6], si
L_6D97:
    cmp bx, cx
    jne short L_6DAC
    mov bx, ax
    xor ax, ax
    mov dx, 1
    cmp bh, 0
    je short L_6DC5
    neg dx
    jmp short L_6DC5
    nop
L_6DAC:
    mov dx, cx
    mov cx, bx
    mov bx, ax
    xor ax, ax
    div cx
    xor dx, dx
    cmp bh, 0
    je short L_6DC5
    mov dx, 0ffffh
    neg ax
    mov word ptr [bp - 8], dx
L_6DC5:
    mov word ptr [bp - 0ch], ax
    mov word ptr [bp - 0ah], dx
    mov dx, word ptr [bp - 2]
    jmp short L_6E16
    nop
L_6DD1:
    cmp ah, 0
    je short L_6DE7
    mov si, word ptr [bp + 8]
    mov word ptr [bp - 2], si
    mov si, word ptr [bp + 0ah]
    mov word ptr [bp - 6], si
    xor al, 1
    jmp short L_6DF3
    nop
L_6DE7:
    mov si, word ptr [bp + 4]
    mov word ptr [bp - 2], si
    mov si, word ptr [bp + 6]
    mov word ptr [bp - 6], si
L_6DF3:
    mov dx, bx
    mov bx, ax
    xor ax, ax
    div cx
    xor dx, dx
    cmp bl, 0
    je short L_6E0A
    mov dx, 0ffffh
    neg ax
    mov word ptr [bp - 4], dx
L_6E0A:
    mov word ptr [bp - 0ch], ax
    mov word ptr [bp - 0ah], dx
    mov si, word ptr [bp - 6]
    jmp short L_6E94
    nop
L_6E16:
    mov bx, word ptr [bp - 6]
    cmp bx, word ptr cs:[_CS_G_0A84A]
    jl short L_6E34
    cmp bx, word ptr cs:[_CS_G_0C7CC]
    jge short L_6E34
    cmp dx, word ptr [bp - 0eh]
    jl short L_6E34
    cmp dx, word ptr [bp - 10h]
    jl short L_6E46
    jmp short L_6E43
    nop
L_6E34:
    inc dx
    mov ax, word ptr [bp - 0ch]
    add word ptr [bp - 8], ax
    mov ax, word ptr [bp - 0ah]
    adc word ptr [bp - 6], ax
    loop short L_6E16
L_6E43:
    jmp near ptr L_6C2F
L_6E46:
    mov bx, word ptr [bp - 6]
    cmp bx, word ptr cs:[_CS_G_0A84A]
    jl short L_6E43
    cmp bx, word ptr cs:[_CS_G_0C7CC]
    jge short L_6E43
    cmp dx, word ptr [bp - 10h]
    jge short L_6E43
    shl bx, 1
    add bx, word ptr cs:[_G_A844]
    mov di, word ptr [bx]
    mov bx, dx
    and bx, 3
    mov al, byte ptr cs:[bx + _g_cir_seg0000_6bea]
    mov ah, al
    not ah
    and al, byte ptr [bp + 0ch]
    mov bx, dx
    shr bx, 1
    shr bx, 1
    and byte ptr es:[bx + di], ah
    or byte ptr es:[bx + di], al
    inc dx
    mov ax, word ptr [bp - 0ch]
    add word ptr [bp - 8], ax
    mov ax, word ptr [bp - 0ah]
    adc word ptr [bp - 6], ax
    loop short L_6E46
    jmp near ptr L_6C2F
L_6E94:
    mov dx, word ptr [bp - 2]
    cmp dx, word ptr [bp - 0eh]
    jl short L_6EB2
    cmp dx, word ptr [bp - 10h]
    jge short L_6EB2
    cmp si, word ptr cs:[_CS_G_0A84A]
    jl short L_6EB2
    cmp si, word ptr cs:[_CS_G_0C7CC]
    jge short L_6EC1
    jmp short L_6EC4
    nop
L_6EB2:
    inc si
    mov ax, word ptr [bp - 0ch]
    add word ptr [bp - 4], ax
    mov ax, word ptr [bp - 0ah]
    adc word ptr [bp - 2], ax
    loop short L_6E94
L_6EC1:
    jmp near ptr L_6C2F
L_6EC4:
    cmp si, word ptr cs:[_CS_G_0C7CC]
    jge short L_6EC1
    mov dx, word ptr [bp - 2]
    cmp dx, word ptr [bp - 0eh]
    jl short L_6EC1
    cmp dx, word ptr [bp - 10h]
    jge short L_6EC1
    mov bx, si
    shl bx, 1
    add bx, word ptr cs:[_G_A844]
    mov di, word ptr [bx]
    mov bx, dx
    and bx, 3
    mov al, byte ptr cs:[bx + _g_cir_seg0000_6bea]
    mov ah, al
    not ah
    and al, byte ptr [bp + 0ch]
    mov bx, dx
    shr bx, 1
    shr bx, 1
    and byte ptr es:[bx + di], ah
    or byte ptr es:[bx + di], al
    inc si
    mov ax, word ptr [bp - 0ch]
    add word ptr [bp - 4], ax
    mov ax, word ptr [bp - 0ah]
    adc word ptr [bp - 2], ax
    loop short L_6EC4
    jmp near ptr L_6C2F
_fn_circuit_cga_06bee ENDP
_TEXT ENDS
END
