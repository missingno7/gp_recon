.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _grp_1499ba74:NEAR
EXTRN _grp_d6da2a1e:NEAR
EXTRN _CS_G_0C7BC:WORD
EXTRN _G_4E94:WORD
EXTRN _G_4E9E:WORD
PUBLIC _fn_circuit_ega_0b184
PUBLIC _fn_circuit_ega_0b1b6
_fn_circuit_ega_0b184 PROC NEAR
    push bp
    mov bp, sp
    mov ax, 0B492h
    mov word ptr [bp - 40h], ax
    mov ax, 0B4A2h
    mov word ptr [bp - 4Ah], ax
    mov byte ptr [bp - 42h], 0
    mov byte ptr [bp - 41h], 3
    push ds
    push si
    push di
    sub sp, 44h
    mov ds, word ptr [bp + 6]
    mov si, word ptr [bp + 4]
    mov ax, word ptr [bp + 8]
    mov word ptr [bp - 8], ax
    mov ax, word ptr [bp + 0Ah]
    mov word ptr [bp - 0Ah], ax
    jmp short L_B1E5
    nop
_fn_circuit_ega_0b184 ENDP
_fn_circuit_ega_0b1b6 PROC NEAR
    push bp
    mov bp, sp
    mov ax, 0B492h
    mov word ptr [bp - 40h], ax
    mov ax, 0B4A2h
    mov word ptr [bp - 4Ah], ax
    mov byte ptr [bp - 42h], 0
    mov byte ptr [bp - 41h], 3
    push ds
    push si
    push di
    sub sp, 44h
    mov ds, word ptr [bp + 6]
    mov si, word ptr [bp + 4]
    mov ax, word ptr [si + 8]
    mov word ptr [bp - 8], ax
    mov ax, word ptr [si + 0Ah]
    mov word ptr [bp - 0Ah], ax
L_B1E5:
    cld
    mov ax, word ptr [si + 2]
    mov word ptr [bp - 0Eh], ax
    lea ax, [si + 10h]
    mov word ptr [bp - 28h], ax
    mov ax, word ptr [si]
    mov word ptr [bp - 0Ch], ax
    mov bx, word ptr [bp - 8]
    mov ax, bx
    and ax, 7
    mov word ptr [bp - 34h], ax
    sar bx, 1
    sar bx, 1
    sar bx, 1
    mov word ptr [bp - 8], bx
    mov bx, word ptr [bp - 0Ah]
    shl bx, 1
    add bx, word ptr cs:_G_4E94
    mov ax, word ptr [bp - 8]
    add ax, word ptr cs:[bx]
    mov word ptr [bp - 2Ah], ax
    mov ax, word ptr [si + 2]
    mul byte ptr [si]
    test byte ptr [si + 0Fh], 0F0h
    je short L_B238
    mov dl, byte ptr [si + 0Fh]
    shr dl, 1
    shr dl, 1
    shr dl, 1
    shr dl, 1
    xor dh, dh
    add ax, dx
L_B238:
    mov word ptr [bp - 38h], ax
    mov ax, word ptr cs:_G_4E9E
    sub ax, word ptr [bp - 0Ch]
    mov word ptr [bp - 2Ch], ax
    cmp word ptr cs:_CS_G_0C7BC, 0A000h
    jne short L_B251
    jmp near ptr L_B355
L_B251:
    lea si, [si + 0Ch]
    xor di, di
    mov dx, word ptr [bp - 28h]
L_B259:
    mov bl, byte ptr [si]
    and bx, 0Fh
    je short L_B293
L_B260:
    or bx, bx
    je short L_B288
    mov cx, bx
    mov bl, byte ptr cs:[bx - 4EDCh]
    and cl, byte ptr cs:[bx - 4EBCh]
    shl bx, 1
    mov ax, word ptr cs:[bx - 3844h]
    mov bx, cx
    or ax, ax
    je short L_B260
    mov word ptr [bp + di - 16h], ax
    mov word ptr [bp + di - 1Eh], dx
    add di, 2
    jmp short L_B260
L_B288:
    cmp di, 8
    jge short L_B293
    inc si
    add dx, word ptr [bp - 38h]
    jmp short L_B259
