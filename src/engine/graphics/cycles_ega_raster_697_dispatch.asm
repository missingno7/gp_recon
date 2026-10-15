; Cycles EGA table dispatch and cases B1D0..B7D9 reconstructed from image bytes.
; Names are descriptive reconstructions, not recovered symbols.
; This standalone module starts at its mapped routine/shared entry.
        .286
EXTRN _ext_8CCF:NEAR
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        PUBLIC _cye_697_dispatch
_cye_697_dispatch LABEL BYTE
_raster_697_table_a LABEL WORD
        DW OFFSET L_B1F0,OFFSET L_B225
        DW OFFSET L_B275,OFFSET L_B2CA
        DW OFFSET L_B323,OFFSET L_B37D
        DW OFFSET L_B3D5,OFFSET L_B429
_raster_697_table_b LABEL WORD
        DW OFFSET _ext_8CCF,OFFSET L_B479
        DW OFFSET L_B4FD,OFFSET L_B576
        DW OFFSET L_B5F3,OFFSET L_B671
        DW OFFSET L_B6ED,OFFSET L_B765
L_B1F0 LABEL NEAR
        ; B1F0: 8B 56 D4  mov dx, word ptr [bp - 0x2c]
        MOV          dx, word ptr [bp - 44]
L_B1F3 LABEL NEAR
        ; B1F3: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; B1F6: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; B1F9: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; B1FC: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; B1FF: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_B202 LABEL NEAR
        ; B202: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
L_B205 LABEL NEAR
        ; B205: AC  lodsb al, byte ptr [si]
        LODSB
        ; B206: 26 30 05  xor byte ptr es:[di], al
        XOR          byte ptr es:[di], al
        ; B209: 47  inc di
        INC          di
        ; B20A: E2 F9  loop 0xb205
        LOOP L_B205
        ; B20C: 03 FA  add di, dx
        ADD          di, dx
        ; B20E: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; B211: 4B  dec bx
        DEC          bx
        ; B212: 7F EE  jg 0xb202
        JG SHORT L_B202
        ; B214: 03 76 C8  add si, word ptr [bp - 0x38]
        ADD          si, word ptr [bp - 56]
        ; B217: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; B21B: 7D D6  jge 0xb1f3
        JGE SHORT L_B1F3
L_B21D LABEL NEAR
        ; B21D: 83 C4 44  add sp, 0x44
        ADD          sp, 68
        ; B220: 5F  pop di
        POP          di
        ; B221: 5E  pop si
        POP          si
        ; B222: 1F  pop ds
        POP          ds
        ; B223: 5D  pop bp
        POP          bp
        ; B224: CB  retf
        RETF
L_B225 LABEL NEAR
        ; B225: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; B228: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; B22B: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; B22E: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; B231: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_B234 LABEL NEAR
        ; B234: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; B237: 32 F6  xor dh, dh
        XOR          dh, dh
        ; B239: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; B23C: 75 0C  jne 0xb24a
        JNE SHORT L_B24A
        ; B23E: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; B241: D0 CE  ror dh, 1
        ROR          dh, 1
        ; B243: 80 E6 80  and dh, 0x80
        AND          dh, 128
        ; B246: 0B C9  or cx, cx
        OR           cx, cx
        ; B248: 74 14  je 0xb25e
        JE SHORT L_B25E
L_B24A LABEL NEAR
        ; B24A: 32 E4  xor ah, ah
        XOR          ah, ah
        ; B24C: AC  lodsb al, byte ptr [si]
        LODSB
        ; B24D: D1 C8  ror ax, 1
        ROR          ax, 1
        ; B24F: 0A C6  or al, dh
        OR           al, dh
        ; B251: 8A F4  mov dh, ah
        MOV          dh, ah
        ; B253: 26 30 05  xor byte ptr es:[di], al
        XOR          byte ptr es:[di], al
        ; B256: 47  inc di
        INC          di
        ; B257: E2 F1  loop 0xb24a
        LOOP L_B24A
        ; B259: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; B25C: 74 03  je 0xb261
        JE SHORT L_B261
L_B25E LABEL NEAR
        ; B25E: 26 30 25  xor byte ptr es:[di], ah
        XOR          byte ptr es:[di], ah
L_B261 LABEL NEAR
        ; B261: 03 7E D4  add di, word ptr [bp - 0x2c]
        ADD          di, word ptr [bp - 44]
        ; B264: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; B267: 4B  dec bx
        DEC          bx
        ; B268: 7F CA  jg 0xb234
        JG SHORT L_B234
        ; B26A: 03 76 C8  add si, word ptr [bp - 0x38]
        ADD          si, word ptr [bp - 56]
        ; B26D: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; B271: 7D B2  jge 0xb225
        JGE SHORT L_B225
        ; B273: EB A8  jmp 0xb21d
        JMP SHORT L_B21D
L_B275 LABEL NEAR
        ; B275: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; B278: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; B27B: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; B27E: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; B281: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_B284 LABEL NEAR
        ; B284: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; B287: 32 F6  xor dh, dh
        XOR          dh, dh
        ; B289: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; B28C: 75 0E  jne 0xb29c
        JNE SHORT L_B29C
        ; B28E: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; B291: D0 CE  ror dh, 1
        ROR          dh, 1
        ; B293: D0 CE  ror dh, 1
        ROR          dh, 1
        ; B295: 80 E6 C0  and dh, 0xc0
        AND          dh, 192
        ; B298: 0B C9  or cx, cx
        OR           cx, cx
        ; B29A: 74 16  je 0xb2b2
        JE SHORT L_B2B2
