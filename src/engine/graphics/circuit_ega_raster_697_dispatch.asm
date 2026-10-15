; Circuit EGA table dispatch and cases D2F2..D8ED reconstructed from image bytes.
; Names are descriptive reconstructions, not recovered symbols.
; This standalone module starts at its mapped routine/shared entry.
        .286
EXTRN _ext_AD3B:NEAR
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        PUBLIC _rcega_697dispatch
_rcega_697dispatch LABEL BYTE
_raster_697_table_a LABEL WORD
        DW OFFSET L_D312,OFFSET L_D347
        DW OFFSET L_D397,OFFSET L_D3EC
        DW OFFSET L_D445,OFFSET L_D49F
        DW OFFSET L_D4F7,OFFSET L_D54B
_raster_697_table_b LABEL WORD
        DW OFFSET _ext_AD3B,OFFSET L_D59B
        DW OFFSET L_D61D,OFFSET L_D694
        DW OFFSET L_D70F,OFFSET L_D78B
        DW OFFSET L_D805,OFFSET L_D87B
L_D312 LABEL NEAR
        ; D312: 8B 56 D4  mov dx, word ptr [bp - 0x2c]
        MOV          dx, word ptr [bp - 44]
L_D315 LABEL NEAR
        ; D315: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; D318: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; D31B: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; D31E: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; D321: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_D324 LABEL NEAR
        ; D324: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
L_D327 LABEL NEAR
        ; D327: AC  lodsb al, byte ptr [si]
        LODSB
        ; D328: 26 30 05  xor byte ptr es:[di], al
        XOR          byte ptr es:[di], al
        ; D32B: 47  inc di
        INC          di
        ; D32C: E2 F9  loop 0xd327
        LOOP L_D327
        ; D32E: 03 FA  add di, dx
        ADD          di, dx
        ; D330: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; D333: 4B  dec bx
        DEC          bx
        ; D334: 7F EE  jg 0xd324
        JG SHORT L_D324
        ; D336: 03 76 C8  add si, word ptr [bp - 0x38]
        ADD          si, word ptr [bp - 56]
        ; D339: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; D33D: 7D D6  jge 0xd315
        JGE SHORT L_D315
L_D33F LABEL NEAR
        ; D33F: 83 C4 44  add sp, 0x44
        ADD          sp, 68
        ; D342: 5F  pop di
        POP          di
        ; D343: 5E  pop si
        POP          si
        ; D344: 1F  pop ds
        POP          ds
        ; D345: 5D  pop bp
        POP          bp
        ; D346: C3  ret
        RET
L_D347 LABEL NEAR
        ; D347: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; D34A: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; D34D: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; D350: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; D353: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_D356 LABEL NEAR
        ; D356: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; D359: 32 F6  xor dh, dh
        XOR          dh, dh
        ; D35B: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; D35E: 75 0C  jne 0xd36c
        JNE SHORT L_D36C
        ; D360: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; D363: D0 CE  ror dh, 1
        ROR          dh, 1
        ; D365: 80 E6 80  and dh, 0x80
        AND          dh, 128
        ; D368: 0B C9  or cx, cx
        OR           cx, cx
        ; D36A: 74 14  je 0xd380
        JE SHORT L_D380
L_D36C LABEL NEAR
        ; D36C: 32 E4  xor ah, ah
        XOR          ah, ah
        ; D36E: AC  lodsb al, byte ptr [si]
        LODSB
        ; D36F: D1 C8  ror ax, 1
        ROR          ax, 1
        ; D371: 0A C6  or al, dh
        OR           al, dh
        ; D373: 8A F4  mov dh, ah
        MOV          dh, ah
        ; D375: 26 30 05  xor byte ptr es:[di], al
        XOR          byte ptr es:[di], al
        ; D378: 47  inc di
        INC          di
        ; D379: E2 F1  loop 0xd36c
        LOOP L_D36C
        ; D37B: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; D37E: 74 03  je 0xd383
        JE SHORT L_D383
L_D380 LABEL NEAR
        ; D380: 26 30 25  xor byte ptr es:[di], ah
        XOR          byte ptr es:[di], ah
L_D383 LABEL NEAR
        ; D383: 03 7E D4  add di, word ptr [bp - 0x2c]
        ADD          di, word ptr [bp - 44]
        ; D386: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; D389: 4B  dec bx
        DEC          bx
        ; D38A: 7F CA  jg 0xd356
        JG SHORT L_D356
        ; D38C: 03 76 C8  add si, word ptr [bp - 0x38]
        ADD          si, word ptr [bp - 56]
        ; D38F: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; D393: 7D B2  jge 0xd347
        JGE SHORT L_D347
        ; D395: EB A8  jmp 0xd33f
        JMP SHORT L_D33F
L_D397 LABEL NEAR
        ; D397: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; D39A: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; D39D: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; D3A0: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; D3A3: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_D3A6 LABEL NEAR
        ; D3A6: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; D3A9: 32 F6  xor dh, dh
        XOR          dh, dh
        ; D3AB: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; D3AE: 75 0E  jne 0xd3be
        JNE SHORT L_D3BE
        ; D3B0: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; D3B3: D0 CE  ror dh, 1
        ROR          dh, 1
        ; D3B5: D0 CE  ror dh, 1
        ROR          dh, 1
        ; D3B7: 80 E6 C0  and dh, 0xc0
        AND          dh, 192
        ; D3BA: 0B C9  or cx, cx
        OR           cx, cx
        ; D3BC: 74 16  je 0xd3d4
        JE SHORT L_D3D4
