.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _g_cir_seg0000_5eb1:WORD
EXTRN _g_cir_seg0000_a14f:WORD
EXTRN _g_cir_seg0000_a157:WORD
EXTRN _g_cir_seg0000_a17b:WORD
EXTRN _g_cir_seg0000_a1c2:WORD
EXTRN _g_cir_seg0000_a20e:WORD
EXTRN _CS_G_0C7BC:WORD
EXTRN _G_480A:WORD
EXTRN _G_480C:WORD
EXTRN _G_480E:WORD
EXTRN _G_4810:WORD
EXTRN _CS_G_0C7CC:WORD
PUBLIC _fn_circuit_cga_0a05a
_fn_circuit_cga_0a05a PROC NEAR
_L_A05A:
    push bp
    mov bp, sp
    push ds
    push si
    push di
    sub sp, 10h
    mov ds, WORD PTR [bp + 6]
    mov si, WORD PTR [bp + 4]
    mov ax, WORD PTR [si + 8]
    mov WORD PTR [bp - 8], ax
    mov ax, WORD PTR [si + 0Ah]
    mov WORD PTR [bp - 0Ah], ax
    mov bx, WORD PTR [bp - 0Ah]
    mov cx, WORD PTR [si + 2]
    lea dx, [si + 10h]
    mov ax, bx
    cmp ax, WORD PTR CS:_G_4810
    jl SHORT _L_A09C
    add ax, cx
    sub ax, WORD PTR CS:_CS_G_0C7CC
    jle SHORT _L_A0BD
    sub cx, ax
    jg SHORT _L_A0BD
_L_A094:
    add sp, 10h
    pop di
    pop si
    pop ds
    pop bp
    ret
_L_A09C:
    mov bx, WORD PTR CS:_G_4810
    add ax, cx
    sub ax, bx
    jle SHORT _L_A094
    xchg ax, cx
    sub ax, cx
    mul BYTE PTR [si]
    add dx, ax
    mov ax, bx
    add ax, cx
    sub ax, WORD PTR CS:_CS_G_0C7CC
    jle SHORT _L_A0BD
    sub cx, ax
    jle SHORT _L_A094
_L_A0BD:
    mov WORD PTR [bp - 12h], dx
    mov WORD PTR [bp - 10h], cx
    mov WORD PTR [bp - 0Ah], bx
    mov BYTE PTR [bp - 14h], 3
    mov cx, WORD PTR [si]
    xor dx, dx
    mov bx, WORD PTR [bp - 8]
    mov ax, bx
    and ax, 3
    mov WORD PTR [bp - 16h], ax
    sar bx, 1
    sar bx, 1
    mov ax, bx
    cmp ax, WORD PTR CS:_G_480C
    jl SHORT _L_A0FC
    add ax, cx
    sub ax, WORD PTR CS:_G_480E
    jl SHORT _L_A129
    mov BYTE PTR [bp - 14h], 2
    sub cx, ax
    jle SHORT _L_A094
    mov dx, ax
    jmp SHORT _L_A129
    nop
_L_A0FC:
    mov bx, WORD PTR CS:_G_480C
    add ax, cx
    sub ax, bx
    jl SHORT _L_A094
    mov si, cx
    sub si, ax
    add WORD PTR [bp - 12h], si
    mov BYTE PTR [bp - 14h], 1
    mov si, WORD PTR CS:_G_480E
    sub si, bx
    cmp ax, si
    jl SHORT _L_A123
    mov ax, si
    mov BYTE PTR [bp - 14h], 0
_L_A123:
    xchg cx, dx
    sub dx, ax
    add cx, ax
_L_A129:
    mov WORD PTR [bp - 0Ch], cx
    mov WORD PTR [bp - 0Eh], dx
    mov WORD PTR [bp - 8], bx
    cld
    mov es, WORD PTR CS:_CS_G_0C7BC
    mov bx, WORD PTR [bp - 0Ah]
    shl bx, 1
    add bx, WORD PTR CS:_G_480A
    mov si, WORD PTR [bp - 12h]
    mov di, WORD PTR [bp - 16h]
    shl di, 1
    jmp WORD PTR CS:[DI+_g_cir_seg0000_a14f]
    DW OFFSET _g_cir_seg0000_a157
    DW OFFSET _g_cir_seg0000_a17b
    DW OFFSET _g_cir_seg0000_a1c2
    DW OFFSET _g_cir_seg0000_a20e