L_B29C LABEL NEAR
        ; B29C: 32 E4  xor ah, ah
        XOR          ah, ah
        ; B29E: AC  lodsb al, byte ptr [si]
        LODSB
        ; B29F: D1 C8  ror ax, 1
        ROR          ax, 1
        ; B2A1: D1 C8  ror ax, 1
        ROR          ax, 1
        ; B2A3: 0A C6  or al, dh
        OR           al, dh
        ; B2A5: 8A F4  mov dh, ah
        MOV          dh, ah
        ; B2A7: 26 30 05  xor byte ptr es:[di], al
        XOR          byte ptr es:[di], al
        ; B2AA: 47  inc di
        INC          di
        ; B2AB: E2 EF  loop 0xb29c
        LOOP L_B29C
        ; B2AD: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; B2B0: 74 03  je 0xb2b5
        JE SHORT L_B2B5
L_B2B2 LABEL NEAR
        ; B2B2: 26 30 35  xor byte ptr es:[di], dh
        XOR          byte ptr es:[di], dh
L_B2B5 LABEL NEAR
        ; B2B5: 03 7E D4  add di, word ptr [bp - 0x2c]
        ADD          di, word ptr [bp - 44]
        ; B2B8: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; B2BB: 4B  dec bx
        DEC          bx
        ; B2BC: 7F C6  jg 0xb284
        JG SHORT L_B284
        ; B2BE: 03 76 C8  add si, word ptr [bp - 0x38]
        ADD          si, word ptr [bp - 56]
        ; B2C1: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; B2C5: 7D AE  jge 0xb275
        JGE SHORT L_B275
        ; B2C7: E9 53 FF  jmp 0xb21d
        JMP NEAR PTR L_B21D
L_B2CA LABEL NEAR
        ; B2CA: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; B2CD: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; B2D0: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; B2D3: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; B2D6: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_B2D9 LABEL NEAR
        ; B2D9: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; B2DC: 32 F6  xor dh, dh
        XOR          dh, dh
        ; B2DE: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; B2E1: 75 10  jne 0xb2f3
        JNE SHORT L_B2F3
        ; B2E3: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; B2E6: D0 CE  ror dh, 1
        ROR          dh, 1
        ; B2E8: D0 CE  ror dh, 1
        ROR          dh, 1
        ; B2EA: D0 CE  ror dh, 1
        ROR          dh, 1
        ; B2EC: 80 E6 E0  and dh, 0xe0
        AND          dh, 224
        ; B2EF: 0B C9  or cx, cx
        OR           cx, cx
        ; B2F1: 74 18  je 0xb30b
        JE SHORT L_B30B
L_B2F3 LABEL NEAR
        ; B2F3: 32 E4  xor ah, ah
        XOR          ah, ah
        ; B2F5: AC  lodsb al, byte ptr [si]
        LODSB
        ; B2F6: D1 C8  ror ax, 1
        ROR          ax, 1
        ; B2F8: D1 C8  ror ax, 1
        ROR          ax, 1
        ; B2FA: D1 C8  ror ax, 1
        ROR          ax, 1
        ; B2FC: 0A C6  or al, dh
        OR           al, dh
        ; B2FE: 8A F4  mov dh, ah
        MOV          dh, ah
        ; B300: 26 30 05  xor byte ptr es:[di], al
        XOR          byte ptr es:[di], al
        ; B303: 47  inc di
        INC          di
        ; B304: E2 ED  loop 0xb2f3
        LOOP L_B2F3
        ; B306: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; B309: 74 03  je 0xb30e
        JE SHORT L_B30E
L_B30B LABEL NEAR
        ; B30B: 26 30 35  xor byte ptr es:[di], dh
        XOR          byte ptr es:[di], dh
L_B30E LABEL NEAR
        ; B30E: 03 7E D4  add di, word ptr [bp - 0x2c]
        ADD          di, word ptr [bp - 44]
        ; B311: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; B314: 4B  dec bx
        DEC          bx
        ; B315: 7F C2  jg 0xb2d9
        JG SHORT L_B2D9
        ; B317: 03 76 C8  add si, word ptr [bp - 0x38]
        ADD          si, word ptr [bp - 56]
        ; B31A: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; B31E: 7D AA  jge 0xb2ca
        JGE SHORT L_B2CA
        ; B320: E9 FA FE  jmp 0xb21d
        JMP NEAR PTR L_B21D
L_B323 LABEL NEAR
        ; B323: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; B326: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; B329: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; B32C: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; B32F: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_B332 LABEL NEAR
        ; B332: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; B335: 32 F6  xor dh, dh
        XOR          dh, dh
        ; B337: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; B33A: 75 0F  jne 0xb34b
        JNE SHORT L_B34B
        ; B33C: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; B33F: D0 E6  shl dh, 1
        SHL          dh, 1
        ; B341: D0 E6  shl dh, 1
        SHL          dh, 1
        ; B343: D0 E6  shl dh, 1
        SHL          dh, 1
        ; B345: D0 E6  shl dh, 1
        SHL          dh, 1
        ; B347: 0B C9  or cx, cx
        OR           cx, cx
        ; B349: 74 1A  je 0xb365
        JE SHORT L_B365