L_D3BE LABEL NEAR
        ; D3BE: 32 E4  xor ah, ah
        XOR          ah, ah
        ; D3C0: AC  lodsb al, byte ptr [si]
        LODSB
        ; D3C1: D1 C8  ror ax, 1
        ROR          ax, 1
        ; D3C3: D1 C8  ror ax, 1
        ROR          ax, 1
        ; D3C5: 0A C6  or al, dh
        OR           al, dh
        ; D3C7: 8A F4  mov dh, ah
        MOV          dh, ah
        ; D3C9: 26 30 05  xor byte ptr es:[di], al
        XOR          byte ptr es:[di], al
        ; D3CC: 47  inc di
        INC          di
        ; D3CD: E2 EF  loop 0xd3be
        LOOP L_D3BE
        ; D3CF: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; D3D2: 74 03  je 0xd3d7
        JE SHORT L_D3D7
L_D3D4 LABEL NEAR
        ; D3D4: 26 30 35  xor byte ptr es:[di], dh
        XOR          byte ptr es:[di], dh
L_D3D7 LABEL NEAR
        ; D3D7: 03 7E D4  add di, word ptr [bp - 0x2c]
        ADD          di, word ptr [bp - 44]
        ; D3DA: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; D3DD: 4B  dec bx
        DEC          bx
        ; D3DE: 7F C6  jg 0xd3a6
        JG SHORT L_D3A6
        ; D3E0: 03 76 C8  add si, word ptr [bp - 0x38]
        ADD          si, word ptr [bp - 56]
        ; D3E3: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; D3E7: 7D AE  jge 0xd397
        JGE SHORT L_D397
        ; D3E9: E9 53 FF  jmp 0xd33f
        JMP NEAR PTR L_D33F
L_D3EC LABEL NEAR
        ; D3EC: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; D3EF: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; D3F2: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; D3F5: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; D3F8: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_D3FB LABEL NEAR
        ; D3FB: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; D3FE: 32 F6  xor dh, dh
        XOR          dh, dh
        ; D400: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; D403: 75 10  jne 0xd415
        JNE SHORT L_D415
        ; D405: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; D408: D0 CE  ror dh, 1
        ROR          dh, 1
        ; D40A: D0 CE  ror dh, 1
        ROR          dh, 1
        ; D40C: D0 CE  ror dh, 1
        ROR          dh, 1
        ; D40E: 80 E6 E0  and dh, 0xe0
        AND          dh, 224
        ; D411: 0B C9  or cx, cx
        OR           cx, cx
        ; D413: 74 18  je 0xd42d
        JE SHORT L_D42D
L_D415 LABEL NEAR
        ; D415: 32 E4  xor ah, ah
        XOR          ah, ah
        ; D417: AC  lodsb al, byte ptr [si]
        LODSB
        ; D418: D1 C8  ror ax, 1
        ROR          ax, 1
        ; D41A: D1 C8  ror ax, 1
        ROR          ax, 1
        ; D41C: D1 C8  ror ax, 1
        ROR          ax, 1
        ; D41E: 0A C6  or al, dh
        OR           al, dh
        ; D420: 8A F4  mov dh, ah
        MOV          dh, ah
        ; D422: 26 30 05  xor byte ptr es:[di], al
        XOR          byte ptr es:[di], al
        ; D425: 47  inc di
        INC          di
        ; D426: E2 ED  loop 0xd415
        LOOP L_D415
        ; D428: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; D42B: 74 03  je 0xd430
        JE SHORT L_D430
L_D42D LABEL NEAR
        ; D42D: 26 30 35  xor byte ptr es:[di], dh
        XOR          byte ptr es:[di], dh
L_D430 LABEL NEAR
        ; D430: 03 7E D4  add di, word ptr [bp - 0x2c]
        ADD          di, word ptr [bp - 44]
        ; D433: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; D436: 4B  dec bx
        DEC          bx
        ; D437: 7F C2  jg 0xd3fb
        JG SHORT L_D3FB
        ; D439: 03 76 C8  add si, word ptr [bp - 0x38]
        ADD          si, word ptr [bp - 56]
        ; D43C: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; D440: 7D AA  jge 0xd3ec
        JGE SHORT L_D3EC
        ; D442: E9 FA FE  jmp 0xd33f
        JMP NEAR PTR L_D33F
L_D445 LABEL NEAR
        ; D445: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; D448: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; D44B: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; D44E: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; D451: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_D454 LABEL NEAR
        ; D454: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; D457: 32 F6  xor dh, dh
        XOR          dh, dh
        ; D459: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; D45C: 75 0F  jne 0xd46d
        JNE SHORT L_D46D
        ; D45E: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; D461: D0 E6  shl dh, 1
        SHL          dh, 1
        ; D463: D0 E6  shl dh, 1
        SHL          dh, 1
        ; D465: D0 E6  shl dh, 1
        SHL          dh, 1
        ; D467: D0 E6  shl dh, 1
        SHL          dh, 1
        ; D469: 0B C9  or cx, cx
        OR           cx, cx
        ; D46B: 74 1A  je 0xd487
        JE SHORT L_D487