L_B293:
    sub di, 2
    mov word ptr [bp - 3Ah], di
    mov si, word ptr [bp + 4]
    test byte ptr [si + 0Ch], 0F0h
    je short L_B2E7
    test byte ptr [bp - 41h], 1
    je short L_B2E7
    mov byte ptr [bp - 44h], 10h
    mov word ptr [bp - 46h], 0
L_B2B1:
    mov al, byte ptr [bp - 44h]
    test byte ptr [si + 0Ch], al
    je short L_B2DE
    mov bx, word ptr [bp - 46h]
    mov ax, word ptr cs:[bx - 3844h]
    or ax, ax
    je short L_B2DE
    mov es, ax
    mov di, word ptr [bp - 2Ah]
    mov dx, word ptr [bp - 0Ch]
    mov si, word ptr [bp - 0Eh]
    mov cx, word ptr [bp - 2Ch]
    mov bx, word ptr [bp - 34h]
    mov al, 3
    call near ptr _grp_1499ba74
    mov si, word ptr [bp + 4]
L_B2DE:
    add word ptr [bp - 46h], 2
    shl byte ptr [bp - 44h], 1
    jae short L_B2B1
L_B2E7:
    test byte ptr [si + 0Dh], 0F0h
    je short L_B341
    test byte ptr [bp - 41h], 6
    je short L_B341
    mov ax, 928Ch
    test byte ptr [bp - 41h], 4
    je short L_B2FF
    mov ax, 92F2h
L_B2FF:
    mov word ptr [bp - 48h], ax
    mov byte ptr [bp - 44h], 10h
    mov word ptr [bp - 46h], 0
L_B30B:
    mov al, byte ptr [bp - 44h]
    test byte ptr [si + 0Dh], al
    je short L_B338
    mov bx, word ptr [bp - 46h]
    mov ax, word ptr cs:[bx - 3844h]
    or ax, ax
    je short L_B338
    mov es, ax
    mov di, word ptr [bp - 2Ah]
    mov dx, word ptr [bp - 0Ch]
    mov si, word ptr [bp - 0Eh]
    mov cx, word ptr [bp - 2Ch]
    mov bx, word ptr [bp - 34h]
    mov al, 3
    call word ptr [bp - 48h]
    mov si, word ptr [bp + 4]
L_B338:
    add word ptr [bp - 46h], 2
    shl byte ptr [bp - 44h], 1
    jae short L_B30B
L_B341:
    cmp word ptr [bp - 3Ah], 0
    jl short L_B352
    mov bx, word ptr [bp - 34h]
    shl bx, 1
    add bx, word ptr [bp - 40h]
    jmp word ptr cs:[bx]
L_B352:
    jmp near ptr L_B4D4
L_B355:
    mov dx, 3CEh
    mov al, 3
    out dx, al
    inc dx
    mov al, byte ptr [bp - 42h]
    out dx, al
    mov es, word ptr cs:_CS_G_0C7BC
    mov ax, word ptr [bp - 38h]
    sub ax, word ptr [bp - 0Ch]
    mov word ptr [bp - 30h], ax
    lea si, [si + 0Ch]
    xor di, di
    mov cx, 4
    xor bx, bx
    mov word ptr [bp - 32h], 0
L_B37D:
    mov bl, byte ptr [si]
    and bx, 0Fh
    je short L_B3B1
    mov dx, word ptr [bp - 0Ch]
    neg dx
L_B389:
    mov ah, byte ptr cs:[bx - 4EDCh]
    mov al, byte ptr cs:[bx - 4ECCh]
    mov word ptr [bp + di - 26h], ax
    mov word ptr [bp + di - 1Eh], dx
    add di, 2
    not ax
    and bx, ax
    jne short L_B389
    mov dx, word ptr [bp - 30h]
    mov word ptr [bp + di - 20h], dx
    mov dx, word ptr [bp - 38h]
    add word ptr [bp - 32h], dx
    inc si
    loop short L_B37D
L_B3B1:
    lea ax, [bp + di - 26h]
    mov word ptr [bp - 3Ch], ax
    mov dx, word ptr [bp - 0Ch]
    sub word ptr [bp - 32h], dx
    mov si, word ptr [bp + 4]
    test byte ptr [si + 0Ch], 0F0h
    je short L_B416
    test byte ptr [bp - 41h], 1
    je short L_B416
    mov byte ptr [bp - 44h], 10h
    mov word ptr [bp - 46h], 0