L_B34B LABEL NEAR
        ; B34B: 32 E4  xor ah, ah
        XOR          ah, ah
        ; B34D: AC  lodsb al, byte ptr [si]
        LODSB
        ; B34E: D1 C8  ror ax, 1
        ROR          ax, 1
        ; B350: D1 C8  ror ax, 1
        ROR          ax, 1
        ; B352: D1 C8  ror ax, 1
        ROR          ax, 1
        ; B354: D1 C8  ror ax, 1
        ROR          ax, 1
        ; B356: 0A C6  or al, dh
        OR           al, dh
        ; B358: 8A F4  mov dh, ah
        MOV          dh, ah
        ; B35A: 26 30 05  xor byte ptr es:[di], al
        XOR          byte ptr es:[di], al
        ; B35D: 47  inc di
        INC          di
        ; B35E: E2 EB  loop 0xb34b
        LOOP L_B34B
        ; B360: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; B363: 74 03  je 0xb368
        JE SHORT L_B368
L_B365 LABEL NEAR
        ; B365: 26 30 35  xor byte ptr es:[di], dh
        XOR          byte ptr es:[di], dh
L_B368 LABEL NEAR
        ; B368: 03 7E D4  add di, word ptr [bp - 0x2c]
        ADD          di, word ptr [bp - 44]
        ; B36B: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; B36E: 4B  dec bx
        DEC          bx
        ; B36F: 7F C1  jg 0xb332
        JG SHORT L_B332
        ; B371: 03 76 C8  add si, word ptr [bp - 0x38]
        ADD          si, word ptr [bp - 56]
        ; B374: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; B378: 7D A9  jge 0xb323
        JGE SHORT L_B323
        ; B37A: E9 A0 FE  jmp 0xb21d
        JMP NEAR PTR L_B21D
L_B37D LABEL NEAR
        ; B37D: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; B380: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; B383: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; B386: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; B389: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_B38C LABEL NEAR
        ; B38C: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; B38F: 32 F6  xor dh, dh
        XOR          dh, dh
        ; B391: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; B394: 75 0D  jne 0xb3a3
        JNE SHORT L_B3A3
        ; B396: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; B399: D0 E6  shl dh, 1
        SHL          dh, 1
        ; B39B: D0 E6  shl dh, 1
        SHL          dh, 1
        ; B39D: D0 E6  shl dh, 1
        SHL          dh, 1
        ; B39F: 0B C9  or cx, cx
        OR           cx, cx
        ; B3A1: 74 1A  je 0xb3bd
        JE SHORT L_B3BD
L_B3A3 LABEL NEAR
        ; B3A3: 32 E4  xor ah, ah
        XOR          ah, ah
        ; B3A5: AC  lodsb al, byte ptr [si]
        LODSB
        ; B3A6: D1 C0  rol ax, 1
        ROL          ax, 1
        ; B3A8: D1 C0  rol ax, 1
        ROL          ax, 1
        ; B3AA: D1 C0  rol ax, 1
        ROL          ax, 1
        ; B3AC: 86 C4  xchg ah, al
        XCHG         al, ah
        ; B3AE: 0A C6  or al, dh
        OR           al, dh
        ; B3B0: 8A F4  mov dh, ah
        MOV          dh, ah
        ; B3B2: 26 30 05  xor byte ptr es:[di], al
        XOR          byte ptr es:[di], al
        ; B3B5: 47  inc di
        INC          di
        ; B3B6: E2 EB  loop 0xb3a3
        LOOP L_B3A3
        ; B3B8: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; B3BB: 74 03  je 0xb3c0
        JE SHORT L_B3C0
L_B3BD LABEL NEAR
        ; B3BD: 26 30 35  xor byte ptr es:[di], dh
        XOR          byte ptr es:[di], dh
L_B3C0 LABEL NEAR
        ; B3C0: 03 7E D4  add di, word ptr [bp - 0x2c]
        ADD          di, word ptr [bp - 44]
        ; B3C3: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; B3C6: 4B  dec bx
        DEC          bx
        ; B3C7: 7F C3  jg 0xb38c
        JG SHORT L_B38C
        ; B3C9: 03 76 C8  add si, word ptr [bp - 0x38]
        ADD          si, word ptr [bp - 56]
        ; B3CC: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; B3D0: 7D AB  jge 0xb37d
        JGE SHORT L_B37D
        ; B3D2: E9 48 FE  jmp 0xb21d
        JMP NEAR PTR L_B21D
L_B3D5 LABEL NEAR
        ; B3D5: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; B3D8: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; B3DB: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; B3DE: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; B3E1: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_B3E4 LABEL NEAR
        ; B3E4: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; B3E7: 32 F6  xor dh, dh
        XOR          dh, dh
        ; B3E9: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; B3EC: 75 0B  jne 0xb3f9
        JNE SHORT L_B3F9
        ; B3EE: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; B3F1: D0 E6  shl dh, 1
        SHL          dh, 1
        ; B3F3: D0 E6  shl dh, 1
        SHL          dh, 1
        ; B3F5: 0B C9  or cx, cx
        OR           cx, cx
        ; B3F7: 74 18  je 0xb411
        JE SHORT L_B411
