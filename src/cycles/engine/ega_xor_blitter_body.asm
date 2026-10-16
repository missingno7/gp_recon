.386
_TEXT SEGMENT WORD PUBLIC USE16 'CODE'
ASSUME CS:_TEXT
PUBLIC _fn_cycles_ega_0b850
_fn_cycles_ega_0b850 PROC FAR
    jae SHORT $+66h
    shl BYTE PTR [si+2fh], 1
    mov fs, WORD PTR gs:[di-15h]
    mov dx, WORD PTR gs:[bp-2ch]
row1:
    mov si, WORD PTR [bp-3ah]
    mov es, WORD PTR [bp+si-16h]
    mov di, WORD PTR [bp-2ah]
    mov si, WORD PTR [bp+si-1eh]
    mov bx, WORD PTR [bp-0eh]
row1_loop:
    mov cx, WORD PTR [bp-0ch]
byte1:
    lodsb
    xor BYTE PTR es:[di], al
    inc di
    loop byte1
    add di, dx
    dec bx
    jg row1_loop
    sub BYTE PTR [bp-3ah], 2
    jge row1
epilogue:
    add sp, 44h
    pop di
    pop si
    pop ds
    pop bp
    retf
mode2:
    mov si, WORD PTR [bp-3ah]
    mov es, WORD PTR [bp+si-16h]
    mov di, WORD PTR [bp-2ah]
    mov si, WORD PTR [bp+si-1eh]
    mov bx, WORD PTR [bp-0eh]
row2_loop:
    mov cx, WORD PTR [bp-0ch]
    xor dh, dh
byte2:
    xor ah, ah
    lodsb
    ror ax, 1
    or al, dh
    mov dh, ah
    xor BYTE PTR es:[di], al
    inc di
    loop byte2
    xor BYTE PTR es:[di], dh
    add di, WORD PTR [bp-2ch]
    dec bx
    jg row2_loop
    sub BYTE PTR [bp-3ah], 2
    jge mode2
    jmp SHORT epilogue
_fn_cycles_ega_0b850 ENDP
_TEXT ENDS
END