L_B3D5:
    mov al, byte ptr [bp - 44h]
    test byte ptr [si + 0Ch], al
    je short L_B40E
    mov bx, word ptr [bp - 46h]
    mov dx, 3CEh
    mov al, 4
    out dx, al
    inc dx
    mov al, bl
    out dx, al
    mov dx, 3C4h
    mov al, 2
    out dx, al
    inc dx
    mov al, byte ptr cs:[bx - 4EB8h]
    out dx, al
    mov di, word ptr [bp - 2Ah]
    mov dx, word ptr [bp - 0Ch]
    mov si, word ptr [bp - 0Eh]
    mov cx, word ptr [bp - 2Ch]
    mov bx, word ptr [bp - 34h]
    mov al, 3
    call near ptr _grp_d6da2a1e
    mov si, word ptr [bp + 4]
L_B40E:
    inc word ptr [bp - 46h]
    shl byte ptr [bp - 44h], 1
    jae short L_B3D5
L_B416:
    test byte ptr [si + 0Dh], 0F0h
    je short L_B47C
    test byte ptr [bp - 41h], 6
    je short L_B47C
    mov ax, 0C6E3h
    test byte ptr [bp - 41h], 4
    je short L_B42E
    mov ax, 0C74Ch
L_B42E:
    mov word ptr [bp - 48h], ax
    mov byte ptr [bp - 44h], 10h
    mov word ptr [bp - 46h], 0
L_B43A:
    mov al, byte ptr [bp - 44h]
    test byte ptr [si + 0Dh], al
    je short L_B473
    mov bx, word ptr [bp - 46h]
    mov dx, 3CEh
    mov al, 4
    out dx, al
    inc dx
    mov al, bl
    out dx, al
    mov dx, 3C4h
    mov al, 2
    out dx, al
    inc dx
    mov al, byte ptr cs:[bx - 4EB8h]
    out dx, al
    mov di, word ptr [bp - 2Ah]
    mov dx, word ptr [bp - 0Ch]
    mov si, word ptr [bp - 0Eh]
    mov cx, word ptr [bp - 2Ch]
    mov bx, word ptr [bp - 34h]
    mov al, 3
    call word ptr [bp - 48h]
    mov si, word ptr [bp + 4]
L_B473:
    add word ptr [bp - 46h], 1
    shl byte ptr [bp - 44h], 1
    jae short L_B43A
L_B47C:
    lea ax, [bp - 26h]
    cmp ax, word ptr [bp - 3Ch]
    je short L_B48F
    mov bx, word ptr [bp - 34h]
    shl bx, 1
    add bx, word ptr [bp - 4Ah]
    jmp word ptr cs:[bx]
L_B48F:
    jmp near ptr L_B6D9
L_B492:
    dw 0B4B2h, 0B4DCh, 0B518h, 0B557h, 0B598h, 0B5DBh, 0B61Eh, 0B65Fh
    dw 0B69Eh, 0B720h, 0B77Fh, 0B7E0h, 0B843h, 0B8A8h, 0B90Dh, 0B970h
    mov dx, word ptr [bp - 2Ch]
L_B4B5:
    mov si, word ptr [bp - 3Ah]
    mov es, word ptr [bp + si - 16h]
    mov di, word ptr [bp - 2Ah]
    mov si, word ptr [bp + si - 1Eh]
    mov bx, word ptr [bp - 0Eh]
L_B4C4:
    mov cx, word ptr [bp - 0Ch]
    rep movsb
    add di, dx
    dec bx
    jg short L_B4C4
    sub byte ptr [bp - 3Ah], 2
    jge short L_B4B5
L_B4D4:
    add sp, 44h
    pop di
    pop si
    pop ds
    pop bp
    ret
L_B4DC:
    mov si, word ptr [bp - 3Ah]
    mov es, word ptr [bp + si - 16h]
    mov di, word ptr [bp - 2Ah]
    mov si, word ptr [bp + si - 1Eh]
    mov bx, word ptr [bp - 0Eh]
L_B4EB:
    mov cx, word ptr [bp - 0Ch]
    mov dh, byte ptr es:[di]
    and dh, 80h