L_B3F9 LABEL NEAR
        ; B3F9: 32 E4  xor ah, ah
        XOR          ah, ah
        ; B3FB: AC  lodsb al, byte ptr [si]
        LODSB
        ; B3FC: D1 C0  rol ax, 1
        ROL          ax, 1
        ; B3FE: D1 C0  rol ax, 1
        ROL          ax, 1
        ; B400: 86 C4  xchg ah, al
        XCHG         al, ah
        ; B402: 0A C6  or al, dh
        OR           al, dh
        ; B404: 8A F4  mov dh, ah
        MOV          dh, ah
        ; B406: 26 30 05  xor byte ptr es:[di], al
        XOR          byte ptr es:[di], al
        ; B409: 47  inc di
        INC          di
        ; B40A: E2 ED  loop 0xb3f9
        LOOP L_B3F9
        ; B40C: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; B40F: 74 03  je 0xb414
        JE SHORT L_B414
L_B411 LABEL NEAR
        ; B411: 26 30 35  xor byte ptr es:[di], dh
        XOR          byte ptr es:[di], dh
L_B414 LABEL NEAR
        ; B414: 03 7E D4  add di, word ptr [bp - 0x2c]
        ADD          di, word ptr [bp - 44]
        ; B417: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; B41A: 4B  dec bx
        DEC          bx
        ; B41B: 7F C7  jg 0xb3e4
        JG SHORT L_B3E4
        ; B41D: 03 76 C8  add si, word ptr [bp - 0x38]
        ADD          si, word ptr [bp - 56]
        ; B420: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; B424: 7D AF  jge 0xb3d5
        JGE SHORT L_B3D5
        ; B426: E9 F4 FD  jmp 0xb21d
        JMP NEAR PTR L_B21D
L_B429 LABEL NEAR
        ; B429: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; B42C: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; B42F: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; B432: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; B435: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_B438 LABEL NEAR
        ; B438: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; B43B: 32 F6  xor dh, dh
        XOR          dh, dh
        ; B43D: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; B440: 75 09  jne 0xb44b
        JNE SHORT L_B44B
        ; B442: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; B445: D0 E6  shl dh, 1
        SHL          dh, 1
        ; B447: 0B C9  or cx, cx
        OR           cx, cx
        ; B449: 74 16  je 0xb461
        JE SHORT L_B461
L_B44B LABEL NEAR
        ; B44B: 32 E4  xor ah, ah
        XOR          ah, ah
        ; B44D: AC  lodsb al, byte ptr [si]
        LODSB
        ; B44E: D1 C0  rol ax, 1
        ROL          ax, 1
        ; B450: 86 C4  xchg ah, al
        XCHG         al, ah
        ; B452: 0A C6  or al, dh
        OR           al, dh
        ; B454: 8A F4  mov dh, ah
        MOV          dh, ah
        ; B456: 26 30 05  xor byte ptr es:[di], al
        XOR          byte ptr es:[di], al
        ; B459: 47  inc di
        INC          di
        ; B45A: E2 EF  loop 0xb44b
        LOOP L_B44B
        ; B45C: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; B45F: 74 03  je 0xb464
        JE SHORT L_B464
L_B461 LABEL NEAR
        ; B461: 26 30 35  xor byte ptr es:[di], dh
        XOR          byte ptr es:[di], dh
L_B464 LABEL NEAR
        ; B464: 03 7E D4  add di, word ptr [bp - 0x2c]
        ADD          di, word ptr [bp - 44]
        ; B467: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; B46A: 4B  dec bx
        DEC          bx
        ; B46B: 7F CB  jg 0xb438
        JG SHORT L_B438
        ; B46D: 03 76 C8  add si, word ptr [bp - 0x38]
        ADD          si, word ptr [bp - 56]
        ; B470: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; B474: 7D B3  jge 0xb429
        JGE SHORT L_B429
        ; B476: E9 A4 FD  jmp 0xb21d
        JMP NEAR PTR L_B21D
L_B479 LABEL NEAR
        ; B479: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; B47C: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
L_B47F LABEL NEAR
        ; B47F: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_B482 LABEL NEAR
        ; B482: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; B485: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; B488: B0 02  mov al, 2
        MOV          al, 2
        ; B48A: EE  out dx, al
        OUT          dx, al
        ; B48B: 42  inc dx
        INC          dx
        ; B48C: 8A C1  mov al, cl
        MOV          al, cl
        ; B48E: EE  out dx, al
        OUT          dx, al
        ; B48F: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; B492: B0 04  mov al, 4
        MOV          al, 4
        ; B494: EE  out dx, al
        OUT          dx, al
        ; B495: 42  inc dx
        INC          dx
        ; B496: 8A C5  mov al, ch
        MOV          al, ch
        ; B498: EE  out dx, al
        OUT          dx, al
        ; B499: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; B49C: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; B49F: 32 F6  xor dh, dh
        XOR          dh, dh
        ; B4A1: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; B4A4: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; B4A7: 75 0C  jne 0xb4b5
        JNE SHORT L_B4B5
        ; B4A9: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; B4AC: D0 CE  ror dh, 1
        ROR          dh, 1
        ; B4AE: 80 E6 80  and dh, 0x80
        AND          dh, 128
        ; B4B1: 0B C9  or cx, cx
        OR           cx, cx
        ; B4B3: 74 17  je 0xb4cc
        JE SHORT L_B4CC
L_B4B5 LABEL NEAR
        ; B4B5: 80 E6 80  and dh, 0x80
        AND          dh, 128
