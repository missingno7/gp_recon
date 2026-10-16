        .286
EGA_PLANAR_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:EGA_PLANAR_TEXT
_g_cga_99ce EQU 099CEh
_g_cga_99d0 EQU 099D0h
        ORG 04CCCh
        PUBLIC _fn_cycles_ega_0a36c
_fn_cycles_ega_0a36c LABEL FAR
        push bp ; A36C
        mov bp, sp ; A36D
        sub sp, 012h ; A36F
        push ds ; A372
        push si ; A373
        push di ; A374
        mov ds, word ptr [bp + 8] ; A375
        mov di, word ptr [bp + 6] ; A378
        mov ax, word ptr [di + 8] ; A37B
        and ax, 0FFF8h ; A37E
        mov word ptr [bp - 2], ax ; A381
        mov ax, word ptr [di + 0Ah] ; A384
        mov word ptr [bp - 4], ax ; A387
        mov ax, word ptr [di] ; A38A
        mov word ptr [bp - 6], ax ; A38C
        mov ax, word ptr [di + 2] ; A38F
        mov word ptr [bp - 8], ax ; A392
        mov ax, word ptr [bp - 2] ; A395
        sar ax, 1 ; A398
        sar ax, 1 ; A39A
        sar ax, 1 ; A39C
        mov word ptr [bp - 2], ax ; A39E
        mov bx, word ptr [bp - 4] ; A3A1
        shl bx, 1 ; A3A4
        add bx, word ptr cs:[04E94h] ; A3A6
        mov ax, word ptr cs:[bx] ; A3AB
        add ax, word ptr [bp - 2] ; A3AE
        mov word ptr [bp - 0Ah], ax ; A3B1
        mov ax, word ptr cs:[04E9Eh] ; A3B4
        sub ax, word ptr [bp - 6] ; A3B8
        mov word ptr [bp - 0Ch], ax ; A3BB
        lea ax, [di + 0Ch] ; A3BE
        mov word ptr [bp - 010h], ax ; A3C1
        mov al, byte ptr [di + 0Fh] ; A3C4
        shr al, 1 ; A3C7
        shr al, 1 ; A3C9
        shr al, 1 ; A3CB
        shr al, 1 ; A3CD
        xor ah, ah ; A3CF
        mov word ptr [bp - 012h], ax ; A3D1
        lea di, [di + 010h] ; A3D4
        mov es, word ptr [bp + 8] ; A3D7
        mov word ptr [bp - 0Eh], 4 ; A3DA
        cld ; A3DF
        mov ax, word ptr cs:[04E8Ch] ; A3E0
        cmp ax, 0A000h ; A3E4
        jne L_A36C_SEGMENT_ROW ; A3E7
        mov ds, ax ; A3E9
L_A36C_PLANAR_ROW:
        mov bx, word ptr [bp - 010h] ; A3EB
        mov bx, word ptr es:[bx] ; A3EE
        and bx, 0Fh ; A3F1
        je L_A36C_PLANAR_NEXT ; A3F4
        mov cl, byte ptr cs:[bx + 04C74h] ; A3F6
        mov dx, 03CEh ; A3FB
        mov al, 4 ; A3FE
        out dx, al ; A400
        inc dx ; A401
        mov al, cl ; A402
        out dx, al ; A404
        mov si, word ptr [bp - 0Ah] ; A405
        mov dx, word ptr [bp - 8] ; A408
L_A36C_PLANAR_COPY:
        mov cx, word ptr [bp - 6] ; A40B
        rep movsb ; A40E
        add si, word ptr [bp - 0Ch] ; A410
        dec dx ; A413
        jg L_A36C_PLANAR_COPY ; A414
L_A36C_PLANAR_NEXT:
        inc word ptr [bp - 010h] ; A416
        add di, word ptr [bp - 012h] ; A419
        dec word ptr [bp - 0Eh] ; A41C
        jg L_A36C_PLANAR_ROW ; A41F
        pop di ; A421
        pop si ; A422
        pop ds ; A423
        mov sp, bp ; A424
        pop bp ; A426
        retf ; A427
L_A36C_SEGMENT_ROW:
        mov bx, word ptr [bp - 010h] ; A428
        mov bx, word ptr es:[bx] ; A42B
        and bx, 0Fh ; A42E
        je L_A36C_SEGMENT_NEXT ; A431
        mov bl, byte ptr cs:[bx + 04C74h] ; A433
        xor bh, bh ; A438
        shl bx, 1 ; A43A
        mov ax, word ptr cs:[bx + 04E8Ch] ; A43C
        or ax, ax ; A441
        je L_A36C_SEGMENT_NEXT ; A443
        mov ds, ax ; A445
        mov si, word ptr [bp - 0Ah] ; A447
        mov dx, word ptr [bp - 8] ; A44A