L_B4F4:
    xor ah, ah
    lodsb
    ror ax, 1
    or al, dh
    mov dh, ah
    stosb
    loop short L_B4F4
    mov al, byte ptr es:[di]
    and al, 7Fh
    or al, dh
    mov byte ptr es:[di], al
    add di, word ptr [bp - 2Ch]
    dec bx
    jg short L_B4EB
    sub byte ptr [bp - 3Ah], 2
    jge short L_B4DC
    jmp short L_B4D4
L_B518:
    mov si, word ptr [bp - 3Ah]
    mov es, word ptr [bp + si - 16h]
    mov di, word ptr [bp - 2Ah]
    mov si, word ptr [bp + si - 1Eh]
    mov bx, word ptr [bp - 0Eh]
L_B527:
    mov cx, word ptr [bp - 0Ch]
    mov dh, byte ptr es:[di]
    and dh, 0C0h
L_B530:
    xor ah, ah
    lodsb
    ror ax, 1
    ror ax, 1
    or al, dh
    mov dh, ah
    stosb
    loop short L_B530
    mov al, byte ptr es:[di]
    and al, 3Fh
    or al, dh
    mov byte ptr es:[di], al
    add di, word ptr [bp - 2Ch]
    dec bx
    jg short L_B527
    sub byte ptr [bp - 3Ah], 2
    jge short L_B518
    jmp near ptr L_B4D4
L_B557:
    mov si, word ptr [bp - 3Ah]
    mov es, word ptr [bp + si - 16h]
    mov di, word ptr [bp - 2Ah]
    mov si, word ptr [bp + si - 1Eh]
    mov bx, word ptr [bp - 0Eh]
L_B566:
    mov cx, word ptr [bp - 0Ch]
    mov dh, byte ptr es:[di]
    and dh, 0E0h
L_B56F:
    xor ah, ah
    lodsb
    ror ax, 1
    ror ax, 1
    ror ax, 1
    or al, dh
    mov dh, ah
    stosb
    loop short L_B56F
    mov al, byte ptr es:[di]
    and al, 1Fh
    or al, dh
    mov byte ptr es:[di], al
    add di, word ptr [bp - 2Ch]
    dec bx
    jg short L_B566
    sub byte ptr [bp - 3Ah], 2
    jge short L_B557
    jmp near ptr L_B4D4
L_B598:
    mov si, word ptr [bp - 3Ah]
    mov es, word ptr [bp + si - 16h]
    mov di, word ptr [bp - 2Ah]
    mov si, word ptr [bp + si - 1Eh]
    mov bx, word ptr [bp - 0Eh]
L_B5A7:
    mov cx, word ptr [bp - 0Ch]
    mov dh, byte ptr es:[di]
    and dh, 0F0h
L_B5B0:
    xor ah, ah
    lodsb
    ror ax, 1
    ror ax, 1
    ror ax, 1
    ror ax, 1
    or al, dh
    mov dh, ah
    stosb
    loop short L_B5B0
    mov al, byte ptr es:[di]
    and al, 0Fh
    or al, dh
    mov byte ptr es:[di], al
    add di, word ptr [bp - 2Ch]
    dec bx
    jg short L_B5A7
    sub byte ptr [bp - 3Ah], 2
    jge short L_B598
    jmp near ptr L_B4D4
L_B5DB:
    mov si, word ptr [bp - 3Ah]
    mov es, word ptr [bp + si - 16h]
    mov di, word ptr [bp - 2Ah]
    mov si, word ptr [bp + si - 1Eh]
    mov bx, word ptr [bp - 0Eh]
L_B5EA:
    mov cx, word ptr [bp - 0Ch]
    mov dh, byte ptr es:[di]
    and dh, 0F8h
L_B5F3:
    xor ah, ah
    lodsb
    rol ax, 1
    rol ax, 1
    rol ax, 1
    xchg al, ah
    or al, dh
    mov dh, ah
    stosb
    loop short L_B5F3
    mov al, byte ptr es:[di]
    and al, 7
    or al, dh
    mov byte ptr es:[di], al
    add di, word ptr [bp - 2Ch]
    dec bx
    jg short L_B5EA
    sub byte ptr [bp - 3Ah], 2
    jge short L_B5DB
    jmp near ptr L_B4D4