L_B4B8 LABEL NEAR
        ; B4B8: 32 E4  xor ah, ah
        XOR          ah, ah
        ; B4BA: AC  lodsb al, byte ptr [si]
        LODSB
        ; B4BB: D1 C8  ror ax, 1
        ROR          ax, 1
        ; B4BD: 0A C6  or al, dh
        OR           al, dh
        ; B4BF: 8A F4  mov dh, ah
        MOV          dh, ah
        ; B4C1: AA  stosb byte ptr es:[di], al
        STOSB
        ; B4C2: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; B4C5: E2 F1  loop 0xb4b8
        LOOP L_B4B8
        ; B4C7: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; B4CA: 74 03  je 0xb4cf
        JE SHORT L_B4CF
L_B4CC LABEL NEAR
        ; B4CC: 26 88 35  mov byte ptr es:[di], dh
        MOV          byte ptr es:[di], dh
L_B4CF LABEL NEAR
        ; B4CF: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; B4D2: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; B4D6: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; B4D9: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; B4DC: 72 A4  jb 0xb482
        JB SHORT L_B482
        ; B4DE: 2E 03 3E 9E 4E  add di, word ptr cs:[0x4e9e]
        ADD          di, word ptr cs:[20126]
        ; B4E3: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; B4E6: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; B4E9: 7F 94  jg 0xb47f
        JG SHORT L_B47F
L_B4EB LABEL NEAR
        ; B4EB: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; B4EE: B0 03  mov al, 3
        MOV          al, 3
        ; B4F0: EE  out dx, al
        OUT          dx, al
        ; B4F1: 42  inc dx
        INC          dx
        ; B4F2: B0 00  mov al, 0
        MOV          al, 0
        ; B4F4: EE  out dx, al
        OUT          dx, al
        ; B4F5: 83 C4 44  add sp, 0x44
        ADD          sp, 68
        ; B4F8: 5F  pop di
        POP          di
        ; B4F9: 5E  pop si
        POP          si
        ; B4FA: 1F  pop ds
        POP          ds
        ; B4FB: 5D  pop bp
        POP          bp
        ; B4FC: CB  retf
        RETF
L_B4FD LABEL NEAR
        ; B4FD: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; B500: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
L_B503 LABEL NEAR
        ; B503: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_B506 LABEL NEAR
        ; B506: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; B509: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; B50C: B0 02  mov al, 2
        MOV          al, 2
        ; B50E: EE  out dx, al
        OUT          dx, al
        ; B50F: 42  inc dx
        INC          dx
        ; B510: 8A C1  mov al, cl
        MOV          al, cl
        ; B512: EE  out dx, al
        OUT          dx, al
        ; B513: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; B516: B0 04  mov al, 4
        MOV          al, 4
        ; B518: EE  out dx, al
        OUT          dx, al
        ; B519: 42  inc dx
        INC          dx
        ; B51A: 8A C5  mov al, ch
        MOV          al, ch
        ; B51C: EE  out dx, al
        OUT          dx, al
        ; B51D: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; B520: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; B523: 32 F6  xor dh, dh
        XOR          dh, dh
        ; B525: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; B528: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; B52B: 75 0E  jne 0xb53b
        JNE SHORT L_B53B
        ; B52D: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; B530: D0 CE  ror dh, 1
        ROR          dh, 1
        ; B532: D0 CE  ror dh, 1
        ROR          dh, 1
        ; B534: 80 E6 C0  and dh, 0xc0
        AND          dh, 192
        ; B537: 0B C9  or cx, cx
        OR           cx, cx
        ; B539: 74 19  je 0xb554
        JE SHORT L_B554
L_B53B LABEL NEAR
        ; B53B: 80 E6 C0  and dh, 0xc0
        AND          dh, 192
L_B53E LABEL NEAR
        ; B53E: 32 E4  xor ah, ah
        XOR          ah, ah
        ; B540: AC  lodsb al, byte ptr [si]
        LODSB
        ; B541: D1 C8  ror ax, 1
        ROR          ax, 1
        ; B543: D1 C8  ror ax, 1
        ROR          ax, 1
        ; B545: 0A C6  or al, dh
        OR           al, dh
        ; B547: 8A F4  mov dh, ah
        MOV          dh, ah
        ; B549: AA  stosb byte ptr es:[di], al
        STOSB
        ; B54A: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; B54D: E2 EF  loop 0xb53e
        LOOP L_B53E
        ; B54F: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; B552: 74 03  je 0xb557
        JE SHORT L_B557
L_B554 LABEL NEAR
        ; B554: 26 88 35  mov byte ptr es:[di], dh
        MOV          byte ptr es:[di], dh
L_B557 LABEL NEAR
        ; B557: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; B55A: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; B55E: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; B561: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; B564: 72 A0  jb 0xb506
        JB SHORT L_B506
        ; B566: 2E 03 3E 9E 4E  add di, word ptr cs:[0x4e9e]
        ADD          di, word ptr cs:[20126]
        ; B56B: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; B56E: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; B571: 7F 90  jg 0xb503
        JG SHORT L_B503
        ; B573: E9 75 FF  jmp 0xb4eb
        JMP NEAR PTR L_B4EB
L_B576 LABEL NEAR
        ; B576: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; B579: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
