.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _g_cir_seg0000_679d:WORD
EXTRN _g_cir_seg0000_67a5:WORD
EXTRN _g_cir_seg0000_67c9:WORD
EXTRN _g_cir_seg0000_6813:WORD
EXTRN _g_cir_seg0000_6862:WORD
EXTRN _CS_G_0C7BC:WORD
EXTRN _G_480A:WORD
EXTRN _G_480C:WORD
EXTRN _G_480E:WORD
EXTRN _G_4810:WORD
EXTRN _CS_G_0C7CC:WORD
PUBLIC _fn_circuit_cga_066a8
_fn_circuit_cga_066a8 PROC NEAR
_L_66A8:
    push bp
    mov bp, sp
    push ds
    push di
    push si
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
    jl SHORT _L_66EA
    add ax, cx
    sub ax, WORD PTR CS:_CS_G_0C7CC
    jle SHORT _L_670B
    sub cx, ax
    jg SHORT _L_670B
_L_66E2:
    add sp, 10h
    pop si
    pop di
    pop ds
    pop bp
    ret
_L_66EA:
    mov bx, WORD PTR CS:_G_4810
    add ax, cx
    sub ax, bx
    jle SHORT _L_66E2
    xchg ax, cx
    sub ax, cx
    mul BYTE PTR [si]
    add dx, ax
    mov ax, bx
    add ax, cx
    sub ax, WORD PTR CS:_CS_G_0C7CC
    jle SHORT _L_670B
    sub cx, ax
    jle SHORT _L_66E2
_L_670B:
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
    jl SHORT _L_674A
    add ax, cx
    sub ax, WORD PTR CS:_G_480E
    jl SHORT _L_6777
    mov BYTE PTR [bp - 14h], 2
    sub cx, ax
    jle SHORT _L_66E2
    mov dx, ax
    jmp SHORT _L_6777
    nop
_L_674A:
    mov bx, WORD PTR CS:_G_480C
    add ax, cx
    sub ax, bx
    jl SHORT _L_66E2
    mov si, cx
    sub si, ax
    add WORD PTR [bp - 12h], si
    mov BYTE PTR [bp - 14h], 1
    mov si, WORD PTR CS:_G_480E
    sub si, bx
    cmp ax, si
    jl SHORT _L_6771
    mov ax, si
    mov BYTE PTR [bp - 14h], 0
_L_6771:
    xchg cx, dx
    sub dx, ax
    add cx, ax
_L_6777:
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
    jmp WORD PTR CS:[DI+_g_cir_seg0000_679d]
    DW OFFSET _g_cir_seg0000_67a5
    DW OFFSET _g_cir_seg0000_67c9
    DW OFFSET _g_cir_seg0000_6813
    DW OFFSET _g_cir_seg0000_6862
_L_67A5:
    mov dx, WORD PTR [bp - 10h]
    cmp WORD PTR [bp - 0Ch], 0
    je SHORT _L_67C6
_L_67AE:
    mov di, WORD PTR CS:[BX]
    add di, WORD PTR [bp - 8]
    mov cx, WORD PTR [bp - 0Ch]
_L_67B7:
    lodsb
    and BYTE PTR es:[di], al
    inc di
    loop SHORT _L_67B7
    add si, WORD PTR [bp - 0Eh]
    inc bx
    inc bx
    dec dx
    jg SHORT _L_67AE
_L_67C6:
    jmp NEAR PTR _L_66E2
_L_67C9:
    mov dl, BYTE PTR [bp - 14h]
_L_67CC:
    mov di, WORD PTR CS:[BX]
    add di, WORD PTR [bp - 8]
    mov cx, WORD PTR [bp - 0Ch]
    mov dh, 0C0h
    test dl, 2
    jne SHORT _L_67EA
    mov dh, BYTE PTR [si - 1]
    ror dh, 1
    ror dh, 1
    and dh, 0C0h
    or cx, cx
    je SHORT _L_6800
_L_67EA:
    xor ah, ah
    lodsb
    ror ax, 1
    ror ax, 1
    or al, dh
    mov dh, ah
    and BYTE PTR es:[di], al
    inc di
    loop SHORT _L_67EA
    test dl, 1
    je SHORT _L_6806
_L_6800:
    or dh, 3Fh
    and BYTE PTR es:[di], dh
_L_6806:
    add si, WORD PTR [bp - 0Eh]
    inc bx
    inc bx
    dec WORD PTR [bp - 10h]
    jg SHORT _L_67CC
    jmp NEAR PTR _L_66E2
_L_6813:
    mov dl, BYTE PTR [bp - 14h]
_L_6816:
    mov di, WORD PTR CS:[BX]
    add di, WORD PTR [bp - 8]
    mov cx, WORD PTR [bp - 0Ch]
    mov dh, 0F0h
    test dl, 2
    jne SHORT _L_6835
    mov dh, BYTE PTR [si - 1]
    shl dh, 1
    shl dh, 1
    shl dh, 1
    shl dh, 1
    or cx, cx
    je SHORT _L_684F
_L_6835:
    xor ah, ah
    lodsb
    ror ax, 1
    ror ax, 1
    ror ax, 1
    ror ax, 1
    or al, dh
    mov dh, ah
    and BYTE PTR es:[di], al
    inc di
    loop SHORT _L_6835
    test dl, 1
    je SHORT _L_6855
_L_684F:
    or dh, 0Fh
    and BYTE PTR es:[di], dh
_L_6855:
    add si, WORD PTR [bp - 0Eh]
    inc bx
    inc bx
    dec WORD PTR [bp - 10h]
    jg SHORT _L_6816
    jmp NEAR PTR _L_66E2
_L_6862:
    mov dl, BYTE PTR [bp - 14h]
_L_6865:
    mov di, WORD PTR CS:[BX]
    add di, WORD PTR [bp - 8]
    mov cx, WORD PTR [bp - 0Ch]
    mov dh, 0FCh
    test dl, 2
    jne SHORT _L_6880
    mov dh, BYTE PTR [si - 1]
    shl dh, 1
    shl dh, 1
    or cx, cx
    je SHORT _L_6898
_L_6880:
    xor ah, ah
    lodsb
    rol ax, 1
    rol ax, 1
    xchg al, ah
    or al, dh
    mov dh, ah
    and BYTE PTR es:[di], al
    inc di
    loop SHORT _L_6880
    test dl, 1
    je SHORT _L_689E
_L_6898:
    or dh, 3
    and BYTE PTR es:[di], dh
_L_689E:
    add si, WORD PTR [bp - 0Eh]
    inc bx
    inc bx
    dec WORD PTR [bp - 10h]
    jg SHORT _L_6865
    jmp NEAR PTR _L_66E2
_fn_circuit_cga_066a8 ENDP
_TEXT ENDS
END