L_D46D LABEL NEAR
        ; D46D: 32 E4  xor ah, ah
        XOR          ah, ah
        ; D46F: AC  lodsb al, byte ptr [si]
        LODSB
        ; D470: D1 C8  ror ax, 1
        ROR          ax, 1
        ; D472: D1 C8  ror ax, 1
        ROR          ax, 1
        ; D474: D1 C8  ror ax, 1
        ROR          ax, 1
        ; D476: D1 C8  ror ax, 1
        ROR          ax, 1
        ; D478: 0A C6  or al, dh
        OR           al, dh
        ; D47A: 8A F4  mov dh, ah
        MOV          dh, ah
        ; D47C: 26 30 05  xor byte ptr es:[di], al
        XOR          byte ptr es:[di], al
        ; D47F: 47  inc di
        INC          di
        ; D480: E2 EB  loop 0xd46d
        LOOP L_D46D
        ; D482: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; D485: 74 03  je 0xd48a
        JE SHORT L_D48A
L_D487 LABEL NEAR
        ; D487: 26 30 35  xor byte ptr es:[di], dh
        XOR          byte ptr es:[di], dh
L_D48A LABEL NEAR
        ; D48A: 03 7E D4  add di, word ptr [bp - 0x2c]
        ADD          di, word ptr [bp - 44]
        ; D48D: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; D490: 4B  dec bx
        DEC          bx
        ; D491: 7F C1  jg 0xd454
        JG SHORT L_D454
        ; D493: 03 76 C8  add si, word ptr [bp - 0x38]
        ADD          si, word ptr [bp - 56]
        ; D496: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; D49A: 7D A9  jge 0xd445
        JGE SHORT L_D445
        ; D49C: E9 A0 FE  jmp 0xd33f
        JMP NEAR PTR L_D33F
L_D49F LABEL NEAR
        ; D49F: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; D4A2: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; D4A5: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; D4A8: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; D4AB: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_D4AE LABEL NEAR
        ; D4AE: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; D4B1: 32 F6  xor dh, dh
        XOR          dh, dh
        ; D4B3: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; D4B6: 75 0D  jne 0xd4c5
        JNE SHORT L_D4C5
        ; D4B8: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; D4BB: D0 E6  shl dh, 1
        SHL          dh, 1
        ; D4BD: D0 E6  shl dh, 1
        SHL          dh, 1
        ; D4BF: D0 E6  shl dh, 1
        SHL          dh, 1
        ; D4C1: 0B C9  or cx, cx
        OR           cx, cx
        ; D4C3: 74 1A  je 0xd4df
        JE SHORT L_D4DF
L_D4C5 LABEL NEAR
        ; D4C5: 32 E4  xor ah, ah
        XOR          ah, ah
        ; D4C7: AC  lodsb al, byte ptr [si]
        LODSB
        ; D4C8: D1 C0  rol ax, 1
        ROL          ax, 1
        ; D4CA: D1 C0  rol ax, 1
        ROL          ax, 1
        ; D4CC: D1 C0  rol ax, 1
        ROL          ax, 1
        ; D4CE: 86 C4  xchg ah, al
        XCHG         al, ah
        ; D4D0: 0A C6  or al, dh
        OR           al, dh
        ; D4D2: 8A F4  mov dh, ah
        MOV          dh, ah
        ; D4D4: 26 30 05  xor byte ptr es:[di], al
        XOR          byte ptr es:[di], al
        ; D4D7: 47  inc di
        INC          di
        ; D4D8: E2 EB  loop 0xd4c5
        LOOP L_D4C5
        ; D4DA: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; D4DD: 74 03  je 0xd4e2
        JE SHORT L_D4E2
L_D4DF LABEL NEAR
        ; D4DF: 26 30 35  xor byte ptr es:[di], dh
        XOR          byte ptr es:[di], dh
L_D4E2 LABEL NEAR
        ; D4E2: 03 7E D4  add di, word ptr [bp - 0x2c]
        ADD          di, word ptr [bp - 44]
        ; D4E5: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; D4E8: 4B  dec bx
        DEC          bx
        ; D4E9: 7F C3  jg 0xd4ae
        JG SHORT L_D4AE
        ; D4EB: 03 76 C8  add si, word ptr [bp - 0x38]
        ADD          si, word ptr [bp - 56]
        ; D4EE: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; D4F2: 7D AB  jge 0xd49f
        JGE SHORT L_D49F
        ; D4F4: E9 48 FE  jmp 0xd33f
        JMP NEAR PTR L_D33F
L_D4F7 LABEL NEAR
        ; D4F7: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; D4FA: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; D4FD: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; D500: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; D503: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_D506 LABEL NEAR
        ; D506: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; D509: 32 F6  xor dh, dh
        XOR          dh, dh
        ; D50B: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; D50E: 75 0B  jne 0xd51b
        JNE SHORT L_D51B
        ; D510: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; D513: D0 E6  shl dh, 1
        SHL          dh, 1
        ; D515: D0 E6  shl dh, 1
        SHL          dh, 1
        ; D517: 0B C9  or cx, cx
        OR           cx, cx
        ; D519: 74 18  je 0xd533
        JE SHORT L_D533