L_B61E:
    mov si, word ptr [bp - 3Ah]
    mov es, word ptr [bp + si - 16h]
    mov di, word ptr [bp - 2Ah]
    mov si, word ptr [bp + si - 1Eh]
    mov bx, word ptr [bp - 0Eh]
L_B62D:
    mov cx, word ptr [bp - 0Ch]
    mov dh, byte ptr es:[di]
    and dh, 0FCh
L_B636:
    xor ah, ah
    lodsb
    rol ax, 1
    rol ax, 1
    xchg al, ah
    or al, dh
    mov dh, ah
    stosb
    loop short L_B636
    mov al, byte ptr es:[di]
    and al, 3
    or al, dh
    mov byte ptr es:[di], al
    add di, word ptr [bp - 2Ch]
    dec bx
    jg short L_B62D
    sub byte ptr [bp - 3Ah], 2
    jge short L_B61E
    jmp near ptr L_B4D4
L_B65F:
    mov si, word ptr [bp - 3Ah]
    mov es, word ptr [bp + si - 16h]
    mov di, word ptr [bp - 2Ah]
    mov si, word ptr [bp + si - 1Eh]
    mov bx, word ptr [bp - 0Eh]
L_B66E:
    mov cx, word ptr [bp - 0Ch]
    mov dh, byte ptr es:[di]
    and dh, 0FEh
L_B677:
    xor ah, ah
    lodsb
    rol ax, 1
    xchg al, ah
    or al, dh
    mov dh, ah
    stosb
    loop short L_B677
    mov al, byte ptr es:[di]
    and al, 1
    or al, dh
    mov byte ptr es:[di], al
    add di, word ptr [bp - 2Ch]
    dec bx
    jg short L_B66E
    sub byte ptr [bp - 3Ah], 2
    jge short L_B65F
    jmp near ptr L_B4D4
    mov si, word ptr [bp - 28h]
    mov di, word ptr [bp - 2Ah]
    cmp byte ptr [bp - 42h], 0
    jne short L_B6EB
L_B6AA:
    lea bx, [bp - 26h]
L_B6AD:
    mov cx, word ptr ss:[bx]
    mov dx, 3C4h
    mov al, 2
    out dx, al
    inc dx
    mov al, cl
    out dx, al
    mov cx, word ptr [bp - 0Ch]
    rep movsb
    sub di, word ptr [bp - 0Ch]
    add si, word ptr ss:[bx + 8]
    add bx, 2
    cmp bx, word ptr [bp - 3Ch]
    jb short L_B6AD
    add di, 28h
    sub si, word ptr [bp - 32h]
    dec word ptr [bp - 0Eh]
    jg short L_B6AA
L_B6D9:
    mov dx, 3CEh
    mov al, 3
    out dx, al
    inc dx
    mov al, 0
    out dx, al
    add sp, 44h
    pop di
    pop si
    pop ds
    pop bp
    ret
L_B6EB:
    lea bx, [bp - 26h]
L_B6EE:
    mov cx, word ptr ss:[bx]
    mov dx, 3C4h
    mov al, 2
    out dx, al
    inc dx
    mov al, cl
    out dx, al
    mov cx, word ptr [bp - 0Ch]
L_B6FE:
    mov ah, byte ptr es:[di]
    movsb
    loop short L_B6FE
    sub di, word ptr [bp - 0Ch]
    add si, word ptr ss:[bx + 8]
    add bx, 2
    cmp bx, word ptr [bp - 3Ch]
    jb short L_B6EE
    add di, 28h
    sub si, word ptr [bp - 32h]
    dec word ptr [bp - 0Eh]
    jg short L_B6EB
    jmp short L_B6D9
    mov si, word ptr [bp - 28h]
    mov di, word ptr [bp - 2Ah]
L_B726:
    lea bx, [bp - 26h]
L_B729:
    mov cx, word ptr ss:[bx]
    mov dx, 3C4h
    mov al, 2
    out dx, al
    inc dx
    mov al, cl
    out dx, al
    mov dx, 3CEh
    mov al, 4
    out dx, al
    inc dx
    mov al, ch
    out dx, al
    mov cx, word ptr [bp - 0Ch]
    mov dh, byte ptr es:[di]
    and dh, 80h