L_B57C LABEL NEAR
        ; B57C: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_B57F LABEL NEAR
        ; B57F: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; B582: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; B585: B0 02  mov al, 2
        MOV          al, 2
        ; B587: EE  out dx, al
        OUT          dx, al
        ; B588: 42  inc dx
        INC          dx
        ; B589: 8A C1  mov al, cl
        MOV          al, cl
        ; B58B: EE  out dx, al
        OUT          dx, al
        ; B58C: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; B58F: B0 04  mov al, 4
        MOV          al, 4
        ; B591: EE  out dx, al
        OUT          dx, al
        ; B592: 42  inc dx
        INC          dx
        ; B593: 8A C5  mov al, ch
        MOV          al, ch
        ; B595: EE  out dx, al
        OUT          dx, al
        ; B596: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; B599: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; B59C: 32 F6  xor dh, dh
        XOR          dh, dh
        ; B59E: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; B5A1: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; B5A4: 75 10  jne 0xb5b6
        JNE SHORT L_B5B6
        ; B5A6: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; B5A9: D0 CE  ror dh, 1
        ROR          dh, 1
        ; B5AB: D0 CE  ror dh, 1
        ROR          dh, 1
        ; B5AD: D0 CE  ror dh, 1
        ROR          dh, 1
        ; B5AF: 80 E6 E0  and dh, 0xe0
        AND          dh, 224
        ; B5B2: 0B C9  or cx, cx
        OR           cx, cx
        ; B5B4: 74 1B  je 0xb5d1
        JE SHORT L_B5D1
L_B5B6 LABEL NEAR
        ; B5B6: 80 E6 E0  and dh, 0xe0
        AND          dh, 224
L_B5B9 LABEL NEAR
        ; B5B9: 32 E4  xor ah, ah
        XOR          ah, ah
        ; B5BB: AC  lodsb al, byte ptr [si]
        LODSB
        ; B5BC: D1 C8  ror ax, 1
        ROR          ax, 1
        ; B5BE: D1 C8  ror ax, 1
        ROR          ax, 1
        ; B5C0: D1 C8  ror ax, 1
        ROR          ax, 1
        ; B5C2: 0A C6  or al, dh
        OR           al, dh
        ; B5C4: 8A F4  mov dh, ah
        MOV          dh, ah
        ; B5C6: AA  stosb byte ptr es:[di], al
        STOSB
        ; B5C7: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; B5CA: E2 ED  loop 0xb5b9
        LOOP L_B5B9
        ; B5CC: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; B5CF: 74 03  je 0xb5d4
        JE SHORT L_B5D4
L_B5D1 LABEL NEAR
        ; B5D1: 26 88 35  mov byte ptr es:[di], dh
        MOV          byte ptr es:[di], dh
L_B5D4 LABEL NEAR
        ; B5D4: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; B5D7: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; B5DB: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; B5DE: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; B5E1: 72 9C  jb 0xb57f
        JB SHORT L_B57F
        ; B5E3: 2E 03 3E 9E 4E  add di, word ptr cs:[0x4e9e]
        ADD          di, word ptr cs:[20126]
        ; B5E8: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; B5EB: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; B5EE: 7F 8C  jg 0xb57c
        JG SHORT L_B57C
        ; B5F0: E9 F8 FE  jmp 0xb4eb
        JMP NEAR PTR L_B4EB
L_B5F3 LABEL NEAR
        ; B5F3: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; B5F6: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
L_B5F9 LABEL NEAR
        ; B5F9: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_B5FC LABEL NEAR
        ; B5FC: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; B5FF: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; B602: B0 02  mov al, 2
        MOV          al, 2
        ; B604: EE  out dx, al
        OUT          dx, al
        ; B605: 42  inc dx
        INC          dx
        ; B606: 8A C1  mov al, cl
        MOV          al, cl
        ; B608: EE  out dx, al
        OUT          dx, al
        ; B609: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; B60C: B0 04  mov al, 4
        MOV          al, 4
        ; B60E: EE  out dx, al
        OUT          dx, al
        ; B60F: 42  inc dx
        INC          dx
        ; B610: 8A C5  mov al, ch
        MOV          al, ch
        ; B612: EE  out dx, al
        OUT          dx, al
        ; B613: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; B616: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; B619: 32 F6  xor dh, dh
        XOR          dh, dh
        ; B61B: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; B61E: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; B621: 75 0F  jne 0xb632
        JNE SHORT L_B632
        ; B623: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; B626: D0 E6  shl dh, 1
        SHL          dh, 1
        ; B628: D0 E6  shl dh, 1
        SHL          dh, 1
        ; B62A: D0 E6  shl dh, 1
        SHL          dh, 1
        ; B62C: D0 E6  shl dh, 1
        SHL          dh, 1
        ; B62E: 0B C9  or cx, cx
        OR           cx, cx
        ; B630: 74 1D  je 0xb64f
        JE SHORT L_B64F
L_B632 LABEL NEAR
        ; B632: 80 E6 F0  and dh, 0xf0
        AND          dh, 240