L_D51B LABEL NEAR
        ; D51B: 32 E4  xor ah, ah
        XOR          ah, ah
        ; D51D: AC  lodsb al, byte ptr [si]
        LODSB
        ; D51E: D1 C0  rol ax, 1
        ROL          ax, 1
        ; D520: D1 C0  rol ax, 1
        ROL          ax, 1
        ; D522: 86 C4  xchg ah, al
        XCHG         al, ah
        ; D524: 0A C6  or al, dh
        OR           al, dh
        ; D526: 8A F4  mov dh, ah
        MOV          dh, ah
        ; D528: 26 30 05  xor byte ptr es:[di], al
        XOR          byte ptr es:[di], al
        ; D52B: 47  inc di
        INC          di
        ; D52C: E2 ED  loop 0xd51b
        LOOP L_D51B
        ; D52E: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; D531: 74 03  je 0xd536
        JE SHORT L_D536
L_D533 LABEL NEAR
        ; D533: 26 30 35  xor byte ptr es:[di], dh
        XOR          byte ptr es:[di], dh
L_D536 LABEL NEAR
        ; D536: 03 7E D4  add di, word ptr [bp - 0x2c]
        ADD          di, word ptr [bp - 44]
        ; D539: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; D53C: 4B  dec bx
        DEC          bx
        ; D53D: 7F C7  jg 0xd506
        JG SHORT L_D506
        ; D53F: 03 76 C8  add si, word ptr [bp - 0x38]
        ADD          si, word ptr [bp - 56]
        ; D542: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; D546: 7D AF  jge 0xd4f7
        JGE SHORT L_D4F7
        ; D548: E9 F4 FD  jmp 0xd33f
        JMP NEAR PTR L_D33F
L_D54B LABEL NEAR
        ; D54B: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; D54E: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; D551: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; D554: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; D557: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_D55A LABEL NEAR
        ; D55A: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; D55D: 32 F6  xor dh, dh
        XOR          dh, dh
        ; D55F: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; D562: 75 09  jne 0xd56d
        JNE SHORT L_D56D
        ; D564: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; D567: D0 E6  shl dh, 1
        SHL          dh, 1
        ; D569: 0B C9  or cx, cx
        OR           cx, cx
        ; D56B: 74 16  je 0xd583
        JE SHORT L_D583
L_D56D LABEL NEAR
        ; D56D: 32 E4  xor ah, ah
        XOR          ah, ah
        ; D56F: AC  lodsb al, byte ptr [si]
        LODSB
        ; D570: D1 C0  rol ax, 1
        ROL          ax, 1
        ; D572: 86 C4  xchg ah, al
        XCHG         al, ah
        ; D574: 0A C6  or al, dh
        OR           al, dh
        ; D576: 8A F4  mov dh, ah
        MOV          dh, ah
        ; D578: 26 30 05  xor byte ptr es:[di], al
        XOR          byte ptr es:[di], al
        ; D57B: 47  inc di
        INC          di
        ; D57C: E2 EF  loop 0xd56d
        LOOP L_D56D
        ; D57E: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; D581: 74 03  je 0xd586
        JE SHORT L_D586
L_D583 LABEL NEAR
        ; D583: 26 30 35  xor byte ptr es:[di], dh
        XOR          byte ptr es:[di], dh
L_D586 LABEL NEAR
        ; D586: 03 7E D4  add di, word ptr [bp - 0x2c]
        ADD          di, word ptr [bp - 44]
        ; D589: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; D58C: 4B  dec bx
        DEC          bx
        ; D58D: 7F CB  jg 0xd55a
        JG SHORT L_D55A
        ; D58F: 03 76 C8  add si, word ptr [bp - 0x38]
        ADD          si, word ptr [bp - 56]
        ; D592: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; D596: 7D B3  jge 0xd54b
        JGE SHORT L_D54B
        ; D598: E9 A4 FD  jmp 0xd33f
        JMP NEAR PTR L_D33F
L_D59B LABEL NEAR
        ; D59B: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; D59E: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
L_D5A1 LABEL NEAR
        ; D5A1: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_D5A4 LABEL NEAR
        ; D5A4: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; D5A7: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; D5AA: B0 02  mov al, 2
        MOV          al, 2
        ; D5AC: EE  out dx, al
        OUT          dx, al
        ; D5AD: 42  inc dx
        INC          dx
        ; D5AE: 8A C1  mov al, cl
        MOV          al, cl
        ; D5B0: EE  out dx, al
        OUT          dx, al
        ; D5B1: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; D5B4: B0 04  mov al, 4
        MOV          al, 4
        ; D5B6: EE  out dx, al
        OUT          dx, al
        ; D5B7: 42  inc dx
        INC          dx
        ; D5B8: 8A C5  mov al, ch
        MOV          al, ch
        ; D5BA: EE  out dx, al
        OUT          dx, al
        ; D5BB: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; D5BE: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; D5C1: 32 F6  xor dh, dh
        XOR          dh, dh
        ; D5C3: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; D5C6: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; D5C9: 75 0C  jne 0xd5d7
        JNE SHORT L_D5D7
        ; D5CB: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; D5CE: D0 CE  ror dh, 1
        ROR          dh, 1
        ; D5D0: 80 E6 80  and dh, 0x80
        AND          dh, 128
        ; D5D3: 0B C9  or cx, cx
        OR           cx, cx
        ; D5D5: 74 17  je 0xd5ee
        JE SHORT L_D5EE