L_B749:
    xor ah, ah
    lodsb
    ror ax, 1
    or al, dh
    mov dh, ah
    stosb
    mov ah, byte ptr es:[di]
    loop short L_B749
    mov al, byte ptr es:[di]
    and al, 7Fh
    or al, dh
    mov byte ptr es:[di], al
    sub di, word ptr [bp - 0Ch]
    add si, word ptr ss:[bx + 8]
    add bx, 2
    cmp bx, word ptr [bp - 3Ch]
    jb short L_B729
    add di, 28h
    sub si, word ptr [bp - 32h]
    dec word ptr [bp - 0Eh]
    jg short L_B726
    jmp near ptr L_B6D9
    mov si, word ptr [bp - 28h]
    mov di, word ptr [bp - 2Ah]
L_B785:
    lea bx, [bp - 26h]
L_B788:
    mov cx, word ptr ss:[bx]
    mov dx, 3C4h
    mov al, 2
    out dx, al
    inc dx
    mov al, cl
    out dx, al
    mov dx, 3CEh
    mov al, 4
    out dx, al
    inc dx
    mov al, ch
    out dx, al
    mov cx, word ptr [bp - 0Ch]
    mov dh, byte ptr es:[di]
    and dh, 0C0h
L_B7A8:
    xor ah, ah
    lodsb
    ror ax, 1
    ror ax, 1
    or al, dh
    mov dh, ah
    stosb
    mov ah, byte ptr es:[di]
    loop short L_B7A8
    mov al, byte ptr es:[di]
    and al, 3Fh
    or al, dh
    mov byte ptr es:[di], al
    sub di, word ptr [bp - 0Ch]
    add si, word ptr ss:[bx + 8]
    add bx, 2
    cmp bx, word ptr [bp - 3Ch]
    jb short L_B788
    add di, 28h
    sub si, word ptr [bp - 32h]
    dec word ptr [bp - 0Eh]
    jg short L_B785
    jmp near ptr L_B6D9
    mov si, word ptr [bp - 28h]
    mov di, word ptr [bp - 2Ah]
L_B7E6:
    lea bx, [bp - 26h]
L_B7E9:
    mov cx, word ptr ss:[bx]
    mov dx, 3C4h
    mov al, 2
    out dx, al
    inc dx
    mov al, cl
    out dx, al
    mov dx, 3CEh
    mov al, 4
    out dx, al
    inc dx
    mov al, ch
    out dx, al
    mov cx, word ptr [bp - 0Ch]
    mov dh, byte ptr es:[di]
    and dh, 0E0h
L_B809:
    xor ah, ah
    lodsb
    ror ax, 1
    ror ax, 1
    ror ax, 1
    or al, dh
    mov dh, ah
    stosb
    mov ah, byte ptr es:[di]
    loop short L_B809
    mov al, byte ptr es:[di]
    and al, 1Fh
    or al, dh
    mov byte ptr es:[di], al
    sub di, word ptr [bp - 0Ch]
    add si, word ptr ss:[bx + 8]
    add bx, 2
    cmp bx, word ptr [bp - 3Ch]
    jb short L_B7E9
    add di, 28h
    sub si, word ptr [bp - 32h]
    dec word ptr [bp - 0Eh]
    jg short L_B7E6
    jmp near ptr L_B6D9
    mov si, word ptr [bp - 28h]
    mov di, word ptr [bp - 2Ah]
L_B849:
    lea bx, [bp - 26h]
L_B84C:
    mov cx, word ptr ss:[bx]
    mov dx, 3C4h
    mov al, 2
    out dx, al
    inc dx
    mov al, cl
    out dx, al
    mov dx, 3CEh
    mov al, 4
    out dx, al
    inc dx
    mov al, ch
    out dx, al
    mov cx, word ptr [bp - 0Ch]
    mov dh, byte ptr es:[di]
    and dh, 0F0h
L_B86C:
    xor ah, ah
    lodsb
    ror ax, 1
    ror ax, 1
    ror ax, 1
    ror ax, 1
    or al, dh
    mov dh, ah
    stosb
    mov ah, byte ptr es:[di]
    loop short L_B86C
    mov al, byte ptr es:[di]
    and al, 0Fh
    or al, dh
    mov byte ptr es:[di], al
    sub di, word ptr [bp - 0Ch]
    add si, word ptr ss:[bx + 8]
    add bx, 2
    cmp bx, word ptr [bp - 3Ch]
    jb short L_B84C
    add di, 28h
    sub si, word ptr [bp - 32h]
    dec word ptr [bp - 0Eh]
    jg short L_B849
    jmp near ptr L_B6D9
    mov si, word ptr [bp - 28h]
    mov di, word ptr [bp - 2Ah]
