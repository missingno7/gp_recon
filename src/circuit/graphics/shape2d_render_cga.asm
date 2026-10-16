.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
EXTRN _grp_7d50ca88:NEAR
PUBLIC _fn_circuit_cga_0b914
_fn_circuit_cga_0b914 PROC NEAR
    push bp
    mov bp, sp
    sub sp, 0Eh
    push ds
    push si
    push di
    mov ax, word ptr [bp + 6]
    mov ds, ax
    mov ax, word ptr [bp + 4]
    mov si, ax
    mov ax, word ptr [bp + 0Ah]
    mov word ptr [bp - 0Ah], ax
    mov ax, word ptr [bp + 8]
    mov word ptr [bp - 8], ax
    mov bx, word ptr [si + 4]
    mov word ptr [bp - 2], bx
    mov word ptr [bp - 4], 0
L_B93E:
    push word ptr [bp - 4]
    push word ptr [bp + 6]
    push word ptr [bp + 4]
    mov ax, DGROUP
    mov ds, ax
    call _grp_7d50ca88
    add sp, 6
    mov word ptr [bp - 6], ax
    mov si, ax
    mov ds, dx
    mov di, word ptr [bp - 8]
    mov es, word ptr [bp - 0Ah]
    mov al, byte ptr [si + 0Fh]
    and al, 0F0h
    jne L_B97D
    mov al, byte ptr [si + 0Eh]
    shr al, 1
    shr al, 1
    shr al, 1
    shr al, 1
    je L_B97D
    cmp al, 4
    jb L_B98E
    mov ax, 1
    jmp SHORT L_B987
    nop
L_B97D:
    inc word ptr [bp - 4]
    dec word ptr [bp - 2]
    jg L_B93E
    xor ax, ax
L_B987:
    pop di
    pop si
    pop ds
    mov sp, bp
    pop bp
    ret
L_B98E:
    mov dx, word ptr [si]
    mov word ptr [bp - 0Ch], dx
    mov dx, word ptr [si + 2]
    mov word ptr [bp - 0Eh], dx
    xor dx, dx
    xor ah, ah
    mov bx, ax
    dec bx
    shl bx, 1
    jmp word ptr cs:[bx-46F2h]
L_B9A7:
    mov bx, si
    add bx, 10h
    add bx, dx
    mov cx, word ptr [bp - 0Ch]
L_B9B1:
    mov al, byte ptr [bx]
    stosb
    add bx, word ptr [bp - 0Eh]
    loop L_B9B1
    inc dx
    cmp dx, word ptr [bp - 0Eh]
    jne L_B9A7
    jmp L_BA44
L_B9C2:
    mov bx, dx
    shr bx, 1
    add bx, 10h
    add bx, si
    mov cx, word ptr [bp - 0Ch]
L_B9CE:
    mov al, byte ptr [bx]
    stosb
    add bx, word ptr [bp - 0Eh]
    loop L_B9CE
    add di, word ptr [bp - 0Ch]
    inc dx
    inc dx
    cmp dx, word ptr [bp - 0Eh]
    jb L_B9C2
    mov dx, 1
    mov di, word ptr [bp - 8]
    add di, word ptr [bp - 0Ch]
L_B9E9:
    mov bx, dx
    add bx, word ptr [bp - 0Eh]
    shr bx, 1
    add bx, 10h
    add bx, si
    mov cx, word ptr [bp - 0Ch]
L_B9F8:
    mov al, byte ptr [bx]
    stosb
    add bx, word ptr [bp - 0Eh]
    loop L_B9F8
    add di, word ptr [bp - 0Ch]
    inc dx
    inc dx
    cmp dx, word ptr [bp - 0Eh]
    jb L_B9E9
    jmp SHORT L_BA44
    nop
L_BA0D:
    mov bx, dx
    shr bx, 1
    add bx, 10h
    add bx, word ptr [bp - 6]
    mov cx, word ptr [bp - 0Ch]
    mov si, word ptr [bp - 0Eh]
    shr si, 1
    adc si, 0
L_BA22:
    mov al, byte ptr [bx]
    stosb
    add bx, si
    loop L_BA22
    inc dx
    cmp dx, word ptr [bp - 0Eh]
    je L_BA44
    mov cx, word ptr [bp - 0Ch]
    mov si, word ptr [bp - 0Eh]
    shr si, 1
L_BA37:
    mov al, byte ptr [bx]
    stosb
    add bx, si
    loop L_BA37
    inc dx
    cmp dx, word ptr [bp - 0Eh]
    jne L_BA0D
L_BA44:
    mov di, word ptr [bp - 6]
    mov ax, ds
    mov es, ax
    add di, 10h
    mov si, word ptr [bp - 8]
    mov ds, word ptr [bp - 0Ah]
    mov ax, word ptr [bp - 0Ch]
    mul word ptr [bp - 0Eh]
    mov cx, ax
    shr cx, 1
    jb L_BA65
    rep movsw
    jmp L_B97D
L_BA65:
    rep movsw
    movsb
    jmp L_B97D
_fn_circuit_cga_0b914 ENDP
_TEXT ENDS
END