L_D5D7 LABEL NEAR
        ; D5D7: 80 E6 80  and dh, 0x80
        AND          dh, 128
L_D5DA LABEL NEAR
        ; D5DA: 32 E4  xor ah, ah
        XOR          ah, ah
        ; D5DC: AC  lodsb al, byte ptr [si]
        LODSB
        ; D5DD: D1 C8  ror ax, 1
        ROR          ax, 1
        ; D5DF: 0A C6  or al, dh
        OR           al, dh
        ; D5E1: 8A F4  mov dh, ah
        MOV          dh, ah
        ; D5E3: AA  stosb byte ptr es:[di], al
        STOSB
        ; D5E4: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; D5E7: E2 F1  loop 0xd5da
        LOOP L_D5DA
        ; D5E9: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; D5EC: 74 03  je 0xd5f1
        JE SHORT L_D5F1
L_D5EE LABEL NEAR
        ; D5EE: 26 88 35  mov byte ptr es:[di], dh
        MOV          byte ptr es:[di], dh
L_D5F1 LABEL NEAR
        ; D5F1: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; D5F4: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; D5F8: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; D5FB: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; D5FE: 72 A4  jb 0xd5a4
        JB SHORT L_D5A4
        ; D600: 83 C7 28  add di, 0x28
        ADD          di, 40
        ; D603: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; D606: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; D609: 7F 96  jg 0xd5a1
        JG SHORT L_D5A1
L_D60B LABEL NEAR
        ; D60B: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; D60E: B0 03  mov al, 3
        MOV          al, 3
        ; D610: EE  out dx, al
        OUT          dx, al
        ; D611: 42  inc dx
        INC          dx
        ; D612: B0 00  mov al, 0
        MOV          al, 0
        ; D614: EE  out dx, al
        OUT          dx, al
        ; D615: 83 C4 44  add sp, 0x44
        ADD          sp, 68
        ; D618: 5F  pop di
        POP          di
        ; D619: 5E  pop si
        POP          si
        ; D61A: 1F  pop ds
        POP          ds
        ; D61B: 5D  pop bp
        POP          bp
        ; D61C: C3  ret
        RET
L_D61D LABEL NEAR
        ; D61D: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; D620: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
L_D623 LABEL NEAR
        ; D623: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_D626 LABEL NEAR
        ; D626: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; D629: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; D62C: B0 02  mov al, 2
        MOV          al, 2
        ; D62E: EE  out dx, al
        OUT          dx, al
        ; D62F: 42  inc dx
        INC          dx
        ; D630: 8A C1  mov al, cl
        MOV          al, cl
        ; D632: EE  out dx, al
        OUT          dx, al
        ; D633: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; D636: B0 04  mov al, 4
        MOV          al, 4
        ; D638: EE  out dx, al
        OUT          dx, al
        ; D639: 42  inc dx
        INC          dx
        ; D63A: 8A C5  mov al, ch
        MOV          al, ch
        ; D63C: EE  out dx, al
        OUT          dx, al
        ; D63D: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; D640: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; D643: 32 F6  xor dh, dh
        XOR          dh, dh
        ; D645: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; D648: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; D64B: 75 0E  jne 0xd65b
        JNE SHORT L_D65B
        ; D64D: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; D650: D0 CE  ror dh, 1
        ROR          dh, 1
        ; D652: D0 CE  ror dh, 1
        ROR          dh, 1
        ; D654: 80 E6 C0  and dh, 0xc0
        AND          dh, 192
        ; D657: 0B C9  or cx, cx
        OR           cx, cx
        ; D659: 74 19  je 0xd674
        JE SHORT L_D674
L_D65B LABEL NEAR
        ; D65B: 80 E6 C0  and dh, 0xc0
        AND          dh, 192
L_D65E LABEL NEAR
        ; D65E: 32 E4  xor ah, ah
        XOR          ah, ah
        ; D660: AC  lodsb al, byte ptr [si]
        LODSB
        ; D661: D1 C8  ror ax, 1
        ROR          ax, 1
        ; D663: D1 C8  ror ax, 1
        ROR          ax, 1
        ; D665: 0A C6  or al, dh
        OR           al, dh
        ; D667: 8A F4  mov dh, ah
        MOV          dh, ah
        ; D669: AA  stosb byte ptr es:[di], al
        STOSB
        ; D66A: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; D66D: E2 EF  loop 0xd65e
        LOOP L_D65E
        ; D66F: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; D672: 74 03  je 0xd677
        JE SHORT L_D677
L_D674 LABEL NEAR
        ; D674: 26 88 35  mov byte ptr es:[di], dh
        MOV          byte ptr es:[di], dh
L_D677 LABEL NEAR
        ; D677: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; D67A: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; D67E: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; D681: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; D684: 72 A0  jb 0xd626
        JB SHORT L_D626
        ; D686: 83 C7 28  add di, 0x28
        ADD          di, 40
        ; D689: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; D68C: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; D68F: 7F 92  jg 0xd623
        JG SHORT L_D623
        ; D691: E9 77 FF  jmp 0xd60b
        JMP NEAR PTR L_D60B
L_D694 LABEL NEAR
        ; D694: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; D697: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
