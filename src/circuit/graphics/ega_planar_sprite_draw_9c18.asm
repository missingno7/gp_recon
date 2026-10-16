.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _CS_G_0C7BC:WORD
EXTRN _G_4E94:WORD
EXTRN _g_cir_seg0000_9bd8:WORD
EXTRN _g_cir_seg0000_9bf8:WORD
EXTRN _g_cir_seg0000_9bb8:WORD
EXTRN _g_cir_seg0000_9bc4:WORD
EXTRN _g_cir_seg0000_9da7:WORD
EXTRN _g_cir_seg0000_9dbc:WORD
PUBLIC _fn_circuit_ega_09c18
_fn_circuit_ega_09c18 PROC NEAR
    push bp
    mov bp, sp
    push ds
    push si
    push di
    sub sp, 2ch
    mov ds, word ptr [bp + 6]
    mov si, word ptr [bp + 4]
    mov es, word ptr cs:[_CS_G_0C7BC]
    mov ax, word ptr [si + 8]
    mov word ptr [bp - 14h], ax
    mov ax, word ptr [si]
    mov word ptr [bp - 16h], ax
    mov bx, 0ch
    mul bl
    mov word ptr [bp - 0ah], ax
    mov ax, word ptr [si + 2]
    mul byte ptr [si]
    mov word ptr [bp - 32h], ax
    sub ax, word ptr [si]
    mov word ptr [bp - 1ah], ax
    lea si, [si + 0ch]
    xor di, di
    xor cx, cx
L_9C53:
    mov bl, byte ptr [si]
    and bl, 0fh
    je short L_9C88
    add cx, word ptr [bp - 32h]
L_9C5D:
    or bx, bx
    je short L_9C80
    mov dx, bx
    shl bx, 1
    mov ax, word ptr cs:[bx + _g_cir_seg0000_9bd8]
    mov word ptr [bp + di - 28h], ax
    not ax
    and dx, ax
    mov ax, word ptr cs:[bx + _g_cir_seg0000_9bf8]
    mov word ptr [bp + di - 30h], ax
    mov bx, dx
    add di, 2
    jmp short L_9C5D
L_9C80:
    cmp di, 8
    jge short L_9C88
    inc si
    jmp short L_9C53
L_9C88:
    sub cx, word ptr [bp - 0ah]
    mov word ptr [bp - 1ch], cx
    mov si, word ptr [bp + 4]
    mov bl, byte ptr [si + 0ch]
    mov cl, 4
    shr bl, cl
L_9C98:
    and bx, 0fh
    je short L_9CBA
    mov dx, bx
    shl bx, 1
    mov ax, word ptr cs:[bx + _g_cir_seg0000_9bd8]
    mov word ptr [bp + di - 28h], ax
    not ax
    and dx, ax
    mov ax, OFFSET _g_cir_seg0000_9da7
    mov word ptr [bp + di - 30h], ax
    mov bx, dx
    add di, 2
    jmp short L_9C98
L_9CBA:
    mov bl, byte ptr [si + 0dh]
    mov cl, 4
    shr bl, cl
L_9CC1:
    and bx, 0fh
    je short L_9CE3
    mov dx, bx
    shl bx, 1
    mov ax, word ptr cs:[bx + _g_cir_seg0000_9bd8]
    mov word ptr [bp + di - 28h], ax
    not ax
    and dx, ax
    mov ax, OFFSET _g_cir_seg0000_9dbc
    mov word ptr [bp + di - 30h], ax
    mov bx, dx
    add di, 2
    jmp short L_9CC1
L_9CE3:
    mov word ptr [bp - 20h], di
    mov si, word ptr [bp + 4]
    mov ax, word ptr [si + 0ah]
    shl ax, 1
    add ax, word ptr cs:[_G_4E94]
    mov word ptr [bp - 0eh], ax
    add ax, word ptr [si + 2]
    add ax, word ptr [si + 2]
    mov word ptr [bp - 10h], ax
    add si, 10h
    mov word ptr [bp - 12h], si
    mov word ptr [bp - 18h], 0bh
L_9D0A:
    mov di, word ptr [bp - 18h]
    mov dl, byte ptr cs:[di + _g_cir_seg0000_9bb8]
    xor dh, dh
    mov ax, word ptr [bp - 16h]
    mul dl
    mov word ptr [bp - 8], ax
    shl dx, 1
    add dx, word ptr [bp - 0eh]
    mov word ptr [bp - 0ch], dx
    mov si, word ptr [bp - 12h]
    add si, word ptr [bp - 8]
L_9D2A:
    mov di, word ptr [bp - 0ch]
    cmp di, word ptr [bp - 10h]
    jae short L_9D97
    mov di, word ptr cs:[di]
    add di, word ptr [bp - 14h]
    mov word ptr [bp - 1eh], di
    mov cx, word ptr [bp - 16h]
    mov bl, byte ptr [bp + 8]
    and bx, 3
    mov ah, byte ptr cs:[bx + _g_cir_seg0000_9bc4]
    xor bx, bx
L_9D4B:
    mov di, bx
    mov cx, word ptr [bp + di - 28h]
    mov dx, 3c4h
    mov al, 2
    out dx, al
    inc dx
    mov al, cl
    out dx, al
    mov dx, 3ceh
    mov al, 4
    out dx, al
    inc dx
    mov al, ch
    out dx, al
    mov cx, word ptr [bp - 16h]
    jmp word ptr [bp + di - 30h]
    mov di, word ptr [bp - 1eh]
L_9D6D:
    lodsb
    and al, ah
    not ah
    mov dl, byte ptr es:[di]
    and dl, ah
    or al, dl
    stosb
    not ah
    ror ah, 1
    loop short L_9D6D
    add si, word ptr [bp - 1ah]
    add bx, 2
    cmp bx, word ptr [bp - 20h]
    jl short L_9D4B
    inc byte ptr [bp + 8]
    add word ptr [bp - 0ch], 18h
    sub si, word ptr [bp - 1ch]
    jmp short L_9D2A
L_9D97:
    dec word ptr [bp - 18h]
    jl short L_9D9F
    jmp near ptr L_9D0A
L_9D9F:
    add sp, 2ch
    pop di
    pop si
    pop ds
    pop bp
    ret
_fn_circuit_ega_09c18 ENDP
_TEXT ENDS
END