L_B635 LABEL NEAR
        ; B635: 32 E4  xor ah, ah
        XOR          ah, ah
        ; B637: AC  lodsb al, byte ptr [si]
        LODSB
        ; B638: D1 C8  ror ax, 1
        ROR          ax, 1
        ; B63A: D1 C8  ror ax, 1
        ROR          ax, 1
        ; B63C: D1 C8  ror ax, 1
        ROR          ax, 1
        ; B63E: D1 C8  ror ax, 1
        ROR          ax, 1
        ; B640: 0A C6  or al, dh
        OR           al, dh
        ; B642: 8A F4  mov dh, ah
        MOV          dh, ah
        ; B644: AA  stosb byte ptr es:[di], al
        STOSB
        ; B645: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; B648: E2 EB  loop 0xb635
        LOOP L_B635
        ; B64A: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; B64D: 74 03  je 0xb652
        JE SHORT L_B652
L_B64F LABEL NEAR
        ; B64F: 26 88 35  mov byte ptr es:[di], dh
        MOV          byte ptr es:[di], dh
L_B652 LABEL NEAR
        ; B652: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; B655: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; B659: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; B65C: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; B65F: 72 9B  jb 0xb5fc
        JB SHORT L_B5FC
        ; B661: 2E 03 3E 9E 4E  add di, word ptr cs:[0x4e9e]
        ADD          di, word ptr cs:[20126]
        ; B666: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; B669: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; B66C: 7F 8B  jg 0xb5f9
        JG SHORT L_B5F9
        ; B66E: E9 7A FE  jmp 0xb4eb
        JMP NEAR PTR L_B4EB
L_B671 LABEL NEAR
        ; B671: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; B674: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
L_B677 LABEL NEAR
        ; B677: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_B67A LABEL NEAR
        ; B67A: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; B67D: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; B680: B0 02  mov al, 2
        MOV          al, 2
        ; B682: EE  out dx, al
        OUT          dx, al
        ; B683: 42  inc dx
        INC          dx
        ; B684: 8A C1  mov al, cl
        MOV          al, cl
        ; B686: EE  out dx, al
        OUT          dx, al
        ; B687: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; B68A: B0 04  mov al, 4
        MOV          al, 4
        ; B68C: EE  out dx, al
        OUT          dx, al
        ; B68D: 42  inc dx
        INC          dx
        ; B68E: 8A C5  mov al, ch
        MOV          al, ch
        ; B690: EE  out dx, al
        OUT          dx, al
        ; B691: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; B694: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; B697: 32 F6  xor dh, dh
        XOR          dh, dh
        ; B699: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; B69C: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; B69F: 75 0D  jne 0xb6ae
        JNE SHORT L_B6AE
        ; B6A1: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; B6A4: D0 E6  shl dh, 1
        SHL          dh, 1
        ; B6A6: D0 E6  shl dh, 1
        SHL          dh, 1
        ; B6A8: D0 E6  shl dh, 1
        SHL          dh, 1
        ; B6AA: 0B C9  or cx, cx
        OR           cx, cx
        ; B6AC: 74 1D  je 0xb6cb
        JE SHORT L_B6CB
L_B6AE LABEL NEAR
        ; B6AE: 80 E6 F8  and dh, 0xf8
        AND          dh, 248
L_B6B1 LABEL NEAR
        ; B6B1: 32 E4  xor ah, ah
        XOR          ah, ah
        ; B6B3: AC  lodsb al, byte ptr [si]
        LODSB
        ; B6B4: D1 C0  rol ax, 1
        ROL          ax, 1
        ; B6B6: D1 C0  rol ax, 1
        ROL          ax, 1
        ; B6B8: D1 C0  rol ax, 1
        ROL          ax, 1
        ; B6BA: 86 C4  xchg ah, al
        XCHG         al, ah
        ; B6BC: 0A C6  or al, dh
        OR           al, dh
        ; B6BE: 8A F4  mov dh, ah
        MOV          dh, ah
        ; B6C0: AA  stosb byte ptr es:[di], al
        STOSB
        ; B6C1: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; B6C4: E2 EB  loop 0xb6b1
        LOOP L_B6B1
        ; B6C6: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; B6C9: 74 03  je 0xb6ce
        JE SHORT L_B6CE
L_B6CB LABEL NEAR
        ; B6CB: 26 88 35  mov byte ptr es:[di], dh
        MOV          byte ptr es:[di], dh
L_B6CE LABEL NEAR
        ; B6CE: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; B6D1: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; B6D5: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; B6D8: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; B6DB: 72 9D  jb 0xb67a
        JB SHORT L_B67A
        ; B6DD: 2E 03 3E 9E 4E  add di, word ptr cs:[0x4e9e]
        ADD          di, word ptr cs:[20126]
        ; B6E2: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; B6E5: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; B6E8: 7F 8D  jg 0xb677
        JG SHORT L_B677
        ; B6EA: E9 FE FD  jmp 0xb4eb
        JMP NEAR PTR L_B4EB
L_B6ED LABEL NEAR
        ; B6ED: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; B6F0: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
L_B6F3 LABEL NEAR
        ; B6F3: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_B6F6 LABEL NEAR
        ; B6F6: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; B6F9: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; B6FC: B0 02  mov al, 2
        MOV          al, 2
        ; B6FE: EE  out dx, al
        OUT          dx, al
        ; B6FF: 42  inc dx
        INC          dx
        ; B700: 8A C1  mov al, cl
        MOV          al, cl
        ; B702: EE  out dx, al
        OUT          dx, al
        ; B703: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; B706: B0 04  mov al, 4
        MOV          al, 4
        ; B708: EE  out dx, al
        OUT          dx, al
        ; B709: 42  inc dx
        INC          dx
        ; B70A: 8A C5  mov al, ch
        MOV          al, ch
        ; B70C: EE  out dx, al
        OUT          dx, al
        ; B70D: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; B710: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; B713: 32 F6  xor dh, dh
        XOR          dh, dh
        ; B715: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; B718: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; B71B: 75 0B  jne 0xb728
        JNE SHORT L_B728
        ; B71D: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; B720: D0 E6  shl dh, 1
        SHL          dh, 1
        ; B722: D0 E6  shl dh, 1
        SHL          dh, 1
        ; B724: 0B C9  or cx, cx
        OR           cx, cx
        ; B726: 74 1B  je 0xb743
        JE SHORT L_B743