L_D69A LABEL NEAR
        ; D69A: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_D69D LABEL NEAR
        ; D69D: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; D6A0: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; D6A3: B0 02  mov al, 2
        MOV          al, 2
        ; D6A5: EE  out dx, al
        OUT          dx, al
        ; D6A6: 42  inc dx
        INC          dx
        ; D6A7: 8A C1  mov al, cl
        MOV          al, cl
        ; D6A9: EE  out dx, al
        OUT          dx, al
        ; D6AA: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; D6AD: B0 04  mov al, 4
        MOV          al, 4
        ; D6AF: EE  out dx, al
        OUT          dx, al
        ; D6B0: 42  inc dx
        INC          dx
        ; D6B1: 8A C5  mov al, ch
        MOV          al, ch
        ; D6B3: EE  out dx, al
        OUT          dx, al
        ; D6B4: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; D6B7: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; D6BA: 32 F6  xor dh, dh
        XOR          dh, dh
        ; D6BC: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; D6BF: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; D6C2: 75 10  jne 0xd6d4
        JNE SHORT L_D6D4
        ; D6C4: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; D6C7: D0 CE  ror dh, 1
        ROR          dh, 1
        ; D6C9: D0 CE  ror dh, 1
        ROR          dh, 1
        ; D6CB: D0 CE  ror dh, 1
        ROR          dh, 1
        ; D6CD: 80 E6 E0  and dh, 0xe0
        AND          dh, 224
        ; D6D0: 0B C9  or cx, cx
        OR           cx, cx
        ; D6D2: 74 1B  je 0xd6ef
        JE SHORT L_D6EF
L_D6D4 LABEL NEAR
        ; D6D4: 80 E6 E0  and dh, 0xe0
        AND          dh, 224
L_D6D7 LABEL NEAR
        ; D6D7: 32 E4  xor ah, ah
        XOR          ah, ah
        ; D6D9: AC  lodsb al, byte ptr [si]
        LODSB
        ; D6DA: D1 C8  ror ax, 1
        ROR          ax, 1
        ; D6DC: D1 C8  ror ax, 1
        ROR          ax, 1
        ; D6DE: D1 C8  ror ax, 1
        ROR          ax, 1
        ; D6E0: 0A C6  or al, dh
        OR           al, dh
        ; D6E2: 8A F4  mov dh, ah
        MOV          dh, ah
        ; D6E4: AA  stosb byte ptr es:[di], al
        STOSB
        ; D6E5: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; D6E8: E2 ED  loop 0xd6d7
        LOOP L_D6D7
        ; D6EA: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; D6ED: 74 03  je 0xd6f2
        JE SHORT L_D6F2
L_D6EF LABEL NEAR
        ; D6EF: 26 88 35  mov byte ptr es:[di], dh
        MOV          byte ptr es:[di], dh
L_D6F2 LABEL NEAR
        ; D6F2: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; D6F5: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; D6F9: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; D6FC: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; D6FF: 72 9C  jb 0xd69d
        JB SHORT L_D69D
        ; D701: 83 C7 28  add di, 0x28
        ADD          di, 40
        ; D704: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; D707: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; D70A: 7F 8E  jg 0xd69a
        JG SHORT L_D69A
        ; D70C: E9 FC FE  jmp 0xd60b
        JMP NEAR PTR L_D60B
L_D70F LABEL NEAR
        ; D70F: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; D712: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
L_D715 LABEL NEAR
        ; D715: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_D718 LABEL NEAR
        ; D718: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; D71B: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; D71E: B0 02  mov al, 2
        MOV          al, 2
        ; D720: EE  out dx, al
        OUT          dx, al
        ; D721: 42  inc dx
        INC          dx
        ; D722: 8A C1  mov al, cl
        MOV          al, cl
        ; D724: EE  out dx, al
        OUT          dx, al
        ; D725: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; D728: B0 04  mov al, 4
        MOV          al, 4
        ; D72A: EE  out dx, al
        OUT          dx, al
        ; D72B: 42  inc dx
        INC          dx
        ; D72C: 8A C5  mov al, ch
        MOV          al, ch
        ; D72E: EE  out dx, al
        OUT          dx, al
        ; D72F: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; D732: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; D735: 32 F6  xor dh, dh
        XOR          dh, dh
        ; D737: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; D73A: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; D73D: 75 0F  jne 0xd74e
        JNE SHORT L_D74E
        ; D73F: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; D742: D0 E6  shl dh, 1
        SHL          dh, 1
        ; D744: D0 E6  shl dh, 1
        SHL          dh, 1
        ; D746: D0 E6  shl dh, 1
        SHL          dh, 1
        ; D748: D0 E6  shl dh, 1
        SHL          dh, 1
        ; D74A: 0B C9  or cx, cx
        OR           cx, cx
        ; D74C: 74 1D  je 0xd76b
        JE SHORT L_D76B
L_D74E LABEL NEAR
        ; D74E: 80 E6 F0  and dh, 0xf0
        AND          dh, 240