L_B8AE:
    lea bx, [bp - 26h]
L_B8B1:
    mov cx, word ptr ss:[bx]
    mov dx, 3C4h
    mov al, 2
    out dx, al
    inc dx
    mov al, cl
    out dx, al
    mov dx, 3CEh
    mov al, 4
    out dx, al
    inc dx
    mov al, ch
    out dx, al
    mov cx, word ptr [bp - 0Ch]
    mov dh, byte ptr es:[di]
    and dh, 0F8h
L_B8D1:
    xor ah, ah
    lodsb
    rol ax, 1
    rol ax, 1
    rol ax, 1
    xchg al, ah
    or al, dh
    mov dh, ah
    stosb
    mov ah, byte ptr es:[di]
    loop short L_B8D1
    mov al, byte ptr es:[di]
    and al, 7
    or al, dh
    mov byte ptr es:[di], al
    sub di, word ptr [bp - 0Ch]
    add si, word ptr ss:[bx + 8]
    add bx, 2
    cmp bx, word ptr [bp - 3Ch]
    jb short L_B8B1
    add di, 28h
    sub si, word ptr [bp - 32h]
    dec word ptr [bp - 0Eh]
    jg short L_B8AE
    jmp near ptr L_B6D9
    mov si, word ptr [bp - 28h]
    mov di, word ptr [bp - 2Ah]
L_B913:
    lea bx, [bp - 26h]
L_B916:
    mov cx, word ptr ss:[bx]
    mov dx, 3C4h
    mov al, 2
    out dx, al
    inc dx
    mov al, cl
    out dx, al
    mov dx, 3CEh
    mov al, 4
    out dx, al
    inc dx
    mov al, ch
    out dx, al
    mov cx, word ptr [bp - 0Ch]
    mov dh, byte ptr es:[di]
    and dh, 0FCh
L_B936:
    xor ah, ah
    lodsb
    rol ax, 1
    rol ax, 1
    xchg al, ah
    or al, dh
    mov dh, ah
    stosb
    mov ah, byte ptr es:[di]
    loop short L_B936
    mov al, byte ptr es:[di]
    and al, 3
    or al, dh
    mov byte ptr es:[di], al
    sub di, word ptr [bp - 0Ch]
    add si, word ptr ss:[bx + 8]
    add bx, 2
    cmp bx, word ptr [bp - 3Ch]
    jb short L_B916
    add di, 28h
    sub si, word ptr [bp - 32h]
    dec word ptr [bp - 0Eh]
    jg short L_B913
    jmp near ptr L_B6D9
    mov si, word ptr [bp - 28h]
    mov di, word ptr [bp - 2Ah]
L_B976:
    lea bx, [bp - 26h]
L_B979:
    mov cx, word ptr ss:[bx]
    mov dx, 3C4h
    mov al, 2
    out dx, al
    inc dx
    mov al, cl
    out dx, al
    mov dx, 3CEh
    mov al, 4
    out dx, al
    inc dx
    mov al, ch
    out dx, al
    mov cx, word ptr [bp - 0Ch]
    mov dh, byte ptr es:[di]
    and dh, 0FEh
L_B999:
    xor ah, ah
    lodsb
    rol ax, 1
    xchg al, ah
    or al, dh
    mov dh, ah
    stosb
    mov ah, byte ptr es:[di]
    loop short L_B999
    mov al, byte ptr es:[di]
    and al, 1
    or al, dh
    mov byte ptr es:[di], al
    sub di, word ptr [bp - 0Ch]
    add si, word ptr ss:[bx + 8]
    add bx, 2
    cmp bx, word ptr [bp - 3Ch]
    jb short L_B979
    add di, 28h
    sub si, word ptr [bp - 32h]
    dec word ptr [bp - 0Eh]
    jg short L_B976
    jmp near ptr L_B6D9
_fn_circuit_ega_0b1b6 ENDP
_TEXT ENDS
END