L_B728 LABEL NEAR
        ; B728: 80 E6 FC  and dh, 0xfc
        AND          dh, 252
L_B72B LABEL NEAR
        ; B72B: 32 E4  xor ah, ah
        XOR          ah, ah
        ; B72D: AC  lodsb al, byte ptr [si]
        LODSB
        ; B72E: D1 C0  rol ax, 1
        ROL          ax, 1
        ; B730: D1 C0  rol ax, 1
        ROL          ax, 1
        ; B732: 86 C4  xchg ah, al
        XCHG         al, ah
        ; B734: 0A C6  or al, dh
        OR           al, dh
        ; B736: 8A F4  mov dh, ah
        MOV          dh, ah
        ; B738: AA  stosb byte ptr es:[di], al
        STOSB
        ; B739: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; B73C: E2 ED  loop 0xb72b
        LOOP L_B72B
        ; B73E: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; B741: 74 03  je 0xb746
        JE SHORT L_B746
L_B743 LABEL NEAR
        ; B743: 26 88 35  mov byte ptr es:[di], dh
        MOV          byte ptr es:[di], dh
L_B746 LABEL NEAR
        ; B746: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; B749: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; B74D: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; B750: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; B753: 72 A1  jb 0xb6f6
        JB SHORT L_B6F6
        ; B755: 2E 03 3E 9E 4E  add di, word ptr cs:[0x4e9e]
        ADD          di, word ptr cs:[20126]
        ; B75A: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; B75D: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; B760: 7F 91  jg 0xb6f3
        JG SHORT L_B6F3
        ; B762: E9 86 FD  jmp 0xb4eb
        JMP NEAR PTR L_B4EB
L_B765 LABEL NEAR
        ; B765: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; B768: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
L_B76B LABEL NEAR
        ; B76B: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_B76E LABEL NEAR
        ; B76E: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; B771: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; B774: B0 02  mov al, 2
        MOV          al, 2
        ; B776: EE  out dx, al
        OUT          dx, al
        ; B777: 42  inc dx
        INC          dx
        ; B778: 8A C1  mov al, cl
        MOV          al, cl
        ; B77A: EE  out dx, al
        OUT          dx, al
        ; B77B: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; B77E: B0 04  mov al, 4
        MOV          al, 4
        ; B780: EE  out dx, al
        OUT          dx, al
        ; B781: 42  inc dx
        INC          dx
        ; B782: 8A C5  mov al, ch
        MOV          al, ch
        ; B784: EE  out dx, al
        OUT          dx, al
        ; B785: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; B788: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; B78B: 32 F6  xor dh, dh
        XOR          dh, dh
        ; B78D: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; B790: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; B793: 75 09  jne 0xb79e
        JNE SHORT L_B79E
        ; B795: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; B798: D0 E6  shl dh, 1
        SHL          dh, 1
        ; B79A: 0B C9  or cx, cx
        OR           cx, cx
        ; B79C: 74 19  je 0xb7b7
        JE SHORT L_B7B7
L_B79E LABEL NEAR
        ; B79E: 80 E6 FE  and dh, 0xfe
        AND          dh, 254
L_B7A1 LABEL NEAR
        ; B7A1: 32 E4  xor ah, ah
        XOR          ah, ah
        ; B7A3: AC  lodsb al, byte ptr [si]
        LODSB
        ; B7A4: D1 C0  rol ax, 1
        ROL          ax, 1
        ; B7A6: 86 C4  xchg ah, al
        XCHG         al, ah
        ; B7A8: 0A C6  or al, dh
        OR           al, dh
        ; B7AA: 8A F4  mov dh, ah
        MOV          dh, ah
        ; B7AC: AA  stosb byte ptr es:[di], al
        STOSB
        ; B7AD: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; B7B0: E2 EF  loop 0xb7a1
        LOOP L_B7A1
        ; B7B2: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; B7B5: 74 03  je 0xb7ba
        JE SHORT L_B7BA
L_B7B7 LABEL NEAR
        ; B7B7: 26 88 35  mov byte ptr es:[di], dh
        MOV          byte ptr es:[di], dh
L_B7BA LABEL NEAR
        ; B7BA: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; B7BD: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; B7C1: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; B7C4: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; B7C7: 72 A5  jb 0xb76e
        JB SHORT L_B76E
        ; B7C9: 2E 03 3E 9E 4E  add di, word ptr cs:[0x4e9e]
        ADD          di, word ptr cs:[20126]
        ; B7CE: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; B7D1: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; B7D4: 7F 95  jg 0xb76b
        JG SHORT L_B76B
        ; B7D6: E9 12 FD  jmp 0xb4eb
        JMP NEAR PTR L_B4EB
_TEXT ENDS
        END