L_A36C_SEGMENT_COPY:
        mov cx, word ptr [bp - 6] ; A44D
        rep movsb ; A450
        add si, word ptr [bp - 0Ch] ; A452
        dec dx ; A455
        jg L_A36C_SEGMENT_COPY ; A456
L_A36C_SEGMENT_NEXT:
        inc word ptr [bp - 010h] ; A458
        add di, word ptr [bp - 012h] ; A45B
        dec word ptr [bp - 0Eh] ; A45E
        jg L_A36C_SEGMENT_ROW ; A461
        pop di ; A463
        pop si ; A464
        pop ds ; A465
        mov sp, bp ; A466
        pop bp ; A468
        retf ; A469
        ORG 04DCAh
        PUBLIC _fn_cycles_ega_0a46a
_fn_cycles_ega_0a46a LABEL FAR
        push bp ; A46A
        mov bp, sp ; A46B
        sub sp, 0Ah ; A46D
        push ds ; A470
        push si ; A471
        push di ; A472
        mov ax, word ptr [bp + 0Eh] ; A473
        sar ax, 1 ; A476
        sar ax, 1 ; A478
        sar ax, 1 ; A47A
        mov word ptr [bp - 0Ah], ax ; A47C
        mov ax, word ptr [bp + 6] ; A47F
        sar ax, 1 ; A482
        sar ax, 1 ; A484
        sar ax, 1 ; A486
        mov word ptr [bp + 6], ax ; A488
        mov ax, word ptr [bp + 0Ah] ; A48B
        sar ax, 1 ; A48E
        sar ax, 1 ; A490
        sar ax, 1 ; A492
        mov word ptr [bp + 0Ah], ax ; A494
        mov bx, word ptr [bp + 8] ; A497
        shl bx, 1 ; A49A
        mov si, 04EA4h ; A49C
        cmp word ptr ds:[_g_cga_99d0], 0 ; A49F
        je L_A46A_TABLE ; A4A4
        mov si, word ptr ds:[_g_cga_99ce] ; A4A6
L_A46A_TABLE:
        add bx, word ptr cs:[si + 0Ah] ; A4AA
        mov ax, word ptr cs:[bx] ; A4AE
        add ax, word ptr [bp + 6] ; A4B1
        mov word ptr [bp - 2], ax ; A4B4
        mov ax, word ptr cs:[si + 014h] ; A4B7
        sub ax, word ptr [bp - 0Ah] ; A4BB
        mov word ptr [bp - 6], ax ; A4BE
        mov bx, word ptr [bp + 0Ch] ; A4C1
        shl bx, 1 ; A4C4
        add bx, word ptr cs:[04E94h] ; A4C6
        mov ax, word ptr cs:[bx] ; A4CB
        add ax, word ptr [bp + 0Ah] ; A4CE
        mov word ptr [bp - 4], ax ; A4D1
        mov ax, word ptr cs:[04E9Eh] ; A4D4
        sub ax, word ptr [bp - 0Ah] ; A4D8
        mov word ptr [bp - 8], ax ; A4DB
        mov es, word ptr cs:[04E8Ch] ; A4DE
        mov ax, 0A000h ; A4E3
        mov ds, ax ; A4E6
        cld ; A4E8
        xor bx, bx ; A4E9
L_A46A_PLANE:
        mov cx, bx ; A4EB
        shr cx, 1 ; A4ED
        mov dx, 03CEh ; A4EF
        mov al, 4 ; A4F2
        out dx, al ; A4F4
        inc dx ; A4F5
        mov al, cl ; A4F6
        out dx, al ; A4F8
        mov ax, word ptr cs:[bx + 04E8Ch] ; A4F9
        or ax, ax ; A4FE
        je L_A46A_NEXT ; A500
        mov es, ax ; A502
        mov si, word ptr [bp - 2] ; A504
        mov di, word ptr [bp - 4] ; A507
        mov dx, word ptr [bp + 010h] ; A50A
L_A46A_COPY:
        mov cx, word ptr [bp - 0Ah] ; A50D
        rep movsb ; A510
        add si, word ptr [bp - 6] ; A512
        add di, word ptr [bp - 8] ; A515
        dec dx ; A518
        jg L_A46A_COPY ; A519
L_A46A_NEXT:
        add bx, 2 ; A51B
        cmp bx, 8 ; A51E
        jl L_A46A_PLANE ; A521
        pop di ; A523
        pop si ; A524
        pop ds ; A525
        mov sp, bp ; A526
        pop bp ; A528
        retf ; A529
EGA_PLANAR_TEXT ENDS
        END