L_D751 LABEL NEAR
        ; D751: 32 E4  xor ah, ah
        XOR          ah, ah
        ; D753: AC  lodsb al, byte ptr [si]
        LODSB
        ; D754: D1 C8  ror ax, 1
        ROR          ax, 1
        ; D756: D1 C8  ror ax, 1
        ROR          ax, 1
        ; D758: D1 C8  ror ax, 1
        ROR          ax, 1
        ; D75A: D1 C8  ror ax, 1
        ROR          ax, 1
        ; D75C: 0A C6  or al, dh
        OR           al, dh
        ; D75E: 8A F4  mov dh, ah
        MOV          dh, ah
        ; D760: AA  stosb byte ptr es:[di], al
        STOSB
        ; D761: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; D764: E2 EB  loop 0xd751
        LOOP L_D751
        ; D766: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; D769: 74 03  je 0xd76e
        JE SHORT L_D76E
L_D76B LABEL NEAR
        ; D76B: 26 88 35  mov byte ptr es:[di], dh
        MOV          byte ptr es:[di], dh
L_D76E LABEL NEAR
        ; D76E: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; D771: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; D775: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; D778: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; D77B: 72 9B  jb 0xd718
        JB SHORT L_D718
        ; D77D: 83 C7 28  add di, 0x28
        ADD          di, 40
        ; D780: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; D783: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; D786: 7F 8D  jg 0xd715
        JG SHORT L_D715
        ; D788: E9 80 FE  jmp 0xd60b
        JMP NEAR PTR L_D60B
L_D78B LABEL NEAR
        ; D78B: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; D78E: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
L_D791 LABEL NEAR
        ; D791: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_D794 LABEL NEAR
        ; D794: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; D797: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; D79A: B0 02  mov al, 2
        MOV          al, 2
        ; D79C: EE  out dx, al
        OUT          dx, al
        ; D79D: 42  inc dx
        INC          dx
        ; D79E: 8A C1  mov al, cl
        MOV          al, cl
        ; D7A0: EE  out dx, al
        OUT          dx, al
        ; D7A1: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; D7A4: B0 04  mov al, 4
        MOV          al, 4
        ; D7A6: EE  out dx, al
        OUT          dx, al
        ; D7A7: 42  inc dx
        INC          dx
        ; D7A8: 8A C5  mov al, ch
        MOV          al, ch
        ; D7AA: EE  out dx, al
        OUT          dx, al
        ; D7AB: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; D7AE: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; D7B1: 32 F6  xor dh, dh
        XOR          dh, dh
        ; D7B3: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; D7B6: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; D7B9: 75 0D  jne 0xd7c8
        JNE SHORT L_D7C8
        ; D7BB: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; D7BE: D0 E6  shl dh, 1
        SHL          dh, 1
        ; D7C0: D0 E6  shl dh, 1
        SHL          dh, 1
        ; D7C2: D0 E6  shl dh, 1
        SHL          dh, 1
        ; D7C4: 0B C9  or cx, cx
        OR           cx, cx
        ; D7C6: 74 1D  je 0xd7e5
        JE SHORT L_D7E5
L_D7C8 LABEL NEAR
        ; D7C8: 80 E6 F8  and dh, 0xf8
        AND          dh, 248
L_D7CB LABEL NEAR
        ; D7CB: 32 E4  xor ah, ah
        XOR          ah, ah
        ; D7CD: AC  lodsb al, byte ptr [si]
        LODSB
        ; D7CE: D1 C0  rol ax, 1
        ROL          ax, 1
        ; D7D0: D1 C0  rol ax, 1
        ROL          ax, 1
        ; D7D2: D1 C0  rol ax, 1
        ROL          ax, 1
        ; D7D4: 86 C4  xchg ah, al
        XCHG         al, ah
        ; D7D6: 0A C6  or al, dh
        OR           al, dh
        ; D7D8: 8A F4  mov dh, ah
        MOV          dh, ah
        ; D7DA: AA  stosb byte ptr es:[di], al
        STOSB
        ; D7DB: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; D7DE: E2 EB  loop 0xd7cb
        LOOP L_D7CB
        ; D7E0: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; D7E3: 74 03  je 0xd7e8
        JE SHORT L_D7E8
L_D7E5 LABEL NEAR
        ; D7E5: 26 88 35  mov byte ptr es:[di], dh
        MOV          byte ptr es:[di], dh
L_D7E8 LABEL NEAR
        ; D7E8: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; D7EB: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; D7EF: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; D7F2: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; D7F5: 72 9D  jb 0xd794
        JB SHORT L_D794
        ; D7F7: 83 C7 28  add di, 0x28
        ADD          di, 40
        ; D7FA: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; D7FD: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; D800: 7F 8F  jg 0xd791
        JG SHORT L_D791
        ; D802: E9 06 FE  jmp 0xd60b
        JMP NEAR PTR L_D60B
L_D805 LABEL NEAR
        ; D805: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; D808: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