_L_A157:
    mov dx, WORD PTR [bp - 10h]
    cmp WORD PTR [bp - 0Ch], 0
    je SHORT _L_A178
_L_A160:
    mov di, WORD PTR CS:[BX]
    add di, WORD PTR [bp - 8]
    mov cx, WORD PTR [bp - 0Ch]
_L_A169:
    lodsb
    or BYTE PTR es:[di], al
    inc di
    loop SHORT _L_A169
    add si, WORD PTR [bp - 0Eh]
    inc bx
    inc bx
    dec dx
    jg SHORT _L_A160
_L_A178:
    jmp NEAR PTR _L_A094
_L_A17B:
    mov dl, BYTE PTR [bp - 14h]
_L_A17E:
    mov di, WORD PTR CS:[BX]
    add di, WORD PTR [bp - 8]
    mov cx, WORD PTR [bp - 0Ch]
    xor dh, dh
    test dl, 2
    jne SHORT _L_A19C
    mov dh, BYTE PTR [si - 1]
    ror dh, 1
    ror dh, 1
    and dh, 0C0h
    or cx, cx
    je SHORT _L_A1B2
_L_A19C:
    xor ah, ah
    lodsb
    ror ax, 1
    ror ax, 1
    or al, dh
    mov dh, ah
    or BYTE PTR es:[di], al
    inc di
    loop SHORT _L_A19C
    test dl, 1
    je SHORT _L_A1B5
_L_A1B2:
    or BYTE PTR es:[di], dh
_L_A1B5:
    add si, WORD PTR [bp - 0Eh]
    inc bx
    inc bx
    dec WORD PTR [bp - 10h]
    jg SHORT _L_A17E
    jmp NEAR PTR _L_A094
_L_A1C2:
    mov dl, BYTE PTR [bp - 14h]
_L_A1C5:
    mov di, WORD PTR CS:[BX]
    add di, WORD PTR [bp - 8]
    mov cx, WORD PTR [bp - 0Ch]
    xor dh, dh
    test dl, 2
    jne SHORT _L_A1E4
    mov dh, BYTE PTR [si - 1]
    shl dh, 1
    shl dh, 1
    shl dh, 1
    shl dh, 1
    or cx, cx
    je SHORT _L_A1FE
_L_A1E4:
    xor ah, ah
    lodsb
    ror ax, 1
    ror ax, 1
    ror ax, 1
    ror ax, 1
    or al, dh
    mov dh, ah
    or BYTE PTR es:[di], al
    inc di
    loop SHORT _L_A1E4
    test dl, 1
    je SHORT _L_A201
_L_A1FE:
    or BYTE PTR es:[di], dh
_L_A201:
    add si, WORD PTR [bp - 0Eh]
    inc bx
    inc bx
    dec WORD PTR [bp - 10h]
    jg SHORT _L_A1C5
    jmp NEAR PTR _L_A094
_L_A20E:
    mov dl, BYTE PTR [bp - 14h]
_L_A211:
    mov di, WORD PTR CS:[BX]
    add di, WORD PTR [bp - 8]
    mov cx, WORD PTR [bp - 0Ch]
    xor dh, dh
    test dl, 2
    jne SHORT _L_A22C
    mov dh, BYTE PTR [si - 1]
    shl dh, 1
    shl dh, 1
    or cx, cx
    je SHORT _L_A244
_L_A22C:
    xor ah, ah
    lodsb
    rol ax, 1
    rol ax, 1
    xchg al, ah
    or al, dh
    mov dh, ah
    or BYTE PTR es:[di], al
    inc di
    loop SHORT _L_A22C
    test dl, 1
    je SHORT _L_A247
_L_A244:
    or BYTE PTR es:[di], dh
_L_A247:
    add si, WORD PTR [bp - 0Eh]
    inc bx
    inc bx
    dec WORD PTR [bp - 10h]
    jg SHORT _L_A211
    jmp NEAR PTR _L_A094
_fn_circuit_cga_0a05a ENDP
_TEXT ENDS
END