L_D80B LABEL NEAR
        ; D80B: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_D80E LABEL NEAR
        ; D80E: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; D811: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; D814: B0 02  mov al, 2
        MOV          al, 2
        ; D816: EE  out dx, al
        OUT          dx, al
        ; D817: 42  inc dx
        INC          dx
        ; D818: 8A C1  mov al, cl
        MOV          al, cl
        ; D81A: EE  out dx, al
        OUT          dx, al
        ; D81B: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; D81E: B0 04  mov al, 4
        MOV          al, 4
        ; D820: EE  out dx, al
        OUT          dx, al
        ; D821: 42  inc dx
        INC          dx
        ; D822: 8A C5  mov al, ch
        MOV          al, ch
        ; D824: EE  out dx, al
        OUT          dx, al
        ; D825: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; D828: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; D82B: 32 F6  xor dh, dh
        XOR          dh, dh
        ; D82D: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; D830: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; D833: 75 0B  jne 0xd840
        JNE SHORT L_D840
        ; D835: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; D838: D0 E6  shl dh, 1
        SHL          dh, 1
        ; D83A: D0 E6  shl dh, 1
        SHL          dh, 1
        ; D83C: 0B C9  or cx, cx
        OR           cx, cx
        ; D83E: 74 1B  je 0xd85b
        JE SHORT L_D85B
L_D840 LABEL NEAR
        ; D840: 80 E6 FC  and dh, 0xfc
        AND          dh, 252
L_D843 LABEL NEAR
        ; D843: 32 E4  xor ah, ah
        XOR          ah, ah
        ; D845: AC  lodsb al, byte ptr [si]
        LODSB
        ; D846: D1 C0  rol ax, 1
        ROL          ax, 1
        ; D848: D1 C0  rol ax, 1
        ROL          ax, 1
        ; D84A: 86 C4  xchg ah, al
        XCHG         al, ah
        ; D84C: 0A C6  or al, dh
        OR           al, dh
        ; D84E: 8A F4  mov dh, ah
        MOV          dh, ah
        ; D850: AA  stosb byte ptr es:[di], al
        STOSB
        ; D851: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; D854: E2 ED  loop 0xd843
        LOOP L_D843
        ; D856: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; D859: 74 03  je 0xd85e
        JE SHORT L_D85E
L_D85B LABEL NEAR
        ; D85B: 26 88 35  mov byte ptr es:[di], dh
        MOV          byte ptr es:[di], dh
L_D85E LABEL NEAR
        ; D85E: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; D861: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; D865: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; D868: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; D86B: 72 A1  jb 0xd80e
        JB SHORT L_D80E
        ; D86D: 83 C7 28  add di, 0x28
        ADD          di, 40
        ; D870: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; D873: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; D876: 7F 93  jg 0xd80b
        JG SHORT L_D80B
        ; D878: E9 90 FD  jmp 0xd60b
        JMP NEAR PTR L_D60B
L_D87B LABEL NEAR
        ; D87B: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; D87E: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
L_D881 LABEL NEAR
        ; D881: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_D884 LABEL NEAR
        ; D884: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; D887: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; D88A: B0 02  mov al, 2
        MOV          al, 2
        ; D88C: EE  out dx, al
        OUT          dx, al
        ; D88D: 42  inc dx
        INC          dx
        ; D88E: 8A C1  mov al, cl
        MOV          al, cl
        ; D890: EE  out dx, al
        OUT          dx, al
        ; D891: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; D894: B0 04  mov al, 4
        MOV          al, 4
        ; D896: EE  out dx, al
        OUT          dx, al
        ; D897: 42  inc dx
        INC          dx
        ; D898: 8A C5  mov al, ch
        MOV          al, ch
        ; D89A: EE  out dx, al
        OUT          dx, al
        ; D89B: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; D89E: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; D8A1: 32 F6  xor dh, dh
        XOR          dh, dh
        ; D8A3: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; D8A6: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; D8A9: 75 09  jne 0xd8b4
        JNE SHORT L_D8B4
        ; D8AB: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; D8AE: D0 E6  shl dh, 1
        SHL          dh, 1
        ; D8B0: 0B C9  or cx, cx
        OR           cx, cx
        ; D8B2: 74 19  je 0xd8cd
        JE SHORT L_D8CD
L_D8B4 LABEL NEAR
        ; D8B4: 80 E6 FE  and dh, 0xfe
        AND          dh, 254
L_D8B7 LABEL NEAR
        ; D8B7: 32 E4  xor ah, ah
        XOR          ah, ah
        ; D8B9: AC  lodsb al, byte ptr [si]
        LODSB
        ; D8BA: D1 C0  rol ax, 1
        ROL          ax, 1
        ; D8BC: 86 C4  xchg ah, al
        XCHG         al, ah
        ; D8BE: 0A C6  or al, dh
        OR           al, dh
        ; D8C0: 8A F4  mov dh, ah
        MOV          dh, ah
        ; D8C2: AA  stosb byte ptr es:[di], al
        STOSB
        ; D8C3: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; D8C6: E2 EF  loop 0xd8b7
        LOOP L_D8B7
        ; D8C8: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; D8CB: 74 03  je 0xd8d0
        JE SHORT L_D8D0
L_D8CD LABEL NEAR
        ; D8CD: 26 88 35  mov byte ptr es:[di], dh
        MOV          byte ptr es:[di], dh
L_D8D0 LABEL NEAR
        ; D8D0: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; D8D3: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; D8D7: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; D8DA: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; D8DD: 72 A5  jb 0xd884
        JB SHORT L_D884
        ; D8DF: 83 C7 28  add di, 0x28
        ADD          di, 40
        ; D8E2: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; D8E5: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; D8E8: 7F 97  jg 0xd881
        JG SHORT L_D881
        ; D8EA: E9 1E FD  jmp 0xd60b
        JMP NEAR PTR L_D60B
_TEXT ENDS
        END
