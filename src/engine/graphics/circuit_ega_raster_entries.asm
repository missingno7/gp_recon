; Circuit EGA near entry family A672..B123 reconstructed from image bytes.
; Names are descriptive reconstructions, not recovered symbols.
; This standalone module starts at its mapped routine/shared entry.
        .286
EXTRN _ext_9226:NEAR
EXTRN _ext_C67A:NEAR
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        PUBLIC _rcega_entries
_rcega_entries LABEL NEAR
        ; A672: 55  push bp
        PUSH         bp
        ; A673: 8B EC  mov bp, sp
        MOV          bp, sp
        ; A675: B8 68 AA  mov ax, 0xaa68
        MOV          ax, 43624
        ; A678: 89 46 C0  mov word ptr [bp - 0x40], ax
        MOV          word ptr [bp - 64], ax
        ; A67B: B8 78 AA  mov ax, 0xaa78
        MOV          ax, 43640
        ; A67E: 89 46 B6  mov word ptr [bp - 0x4a], ax
        MOV          word ptr [bp - 74], ax
        ; A681: C6 46 BE 00  mov byte ptr [bp - 0x42], 0
        MOV          byte ptr [bp - 66], 0
        ; A685: C6 46 BF 03  mov byte ptr [bp - 0x41], 3
        MOV          byte ptr [bp - 65], 3
        PUBLIC _rcega_setup_a689
_rcega_setup_a689 LABEL NEAR
        ; A689: 1E  push ds
        PUSH         ds
        ; A68A: 56  push si
        PUSH         si
        ; A68B: 57  push di
        PUSH         di
        ; A68C: 83 EC 44  sub sp, 0x44
        SUB          sp, 68
        ; A68F: 8E 5E 06  mov ds, word ptr [bp + 6]
        MOV          ds, word ptr [bp + 6]
        ; A692: 8B 76 04  mov si, word ptr [bp + 4]
        MOV          si, word ptr [bp + 4]
        ; A695: 8B 46 08  mov ax, word ptr [bp + 8]
        MOV          ax, word ptr [bp + 8]
        ; A698: 2B 44 04  sub ax, word ptr [si + 4]
        SUB          ax, word ptr [si + 4]
        ; A69B: 89 46 F8  mov word ptr [bp - 8], ax
        MOV          word ptr [bp - 8], ax
        ; A69E: 8B 46 0A  mov ax, word ptr [bp + 0xa]
        MOV          ax, word ptr [bp + 10]
        ; A6A1: 2B 44 06  sub ax, word ptr [si + 6]
        SUB          ax, word ptr [si + 6]
        ; A6A4: 89 46 F6  mov word ptr [bp - 0xa], ax
        MOV          word ptr [bp - 10], ax
        ; A6A7: EB 62  jmp 0xa70b
        JMP SHORT L_A70B
        ; A6A9: 90  nop
        NOP
        ; A6AA: 55  push bp
        PUSH         bp
        ; A6AB: 8B EC  mov bp, sp
        MOV          bp, sp
        ; A6AD: B8 68 AA  mov ax, 0xaa68
        MOV          ax, 43624
        ; A6B0: 89 46 C0  mov word ptr [bp - 0x40], ax
        MOV          word ptr [bp - 64], ax
        ; A6B3: B8 78 AA  mov ax, 0xaa78
        MOV          ax, 43640
        ; A6B6: 89 46 B6  mov word ptr [bp - 0x4a], ax
        MOV          word ptr [bp - 74], ax
        ; A6B9: C6 46 BE 00  mov byte ptr [bp - 0x42], 0
        MOV          byte ptr [bp - 66], 0
        ; A6BD: C6 46 BF 03  mov byte ptr [bp - 0x41], 3
        MOV          byte ptr [bp - 65], 3
        ; A6C1: 1E  push ds
        PUSH         ds
        ; A6C2: 56  push si
        PUSH         si
        ; A6C3: 57  push di
        PUSH         di
        ; A6C4: 83 EC 44  sub sp, 0x44
        SUB          sp, 68
        ; A6C7: 8E 5E 06  mov ds, word ptr [bp + 6]
        MOV          ds, word ptr [bp + 6]
        ; A6CA: 8B 76 04  mov si, word ptr [bp + 4]
        MOV          si, word ptr [bp + 4]
        ; A6CD: 8B 46 08  mov ax, word ptr [bp + 8]
        MOV          ax, word ptr [bp + 8]
        ; A6D0: 89 46 F8  mov word ptr [bp - 8], ax
        MOV          word ptr [bp - 8], ax
        ; A6D3: 8B 46 0A  mov ax, word ptr [bp + 0xa]
        MOV          ax, word ptr [bp + 10]
        ; A6D6: 89 46 F6  mov word ptr [bp - 0xa], ax
        MOV          word ptr [bp - 10], ax
        ; A6D9: EB 30  jmp 0xa70b
        JMP SHORT L_A70B
        ; A6DB: 90  nop
        NOP
        ; A6DC: 55  push bp
        PUSH         bp
        ; A6DD: 8B EC  mov bp, sp
        MOV          bp, sp
        ; A6DF: B8 68 AA  mov ax, 0xaa68
        MOV          ax, 43624
        ; A6E2: 89 46 C0  mov word ptr [bp - 0x40], ax
        MOV          word ptr [bp - 64], ax
        ; A6E5: B8 78 AA  mov ax, 0xaa78
        MOV          ax, 43640
        ; A6E8: 89 46 B6  mov word ptr [bp - 0x4a], ax
        MOV          word ptr [bp - 74], ax
        ; A6EB: C6 46 BE 00  mov byte ptr [bp - 0x42], 0
        MOV          byte ptr [bp - 66], 0
        ; A6EF: C6 46 BF 03  mov byte ptr [bp - 0x41], 3
        MOV          byte ptr [bp - 65], 3
        ; A6F3: 1E  push ds
        PUSH         ds
        ; A6F4: 56  push si
        PUSH         si
        ; A6F5: 57  push di
        PUSH         di
        ; A6F6: 83 EC 44  sub sp, 0x44
        SUB          sp, 68
        ; A6F9: 8E 5E 06  mov ds, word ptr [bp + 6]
        MOV          ds, word ptr [bp + 6]
        ; A6FC: 8B 76 04  mov si, word ptr [bp + 4]
        MOV          si, word ptr [bp + 4]
        ; A6FF: 8B 44 08  mov ax, word ptr [si + 8]
        MOV          ax, word ptr [si + 8]
        ; A702: 89 46 F8  mov word ptr [bp - 8], ax
        MOV          word ptr [bp - 8], ax
        ; A705: 8B 44 0A  mov ax, word ptr [si + 0xa]
        MOV          ax, word ptr [si + 10]
        ; A708: 89 46 F6  mov word ptr [bp - 0xa], ax
        MOV          word ptr [bp - 10], ax
L_A70B LABEL NEAR
        ; A70B: FC  cld
        CLD
        ; A70C: 8B 5E F6  mov bx, word ptr [bp - 0xa]
        MOV          bx, word ptr [bp - 10]
        ; A70F: 8B 4C 02  mov cx, word ptr [si + 2]
        MOV          cx, word ptr [si + 2]
        ; A712: 8D 54 10  lea dx, [si + 0x10]
        LEA          dx, [si + 16]
        ; A715: 8B C3  mov ax, bx
        MOV          ax, bx
        ; A717: 2E 3B 06 CA C7  cmp ax, word ptr cs:[0xc7ca]
        CMP          ax, word ptr cs:[51146]
        ; A71C: 7C 10  jl 0xa72e
        JL SHORT L_A72E
        ; A71E: 03 C1  add ax, cx
        ADD          ax, cx
        ; A720: 2E 2B 06 CC C7  sub ax, word ptr cs:[0xc7cc]
        SUB          ax, word ptr cs:[51148]
        ; A725: 7E 28  jle 0xa74f
        JLE SHORT L_A74F
        ; A727: 2B C8  sub cx, ax
        SUB          cx, ax
        ; A729: 7F 24  jg 0xa74f
        JG SHORT L_A74F
L_A72B LABEL NEAR
        ; A72B: E9 82 03  jmp 0xaab0
        JMP NEAR PTR L_AAB0
L_A72E LABEL NEAR
        ; A72E: 2E 8B 1E CA C7  mov bx, word ptr cs:[0xc7ca]
        MOV          bx, word ptr cs:[51146]
        ; A733: 03 C1  add ax, cx
        ADD          ax, cx
        ; A735: 2B C3  sub ax, bx
        SUB          ax, bx
        ; A737: 7E F2  jle 0xa72b
        JLE SHORT L_A72B
        ; A739: 91  xchg cx, ax
        XCHG         cx, ax
        ; A73A: 2B C1  sub ax, cx
        SUB          ax, cx
        ; A73C: F6 24  mul byte ptr [si]
        MUL          byte ptr [si]
        ; A73E: 03 D0  add dx, ax
        ADD          dx, ax
        ; A740: 8B C3  mov ax, bx
        MOV          ax, bx
        ; A742: 03 C1  add ax, cx
        ADD          ax, cx
        ; A744: 2E 2B 06 CC C7  sub ax, word ptr cs:[0xc7cc]
        SUB          ax, word ptr cs:[51148]
        ; A749: 7E 04  jle 0xa74f
        JLE SHORT L_A74F
        ; A74B: 2B C8  sub cx, ax
        SUB          cx, ax
        ; A74D: 7E DC  jle 0xa72b
        JLE SHORT L_A72B
L_A74F LABEL NEAR
        ; A74F: 89 56 D8  mov word ptr [bp - 0x28], dx
        MOV          word ptr [bp - 40], dx
        ; A752: 89 4E F2  mov word ptr [bp - 0xe], cx
        MOV          word ptr [bp - 14], cx
        ; A755: 89 5E F6  mov word ptr [bp - 0xa], bx
        MOV          word ptr [bp - 10], bx
        ; A758: C6 46 C2 03  mov byte ptr [bp - 0x3e], 3
        MOV          byte ptr [bp - 62], 3
        ; A75C: 8B 0C  mov cx, word ptr [si]
        MOV          cx, word ptr [si]
        ; A75E: 89 4E D2  mov word ptr [bp - 0x2e], cx
        MOV          word ptr [bp - 46], cx
        ; A761: 33 D2  xor dx, dx
        XOR          dx, dx
        ; A763: 8B 5E F8  mov bx, word ptr [bp - 8]
        MOV          bx, word ptr [bp - 8]
        ; A766: 8B C3  mov ax, bx
        MOV          ax, bx
        ; A768: 25 07 00  and ax, 7
        AND          ax, 7
        ; A76B: 89 46 CC  mov word ptr [bp - 0x34], ax
        MOV          word ptr [bp - 52], ax
        ; A76E: D1 FB  sar bx, 1
        SAR          bx, 1
        ; A770: D1 FB  sar bx, 1
        SAR          bx, 1
        ; A772: D1 FB  sar bx, 1
        SAR          bx, 1
        ; A774: 8B C3  mov ax, bx
        MOV          ax, bx
        ; A776: 2E 3B 06 C6 C7  cmp ax, word ptr cs:[0xc7c6]
        CMP          ax, word ptr cs:[51142]
        ; A77B: 7C 16  jl 0xa793
        JL SHORT L_A793
        ; A77D: 03 C1  add ax, cx
        ADD          ax, cx
        ; A77F: 2E 2B 06 C8 C7  sub ax, word ptr cs:[0xc7c8]
        SUB          ax, word ptr cs:[51144]
        ; A784: 7C 3A  jl 0xa7c0
        JL SHORT L_A7C0
        ; A786: C6 46 C2 02  mov byte ptr [bp - 0x3e], 2
        MOV          byte ptr [bp - 62], 2
        ; A78A: 2B C8  sub cx, ax
        SUB          cx, ax
        ; A78C: 7E 9D  jle 0xa72b
        JLE SHORT L_A72B
        ; A78E: 8B D0  mov dx, ax
        MOV          dx, ax
        ; A790: EB 2E  jmp 0xa7c0
        JMP SHORT L_A7C0
        ; A792: 90  nop
        NOP
L_A793 LABEL NEAR
        ; A793: 2E 8B 1E C6 C7  mov bx, word ptr cs:[0xc7c6]
        MOV          bx, word ptr cs:[51142]
        ; A798: 03 C1  add ax, cx
        ADD          ax, cx
        ; A79A: 2B C3  sub ax, bx
        SUB          ax, bx
        ; A79C: 7C 8D  jl 0xa72b
        JL SHORT L_A72B
        ; A79E: 8B F1  mov si, cx
        MOV          si, cx
        ; A7A0: 2B F0  sub si, ax
        SUB          si, ax
        ; A7A2: 01 76 D8  add word ptr [bp - 0x28], si
        ADD          word ptr [bp - 40], si
        ; A7A5: C6 46 C2 01  mov byte ptr [bp - 0x3e], 1
        MOV          byte ptr [bp - 62], 1
        ; A7A9: 2E 8B 36 C8 C7  mov si, word ptr cs:[0xc7c8]
        MOV          si, word ptr cs:[51144]
        ; A7AE: 2B F3  sub si, bx
        SUB          si, bx
        ; A7B0: 3B C6  cmp ax, si
        CMP          ax, si
        ; A7B2: 7C 06  jl 0xa7ba
        JL SHORT L_A7BA
        ; A7B4: 8B C6  mov ax, si
        MOV          ax, si
        ; A7B6: C6 46 C2 00  mov byte ptr [bp - 0x3e], 0
        MOV          byte ptr [bp - 62], 0
L_A7BA LABEL NEAR
        ; A7BA: 87 CA  xchg dx, cx
        XCHG         cx, dx
        ; A7BC: 2B D0  sub dx, ax
        SUB          dx, ax
        ; A7BE: 03 C8  add cx, ax
        ADD          cx, ax
L_A7C0 LABEL NEAR
        ; A7C0: 89 4E F4  mov word ptr [bp - 0xc], cx
        MOV          word ptr [bp - 12], cx
        ; A7C3: 89 56 CA  mov word ptr [bp - 0x36], dx
        MOV          word ptr [bp - 54], dx
        ; A7C6: 89 5E F8  mov word ptr [bp - 8], bx
        MOV          word ptr [bp - 8], bx
        ; A7C9: 8B 76 04  mov si, word ptr [bp + 4]
        MOV          si, word ptr [bp + 4]
        ; A7CC: 8B 5E F6  mov bx, word ptr [bp - 0xa]
        MOV          bx, word ptr [bp - 10]
        ; A7CF: D1 E3  shl bx, 1
        SHL          bx, 1
        ; A7D1: 2E 03 1E C4 C7  add bx, word ptr cs:[0xc7c4]
        ADD          bx, word ptr cs:[51140]
        ; A7D6: 8B 46 F8  mov ax, word ptr [bp - 8]
        MOV          ax, word ptr [bp - 8]
        ; A7D9: 2E 03 07  add ax, word ptr cs:[bx]
        ADD          ax, word ptr cs:[bx]
        ; A7DC: 89 46 D6  mov word ptr [bp - 0x2a], ax
        MOV          word ptr [bp - 42], ax
        ; A7DF: 8B 44 02  mov ax, word ptr [si + 2]
        MOV          ax, word ptr [si + 2]
        ; A7E2: F6 24  mul byte ptr [si]
        MUL          byte ptr [si]
        ; A7E4: F6 44 0F F0  test byte ptr [si + 0xf], 0xf0
        TEST         byte ptr [si + 15], 240
        ; A7E8: 74 0F  je 0xa7f9
        JE SHORT L_A7F9
        ; A7EA: 8A 54 0F  mov dl, byte ptr [si + 0xf]
        MOV          dl, byte ptr [si + 15]
        ; A7ED: D0 EA  shr dl, 1
        SHR          dl, 1
        ; A7EF: D0 EA  shr dl, 1
        SHR          dl, 1
        ; A7F1: D0 EA  shr dl, 1
        SHR          dl, 1
        ; A7F3: D0 EA  shr dl, 1
        SHR          dl, 1
        ; A7F5: 32 F6  xor dh, dh
        XOR          dh, dh
        ; A7F7: 03 C2  add ax, dx
        ADD          ax, dx
L_A7F9 LABEL NEAR
        ; A7F9: 89 46 C8  mov word ptr [bp - 0x38], ax
        MOV          word ptr [bp - 56], ax
        ; A7FC: 2E A1 CE C7  mov ax, word ptr cs:[0xc7ce]
        MOV          ax, word ptr cs:[51150]
        ; A800: 2B 46 F4  sub ax, word ptr [bp - 0xc]
        SUB          ax, word ptr [bp - 12]
        ; A803: 89 46 D4  mov word ptr [bp - 0x2c], ax
        MOV          word ptr [bp - 44], ax
        ; A806: 2E 81 3E BC C7 00 A0  cmp word ptr cs:[0xc7bc], 0xa000
        CMP          word ptr cs:[51132], 40960
        ; A80D: 75 03  jne 0xa812
        JNE SHORT L_A812
        ; A80F: E9 10 01  jmp 0xa922
        JMP NEAR PTR L_A922
L_A812 LABEL NEAR
        ; A812: 8D 74 0C  lea si, [si + 0xc]
        LEA          si, [si + 12]
        ; A815: 33 FF  xor di, di
        XOR          di, di
        ; A817: 8B 56 D8  mov dx, word ptr [bp - 0x28]
        MOV          dx, word ptr [bp - 40]
L_A81A LABEL NEAR
        ; A81A: 8A 1C  mov bl, byte ptr [si]
        MOV          bl, byte ptr [si]
        ; A81C: 83 E3 0F  and bx, 0xf
        AND          bx, 15
        ; A81F: 74 33  je 0xa854
        JE SHORT L_A854
L_A821 LABEL NEAR
        ; A821: 0B DB  or bx, bx
        OR           bx, bx
        ; A823: 74 24  je 0xa849
        JE SHORT L_A849
        ; A825: 8B CB  mov cx, bx
        MOV          cx, bx
        ; A827: 2E 8A 9F 4A A6  mov bl, byte ptr cs:[bx - 0x59b6]
        MOV          bl, byte ptr cs:[bx - 22966]
        ; A82C: 2E 22 8F 6A A6  and cl, byte ptr cs:[bx - 0x5996]
        AND          cl, byte ptr cs:[bx - 22934]
        ; A831: D1 E3  shl bx, 1
        SHL          bx, 1
        ; A833: 2E 8B 87 BC C7  mov ax, word ptr cs:[bx - 0x3844]
        MOV          ax, word ptr cs:[bx - 14404]
        ; A838: 8B D9  mov bx, cx
        MOV          bx, cx
        ; A83A: 0B C0  or ax, ax
        OR           ax, ax
        ; A83C: 74 E3  je 0xa821
        JE SHORT L_A821
        ; A83E: 89 43 EA  mov word ptr [bp + di - 0x16], ax
        MOV          word ptr [bp + di - 22], ax
        ; A841: 89 53 E2  mov word ptr [bp + di - 0x1e], dx
        MOV          word ptr [bp + di - 30], dx
        ; A844: 83 C7 02  add di, 2
        ADD          di, 2
        ; A847: EB D8  jmp 0xa821
        JMP SHORT L_A821
L_A849 LABEL NEAR
        ; A849: 83 FF 08  cmp di, 8
        CMP          di, 8
        ; A84C: 7D 06  jge 0xa854
        JGE SHORT L_A854
        ; A84E: 46  inc si
        INC          si
        ; A84F: 03 56 C8  add dx, word ptr [bp - 0x38]
        ADD          dx, word ptr [bp - 56]
        ; A852: EB C6  jmp 0xa81a
        JMP SHORT L_A81A
L_A854 LABEL NEAR
        ; A854: 83 EF 02  sub di, 2
        SUB          di, 2
        ; A857: 89 7E C6  mov word ptr [bp - 0x3a], di
        MOV          word ptr [bp - 58], di
        ; A85A: 8B 76 04  mov si, word ptr [bp + 4]
        MOV          si, word ptr [bp + 4]
        ; A85D: F6 44 0C F0  test byte ptr [si + 0xc], 0xf0
        TEST         byte ptr [si + 12], 240
        ; A861: 74 46  je 0xa8a9
        JE SHORT L_A8A9
        ; A863: F6 46 BF 01  test byte ptr [bp - 0x41], 1
        TEST         byte ptr [bp - 65], 1
        ; A867: 74 40  je 0xa8a9
        JE SHORT L_A8A9
        ; A869: C6 46 BC 10  mov byte ptr [bp - 0x44], 0x10
        MOV          byte ptr [bp - 68], 16
        ; A86D: C7 46 BA 00 00  mov word ptr [bp - 0x46], 0
        MOV          word ptr [bp - 70], 0
L_A872 LABEL NEAR
        ; A872: 8A 46 BC  mov al, byte ptr [bp - 0x44]
        MOV          al, byte ptr [bp - 68]
        ; A875: 84 44 0C  test byte ptr [si + 0xc], al
        TEST         byte ptr [si + 12], al
        ; A878: 74 26  je 0xa8a0
        JE SHORT L_A8A0
        ; A87A: 8B 5E BA  mov bx, word ptr [bp - 0x46]
        MOV          bx, word ptr [bp - 70]
        ; A87D: 2E 8B 87 BC C7  mov ax, word ptr cs:[bx - 0x3844]
        MOV          ax, word ptr cs:[bx - 14404]
        ; A882: 0B C0  or ax, ax
        OR           ax, ax
        ; A884: 74 1A  je 0xa8a0
        JE SHORT L_A8A0
        ; A886: 8E C0  mov es, ax
        MOV          es, ax
        ; A888: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; A88B: 8B 56 F4  mov dx, word ptr [bp - 0xc]
        MOV          dx, word ptr [bp - 12]
        ; A88E: 8B 76 F2  mov si, word ptr [bp - 0xe]
        MOV          si, word ptr [bp - 14]
        ; A891: 8B 4E D4  mov cx, word ptr [bp - 0x2c]
        MOV          cx, word ptr [bp - 44]
        ; A894: 8B 5E CC  mov bx, word ptr [bp - 0x34]
        MOV          bx, word ptr [bp - 52]
        ; A897: 8A 46 C2  mov al, byte ptr [bp - 0x3e]
        MOV          al, byte ptr [bp - 62]
        ; A89A: E8 89 E9  call 0x9226
        CALL _ext_9226
        ; A89D: 8B 76 04  mov si, word ptr [bp + 4]
        MOV          si, word ptr [bp + 4]
L_A8A0 LABEL NEAR
        ; A8A0: 83 46 BA 02  add word ptr [bp - 0x46], 2
        ADD          word ptr [bp - 70], 2
        ; A8A4: D0 66 BC  shl byte ptr [bp - 0x44], 1
        SHL          byte ptr [bp - 68], 1
        ; A8A7: 73 C9  jae 0xa872
        JAE SHORT L_A872
L_A8A9 LABEL NEAR
        ; A8A9: F6 44 0D F0  test byte ptr [si + 0xd], 0xf0
        TEST         byte ptr [si + 13], 240
        ; A8AD: 74 55  je 0xa904
        JE SHORT L_A904
        ; A8AF: F6 46 BF 06  test byte ptr [bp - 0x41], 6
        TEST         byte ptr [bp - 65], 6
        ; A8B3: 74 4F  je 0xa904
        JE SHORT L_A904
        ; A8B5: B8 8C 92  mov ax, 0x928c
        MOV          ax, 37516
        ; A8B8: F6 46 BF 04  test byte ptr [bp - 0x41], 4
        TEST         byte ptr [bp - 65], 4
        ; A8BC: 74 03  je 0xa8c1
        JE SHORT L_A8C1
        ; A8BE: B8 F2 92  mov ax, 0x92f2
        MOV          ax, 37618
L_A8C1 LABEL NEAR
        ; A8C1: 89 46 B8  mov word ptr [bp - 0x48], ax
        MOV          word ptr [bp - 72], ax
        ; A8C4: C6 46 BC 10  mov byte ptr [bp - 0x44], 0x10
        MOV          byte ptr [bp - 68], 16
        ; A8C8: C7 46 BA 00 00  mov word ptr [bp - 0x46], 0
        MOV          word ptr [bp - 70], 0
L_A8CD LABEL NEAR
        ; A8CD: 8A 46 BC  mov al, byte ptr [bp - 0x44]
        MOV          al, byte ptr [bp - 68]
        ; A8D0: 84 44 0D  test byte ptr [si + 0xd], al
        TEST         byte ptr [si + 13], al
        ; A8D3: 74 26  je 0xa8fb
        JE SHORT L_A8FB
        ; A8D5: 8B 5E BA  mov bx, word ptr [bp - 0x46]
        MOV          bx, word ptr [bp - 70]
        ; A8D8: 2E 8B 87 BC C7  mov ax, word ptr cs:[bx - 0x3844]
        MOV          ax, word ptr cs:[bx - 14404]
        ; A8DD: 0B C0  or ax, ax
        OR           ax, ax
        ; A8DF: 74 1A  je 0xa8fb
        JE SHORT L_A8FB
        ; A8E1: 8E C0  mov es, ax
        MOV          es, ax
        ; A8E3: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; A8E6: 8B 56 F4  mov dx, word ptr [bp - 0xc]
        MOV          dx, word ptr [bp - 12]
        ; A8E9: 8B 76 F2  mov si, word ptr [bp - 0xe]
        MOV          si, word ptr [bp - 14]
        ; A8EC: 8B 4E D4  mov cx, word ptr [bp - 0x2c]
        MOV          cx, word ptr [bp - 44]
        ; A8EF: 8B 5E CC  mov bx, word ptr [bp - 0x34]
        MOV          bx, word ptr [bp - 52]
        ; A8F2: 8A 46 C2  mov al, byte ptr [bp - 0x3e]
        MOV          al, byte ptr [bp - 62]
        ; A8F5: FF 56 B8  call word ptr [bp - 0x48]
        CALL         word ptr [bp - 72]
        ; A8F8: 8B 76 04  mov si, word ptr [bp + 4]
        MOV          si, word ptr [bp + 4]
L_A8FB LABEL NEAR
        ; A8FB: 83 46 BA 02  add word ptr [bp - 0x46], 2
        ADD          word ptr [bp - 70], 2
        ; A8FF: D0 66 BC  shl byte ptr [bp - 0x44], 1
        SHL          byte ptr [bp - 68], 1
        ; A902: 73 C9  jae 0xa8cd
        JAE SHORT L_A8CD
L_A904 LABEL NEAR
        ; A904: 83 7E C6 00  cmp word ptr [bp - 0x3a], 0
        CMP          word ptr [bp - 58], 0
        ; A908: 7C 15  jl 0xa91f
        JL SHORT L_A91F
        ; A90A: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; A90D: 8B 5E CC  mov bx, word ptr [bp - 0x34]
        MOV          bx, word ptr [bp - 52]
        ; A910: D1 E3  shl bx, 1
        SHL          bx, 1
        ; A912: 8B 46 F4  mov ax, word ptr [bp - 0xc]
        MOV          ax, word ptr [bp - 12]
        ; A915: 03 C3  add ax, bx
        ADD          ax, bx
        ; A917: 74 06  je 0xa91f
        JE SHORT L_A91F
        ; A919: 03 5E C0  add bx, word ptr [bp - 0x40]
        ADD          bx, word ptr [bp - 64]
        ; A91C: 2E FF 27  jmp word ptr cs:[bx]
        JMP          word ptr cs:[bx]
L_A91F LABEL NEAR
        ; A91F: E9 8E 01  jmp 0xaab0
        JMP NEAR PTR L_AAB0
L_A922 LABEL NEAR
        ; A922: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; A925: B0 03  mov al, 3
        MOV          al, 3
        ; A927: EE  out dx, al
        OUT          dx, al
        ; A928: 42  inc dx
        INC          dx
        ; A929: 8A 46 BE  mov al, byte ptr [bp - 0x42]
        MOV          al, byte ptr [bp - 66]
        ; A92C: EE  out dx, al
        OUT          dx, al
        ; A92D: 2E 8E 06 BC C7  mov es, word ptr cs:[0xc7bc]
        MOV          es, word ptr cs:[51132]
        ; A932: 8B 46 C8  mov ax, word ptr [bp - 0x38]
        MOV          ax, word ptr [bp - 56]
        ; A935: 2B 46 F4  sub ax, word ptr [bp - 0xc]
        SUB          ax, word ptr [bp - 12]
        ; A938: 89 46 D0  mov word ptr [bp - 0x30], ax
        MOV          word ptr [bp - 48], ax
        ; A93B: 8D 74 0C  lea si, [si + 0xc]
        LEA          si, [si + 12]
        ; A93E: 33 FF  xor di, di
        XOR          di, di
        ; A940: B9 04 00  mov cx, 4
        MOV          cx, 4
        ; A943: 33 DB  xor bx, bx
        XOR          bx, bx
        ; A945: C7 46 CE 00 00  mov word ptr [bp - 0x32], 0
        MOV          word ptr [bp - 50], 0
L_A94A LABEL NEAR
        ; A94A: 8A 1C  mov bl, byte ptr [si]
        MOV          bl, byte ptr [si]
        ; A94C: 83 E3 0F  and bx, 0xf
        AND          bx, 15
        ; A94F: 74 2D  je 0xa97e
        JE SHORT L_A97E
        ; A951: 8B 56 F4  mov dx, word ptr [bp - 0xc]
        MOV          dx, word ptr [bp - 12]
        ; A954: F7 DA  neg dx
        NEG          dx
L_A956 LABEL NEAR
        ; A956: 2E 8A A7 4A A6  mov ah, byte ptr cs:[bx - 0x59b6]
        MOV          ah, byte ptr cs:[bx - 22966]
        ; A95B: 2E 8A 87 5A A6  mov al, byte ptr cs:[bx - 0x59a6]
        MOV          al, byte ptr cs:[bx - 22950]
        ; A960: 89 43 DA  mov word ptr [bp + di - 0x26], ax
        MOV          word ptr [bp + di - 38], ax
        ; A963: 89 53 E2  mov word ptr [bp + di - 0x1e], dx
        MOV          word ptr [bp + di - 30], dx
        ; A966: 83 C7 02  add di, 2
        ADD          di, 2
        ; A969: F7 D0  not ax
        NOT          ax
        ; A96B: 23 D8  and bx, ax
        AND          bx, ax
        ; A96D: 75 E7  jne 0xa956
        JNE SHORT L_A956
        ; A96F: 8B 56 D0  mov dx, word ptr [bp - 0x30]
        MOV          dx, word ptr [bp - 48]
        ; A972: 89 53 E0  mov word ptr [bp + di - 0x20], dx
        MOV          word ptr [bp + di - 32], dx
        ; A975: 8B 56 C8  mov dx, word ptr [bp - 0x38]
        MOV          dx, word ptr [bp - 56]
        ; A978: 01 56 CE  add word ptr [bp - 0x32], dx
        ADD          word ptr [bp - 50], dx
        ; A97B: 46  inc si
        INC          si
        ; A97C: E2 CC  loop 0xa94a
        LOOP L_A94A
L_A97E LABEL NEAR
        ; A97E: 8D 43 DA  lea ax, [bp + di - 0x26]
        LEA          ax, [bp + di - 38]
        ; A981: 89 46 C4  mov word ptr [bp - 0x3c], ax
        MOV          word ptr [bp - 60], ax
        ; A984: 8B 56 D2  mov dx, word ptr [bp - 0x2e]
        MOV          dx, word ptr [bp - 46]
        ; A987: 29 56 CE  sub word ptr [bp - 0x32], dx
        SUB          word ptr [bp - 50], dx
        ; A98A: 8B 76 04  mov si, word ptr [bp + 4]
        MOV          si, word ptr [bp + 4]
        ; A98D: F6 44 0C F0  test byte ptr [si + 0xc], 0xf0
        TEST         byte ptr [si + 12], 240
        ; A991: 74 51  je 0xa9e4
        JE SHORT L_A9E4
        ; A993: F6 46 BF 01  test byte ptr [bp - 0x41], 1
        TEST         byte ptr [bp - 65], 1
        ; A997: 74 4B  je 0xa9e4
        JE SHORT L_A9E4
        ; A999: C6 46 BC 10  mov byte ptr [bp - 0x44], 0x10
        MOV          byte ptr [bp - 68], 16
        ; A99D: C7 46 BA 00 00  mov word ptr [bp - 0x46], 0
        MOV          word ptr [bp - 70], 0
L_A9A2 LABEL NEAR
        ; A9A2: 8A 46 BC  mov al, byte ptr [bp - 0x44]
        MOV          al, byte ptr [bp - 68]
        ; A9A5: 84 44 0C  test byte ptr [si + 0xc], al
        TEST         byte ptr [si + 12], al
        ; A9A8: 74 32  je 0xa9dc
        JE SHORT L_A9DC
        ; A9AA: 8B 5E BA  mov bx, word ptr [bp - 0x46]
        MOV          bx, word ptr [bp - 70]
        ; A9AD: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; A9B0: B0 04  mov al, 4
        MOV          al, 4
        ; A9B2: EE  out dx, al
        OUT          dx, al
        ; A9B3: 42  inc dx
        INC          dx
        ; A9B4: 8A C3  mov al, bl
        MOV          al, bl
        ; A9B6: EE  out dx, al
        OUT          dx, al
        ; A9B7: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; A9BA: B0 02  mov al, 2
        MOV          al, 2
        ; A9BC: EE  out dx, al
        OUT          dx, al
        ; A9BD: 42  inc dx
        INC          dx
        ; A9BE: 2E 8A 87 6E A6  mov al, byte ptr cs:[bx - 0x5992]
        MOV          al, byte ptr cs:[bx - 22930]
        ; A9C3: EE  out dx, al
        OUT          dx, al
        ; A9C4: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; A9C7: 8B 56 F4  mov dx, word ptr [bp - 0xc]
        MOV          dx, word ptr [bp - 12]
        ; A9CA: 8B 76 F2  mov si, word ptr [bp - 0xe]
        MOV          si, word ptr [bp - 14]
        ; A9CD: 8B 4E D4  mov cx, word ptr [bp - 0x2c]
        MOV          cx, word ptr [bp - 44]
        ; A9D0: 8B 5E CC  mov bx, word ptr [bp - 0x34]
        MOV          bx, word ptr [bp - 52]
        ; A9D3: 8A 46 C2  mov al, byte ptr [bp - 0x3e]
        MOV          al, byte ptr [bp - 62]
        ; A9D6: E8 A1 1C  call 0xc67a
        CALL _ext_C67A
        ; A9D9: 8B 76 04  mov si, word ptr [bp + 4]
        MOV          si, word ptr [bp + 4]
L_A9DC LABEL NEAR
        ; A9DC: FF 46 BA  inc word ptr [bp - 0x46]
        INC          word ptr [bp - 70]
        ; A9DF: D0 66 BC  shl byte ptr [bp - 0x44], 1
        SHL          byte ptr [bp - 68], 1
        ; A9E2: 73 BE  jae 0xa9a2
        JAE SHORT L_A9A2
L_A9E4 LABEL NEAR
        ; A9E4: F6 44 0D F0  test byte ptr [si + 0xd], 0xf0
        TEST         byte ptr [si + 13], 240
        ; A9E8: 74 61  je 0xaa4b
        JE SHORT L_AA4B
        ; A9EA: F6 46 BF 06  test byte ptr [bp - 0x41], 6
        TEST         byte ptr [bp - 65], 6
        ; A9EE: 74 5B  je 0xaa4b
        JE SHORT L_AA4B
        ; A9F0: B8 E3 C6  mov ax, 0xc6e3
        MOV          ax, 50915
        ; A9F3: F6 46 BF 04  test byte ptr [bp - 0x41], 4
        TEST         byte ptr [bp - 65], 4
        ; A9F7: 74 03  je 0xa9fc
        JE SHORT L_A9FC
        ; A9F9: B8 4C C7  mov ax, 0xc74c
        MOV          ax, 51020
L_A9FC LABEL NEAR
        ; A9FC: 89 46 B8  mov word ptr [bp - 0x48], ax
        MOV          word ptr [bp - 72], ax
        ; A9FF: C6 46 BC 10  mov byte ptr [bp - 0x44], 0x10
        MOV          byte ptr [bp - 68], 16
        ; AA03: C7 46 BA 00 00  mov word ptr [bp - 0x46], 0
        MOV          word ptr [bp - 70], 0
L_AA08 LABEL NEAR
        ; AA08: 8A 46 BC  mov al, byte ptr [bp - 0x44]
        MOV          al, byte ptr [bp - 68]
        ; AA0B: 84 44 0D  test byte ptr [si + 0xd], al
        TEST         byte ptr [si + 13], al
        ; AA0E: 74 32  je 0xaa42
        JE SHORT L_AA42
        ; AA10: 8B 5E BA  mov bx, word ptr [bp - 0x46]
        MOV          bx, word ptr [bp - 70]
        ; AA13: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; AA16: B0 04  mov al, 4
        MOV          al, 4
        ; AA18: EE  out dx, al
        OUT          dx, al
        ; AA19: 42  inc dx
        INC          dx
        ; AA1A: 8A C3  mov al, bl
        MOV          al, bl
        ; AA1C: EE  out dx, al
        OUT          dx, al
        ; AA1D: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; AA20: B0 02  mov al, 2
        MOV          al, 2
        ; AA22: EE  out dx, al
        OUT          dx, al
        ; AA23: 42  inc dx
        INC          dx
        ; AA24: 2E 8A 87 6E A6  mov al, byte ptr cs:[bx - 0x5992]
        MOV          al, byte ptr cs:[bx - 22930]
        ; AA29: EE  out dx, al
        OUT          dx, al
        ; AA2A: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; AA2D: 8B 56 F4  mov dx, word ptr [bp - 0xc]
        MOV          dx, word ptr [bp - 12]
        ; AA30: 8B 76 F2  mov si, word ptr [bp - 0xe]
        MOV          si, word ptr [bp - 14]
        ; AA33: 8B 4E D4  mov cx, word ptr [bp - 0x2c]
        MOV          cx, word ptr [bp - 44]
        ; AA36: 8B 5E CC  mov bx, word ptr [bp - 0x34]
        MOV          bx, word ptr [bp - 52]
        ; AA39: 8A 46 C2  mov al, byte ptr [bp - 0x3e]
        MOV          al, byte ptr [bp - 62]
        ; AA3C: FF 56 B8  call word ptr [bp - 0x48]
        CALL         word ptr [bp - 72]
        ; AA3F: 8B 76 04  mov si, word ptr [bp + 4]
        MOV          si, word ptr [bp + 4]
L_AA42 LABEL NEAR
        ; AA42: 83 46 BA 01  add word ptr [bp - 0x46], 1
        ADD          word ptr [bp - 70], 1
        ; AA46: D0 66 BC  shl byte ptr [bp - 0x44], 1
        SHL          byte ptr [bp - 68], 1
        ; AA49: 73 BD  jae 0xaa08
        JAE SHORT L_AA08
L_AA4B LABEL NEAR
        ; AA4B: 8D 46 DA  lea ax, [bp - 0x26]
        LEA          ax, [bp - 38]
        ; AA4E: 3B 46 C4  cmp ax, word ptr [bp - 0x3c]
        CMP          ax, word ptr [bp - 60]
        ; AA51: 74 5D  je 0xaab0
        JE SHORT L_AAB0
        ; AA53: 8B 5E CC  mov bx, word ptr [bp - 0x34]
        MOV          bx, word ptr [bp - 52]
        ; AA56: D1 E3  shl bx, 1
        SHL          bx, 1
        ; AA58: 8B 46 F4  mov ax, word ptr [bp - 0xc]
        MOV          ax, word ptr [bp - 12]
        ; AA5B: 03 C3  add ax, bx
        ADD          ax, bx
        ; AA5D: 74 06  je 0xaa65
        JE SHORT L_AA65
        ; AA5F: 03 5E B6  add bx, word ptr [bp - 0x4a]
        ADD          bx, word ptr [bp - 74]
        ; AA62: 2E FF 27  jmp word ptr cs:[bx]
        JMP          word ptr cs:[bx]
L_AA65 LABEL NEAR
        ; AA65: E9 0E 03  jmp 0xad76
        JMP NEAR PTR L_AD76
_raster_654_table_a LABEL WORD
        DW OFFSET L_AA88,OFFSET L_AAB8
        DW OFFSET L_AB0D,OFFSET L_AB67
        DW OFFSET L_ABC5,OFFSET L_AC27
        DW OFFSET L_AC87,OFFSET L_ACE3
_raster_654_table_b LABEL WORD
        DW OFFSET _rcega_case_ad3b,OFFSET L_ADBD
        DW OFFSET L_AE35,OFFSET L_AEB1
        DW OFFSET L_AF31,OFFSET L_AFB2
        DW OFFSET L_B031,OFFSET L_B0AC
L_AA88 LABEL NEAR
        ; AA88: 8B 56 D4  mov dx, word ptr [bp - 0x2c]
        MOV          dx, word ptr [bp - 44]
L_AA8B LABEL NEAR
        ; AA8B: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; AA8E: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; AA91: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; AA94: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; AA97: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_AA9A LABEL NEAR
        ; AA9A: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; AA9D: F3 A4  rep movsb byte ptr es:[di], byte ptr [si]
        REP MOVSB
        ; AA9F: 03 FA  add di, dx
        ADD          di, dx
        ; AAA1: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; AAA4: 4B  dec bx
        DEC          bx
        ; AAA5: 7F F3  jg 0xaa9a
        JG SHORT L_AA9A
        ; AAA7: 03 76 C8  add si, word ptr [bp - 0x38]
        ADD          si, word ptr [bp - 56]
        ; AAAA: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; AAAE: 7D DB  jge 0xaa8b
        JGE SHORT L_AA8B
L_AAB0 LABEL NEAR
        ; AAB0: 83 C4 44  add sp, 0x44
        ADD          sp, 68
        ; AAB3: 5F  pop di
        POP          di
        ; AAB4: 5E  pop si
        POP          si
        ; AAB5: 1F  pop ds
        POP          ds
        ; AAB6: 5D  pop bp
        POP          bp
        ; AAB7: C3  ret
        RET
L_AAB8 LABEL NEAR
        ; AAB8: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; AABB: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; AABE: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; AAC1: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; AAC4: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_AAC7 LABEL NEAR
        ; AAC7: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; AACA: 26 8A 35  mov dh, byte ptr es:[di]
        MOV          dh, byte ptr es:[di]
        ; AACD: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; AAD0: 75 0C  jne 0xaade
        JNE SHORT L_AADE
        ; AAD2: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; AAD5: D0 CE  ror dh, 1
        ROR          dh, 1
        ; AAD7: 80 E6 80  and dh, 0x80
        AND          dh, 128
        ; AADA: 0B C9  or cx, cx
        OR           cx, cx
        ; AADC: 74 14  je 0xaaf2
        JE SHORT L_AAF2
L_AADE LABEL NEAR
        ; AADE: 80 E6 80  and dh, 0x80
        AND          dh, 128
L_AAE1 LABEL NEAR
        ; AAE1: 32 E4  xor ah, ah
        XOR          ah, ah
        ; AAE3: AC  lodsb al, byte ptr [si]
        LODSB
        ; AAE4: D1 C8  ror ax, 1
        ROR          ax, 1
        ; AAE6: 0A C6  or al, dh
        OR           al, dh
        ; AAE8: 8A F4  mov dh, ah
        MOV          dh, ah
        ; AAEA: AA  stosb byte ptr es:[di], al
        STOSB
        ; AAEB: E2 F4  loop 0xaae1
        LOOP L_AAE1
        ; AAED: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; AAF0: 74 0A  je 0xaafc
        JE SHORT L_AAFC
L_AAF2 LABEL NEAR
        ; AAF2: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; AAF5: 24 7F  and al, 0x7f
        AND          al, 127
        ; AAF7: 0A C6  or al, dh
        OR           al, dh
        ; AAF9: 26 88 05  mov byte ptr es:[di], al
        MOV          byte ptr es:[di], al
L_AAFC LABEL NEAR
        ; AAFC: 03 7E D4  add di, word ptr [bp - 0x2c]
        ADD          di, word ptr [bp - 44]
        ; AAFF: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; AB02: 4B  dec bx
        DEC          bx
        ; AB03: 7F C2  jg 0xaac7
        JG SHORT L_AAC7
        ; AB05: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; AB09: 7D AD  jge 0xaab8
        JGE SHORT L_AAB8
        ; AB0B: EB A3  jmp 0xaab0
        JMP SHORT L_AAB0
L_AB0D LABEL NEAR
        ; AB0D: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; AB10: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; AB13: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; AB16: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; AB19: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_AB1C LABEL NEAR
        ; AB1C: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; AB1F: 26 8A 35  mov dh, byte ptr es:[di]
        MOV          dh, byte ptr es:[di]
        ; AB22: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; AB25: 75 0E  jne 0xab35
        JNE SHORT L_AB35
        ; AB27: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; AB2A: D0 CE  ror dh, 1
        ROR          dh, 1
        ; AB2C: D0 CE  ror dh, 1
        ROR          dh, 1
        ; AB2E: 80 E6 C0  and dh, 0xc0
        AND          dh, 192
        ; AB31: 0B C9  or cx, cx
        OR           cx, cx
        ; AB33: 74 16  je 0xab4b
        JE SHORT L_AB4B
L_AB35 LABEL NEAR
        ; AB35: 80 E6 C0  and dh, 0xc0
        AND          dh, 192
L_AB38 LABEL NEAR
        ; AB38: 32 E4  xor ah, ah
        XOR          ah, ah
        ; AB3A: AC  lodsb al, byte ptr [si]
        LODSB
        ; AB3B: D1 C8  ror ax, 1
        ROR          ax, 1
        ; AB3D: D1 C8  ror ax, 1
        ROR          ax, 1
        ; AB3F: 0A C6  or al, dh
        OR           al, dh
        ; AB41: 8A F4  mov dh, ah
        MOV          dh, ah
        ; AB43: AA  stosb byte ptr es:[di], al
        STOSB
        ; AB44: E2 F2  loop 0xab38
        LOOP L_AB38
        ; AB46: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; AB49: 74 0A  je 0xab55
        JE SHORT L_AB55
L_AB4B LABEL NEAR
        ; AB4B: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; AB4E: 24 3F  and al, 0x3f
        AND          al, 63
        ; AB50: 0A C6  or al, dh
        OR           al, dh
        ; AB52: 26 88 05  mov byte ptr es:[di], al
        MOV          byte ptr es:[di], al
L_AB55 LABEL NEAR
        ; AB55: 03 7E D4  add di, word ptr [bp - 0x2c]
        ADD          di, word ptr [bp - 44]
        ; AB58: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; AB5B: 4B  dec bx
        DEC          bx
        ; AB5C: 7F BE  jg 0xab1c
        JG SHORT L_AB1C
        ; AB5E: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; AB62: 7D A9  jge 0xab0d
        JGE SHORT L_AB0D
        ; AB64: E9 49 FF  jmp 0xaab0
        JMP NEAR PTR L_AAB0
L_AB67 LABEL NEAR
        ; AB67: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; AB6A: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; AB6D: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; AB70: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; AB73: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_AB76 LABEL NEAR
        ; AB76: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; AB79: 26 8A 35  mov dh, byte ptr es:[di]
        MOV          dh, byte ptr es:[di]
        ; AB7C: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; AB7F: 75 10  jne 0xab91
        JNE SHORT L_AB91
        ; AB81: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; AB84: D0 CE  ror dh, 1
        ROR          dh, 1
        ; AB86: D0 CE  ror dh, 1
        ROR          dh, 1
        ; AB88: D0 CE  ror dh, 1
        ROR          dh, 1
        ; AB8A: 80 E6 E0  and dh, 0xe0
        AND          dh, 224
        ; AB8D: 0B C9  or cx, cx
        OR           cx, cx
        ; AB8F: 74 18  je 0xaba9
        JE SHORT L_ABA9
L_AB91 LABEL NEAR
        ; AB91: 80 E6 E0  and dh, 0xe0
        AND          dh, 224
L_AB94 LABEL NEAR
        ; AB94: 32 E4  xor ah, ah
        XOR          ah, ah
        ; AB96: AC  lodsb al, byte ptr [si]
        LODSB
        ; AB97: D1 C8  ror ax, 1
        ROR          ax, 1
        ; AB99: D1 C8  ror ax, 1
        ROR          ax, 1
        ; AB9B: D1 C8  ror ax, 1
        ROR          ax, 1
        ; AB9D: 0A C6  or al, dh
        OR           al, dh
        ; AB9F: 8A F4  mov dh, ah
        MOV          dh, ah
        ; ABA1: AA  stosb byte ptr es:[di], al
        STOSB
        ; ABA2: E2 F0  loop 0xab94
        LOOP L_AB94
        ; ABA4: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; ABA7: 74 0A  je 0xabb3
        JE SHORT L_ABB3
L_ABA9 LABEL NEAR
        ; ABA9: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; ABAC: 24 1F  and al, 0x1f
        AND          al, 31
        ; ABAE: 0A C6  or al, dh
        OR           al, dh
        ; ABB0: 26 88 05  mov byte ptr es:[di], al
        MOV          byte ptr es:[di], al
L_ABB3 LABEL NEAR
        ; ABB3: 03 7E D4  add di, word ptr [bp - 0x2c]
        ADD          di, word ptr [bp - 44]
        ; ABB6: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; ABB9: 4B  dec bx
        DEC          bx
        ; ABBA: 7F BA  jg 0xab76
        JG SHORT L_AB76
        ; ABBC: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; ABC0: 7D A5  jge 0xab67
        JGE SHORT L_AB67
        ; ABC2: E9 EB FE  jmp 0xaab0
        JMP NEAR PTR L_AAB0
L_ABC5 LABEL NEAR
        ; ABC5: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; ABC8: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; ABCB: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; ABCE: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; ABD1: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_ABD4 LABEL NEAR
        ; ABD4: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; ABD7: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; ABDA: 75 12  jne 0xabee
        JNE SHORT L_ABEE
        ; ABDC: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; ABDF: D0 E6  shl dh, 1
        SHL          dh, 1
        ; ABE1: D0 E6  shl dh, 1
        SHL          dh, 1
        ; ABE3: D0 E6  shl dh, 1
        SHL          dh, 1
        ; ABE5: D0 E6  shl dh, 1
        SHL          dh, 1
        ; ABE7: 0B C9  or cx, cx
        OR           cx, cx
        ; ABE9: 74 20  je 0xac0b
        JE SHORT L_AC0B
        ; ABEB: EB 07  jmp 0xabf4
        JMP SHORT L_ABF4
        ; ABED: 90  nop
        NOP
L_ABEE LABEL NEAR
        ; ABEE: 26 8A 35  mov dh, byte ptr es:[di]
        MOV          dh, byte ptr es:[di]
        ; ABF1: 80 E6 F0  and dh, 0xf0
        AND          dh, 240
L_ABF4 LABEL NEAR
        ; ABF4: 32 E4  xor ah, ah
        XOR          ah, ah
        ; ABF6: AC  lodsb al, byte ptr [si]
        LODSB
        ; ABF7: D1 C8  ror ax, 1
        ROR          ax, 1
        ; ABF9: D1 C8  ror ax, 1
        ROR          ax, 1
        ; ABFB: D1 C8  ror ax, 1
        ROR          ax, 1
        ; ABFD: D1 C8  ror ax, 1
        ROR          ax, 1
        ; ABFF: 0A C6  or al, dh
        OR           al, dh
        ; AC01: 8A F4  mov dh, ah
        MOV          dh, ah
        ; AC03: AA  stosb byte ptr es:[di], al
        STOSB
        ; AC04: E2 EE  loop 0xabf4
        LOOP L_ABF4
        ; AC06: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; AC09: 74 0A  je 0xac15
        JE SHORT L_AC15
L_AC0B LABEL NEAR
        ; AC0B: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; AC0E: 24 0F  and al, 0xf
        AND          al, 15
        ; AC10: 0A C6  or al, dh
        OR           al, dh
        ; AC12: 26 88 05  mov byte ptr es:[di], al
        MOV          byte ptr es:[di], al
L_AC15 LABEL NEAR
        ; AC15: 03 7E D4  add di, word ptr [bp - 0x2c]
        ADD          di, word ptr [bp - 44]
        ; AC18: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; AC1B: 4B  dec bx
        DEC          bx
        ; AC1C: 7F B6  jg 0xabd4
        JG SHORT L_ABD4
        ; AC1E: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; AC22: 7D A1  jge 0xabc5
        JGE SHORT L_ABC5
        ; AC24: E9 89 FE  jmp 0xaab0
        JMP NEAR PTR L_AAB0
L_AC27 LABEL NEAR
        ; AC27: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; AC2A: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; AC2D: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; AC30: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; AC33: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_AC36 LABEL NEAR
        ; AC36: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; AC39: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; AC3C: 75 10  jne 0xac4e
        JNE SHORT L_AC4E
        ; AC3E: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; AC41: D0 E6  shl dh, 1
        SHL          dh, 1
        ; AC43: D0 E6  shl dh, 1
        SHL          dh, 1
        ; AC45: D0 E6  shl dh, 1
        SHL          dh, 1
        ; AC47: 0B C9  or cx, cx
        OR           cx, cx
        ; AC49: 74 20  je 0xac6b
        JE SHORT L_AC6B
        ; AC4B: EB 07  jmp 0xac54
        JMP SHORT L_AC54
        ; AC4D: 90  nop
        NOP
L_AC4E LABEL NEAR
        ; AC4E: 26 8A 35  mov dh, byte ptr es:[di]
        MOV          dh, byte ptr es:[di]
        ; AC51: 80 E6 F8  and dh, 0xf8
        AND          dh, 248
L_AC54 LABEL NEAR
        ; AC54: 32 E4  xor ah, ah
        XOR          ah, ah
        ; AC56: AC  lodsb al, byte ptr [si]
        LODSB
        ; AC57: D1 C0  rol ax, 1
        ROL          ax, 1
        ; AC59: D1 C0  rol ax, 1
        ROL          ax, 1
        ; AC5B: D1 C0  rol ax, 1
        ROL          ax, 1
        ; AC5D: 86 C4  xchg ah, al
        XCHG         al, ah
        ; AC5F: 0A C6  or al, dh
        OR           al, dh
        ; AC61: 8A F4  mov dh, ah
        MOV          dh, ah
        ; AC63: AA  stosb byte ptr es:[di], al
        STOSB
        ; AC64: E2 EE  loop 0xac54
        LOOP L_AC54
        ; AC66: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; AC69: 74 0A  je 0xac75
        JE SHORT L_AC75
L_AC6B LABEL NEAR
        ; AC6B: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; AC6E: 24 07  and al, 7
        AND          al, 7
        ; AC70: 0A C6  or al, dh
        OR           al, dh
        ; AC72: 26 88 05  mov byte ptr es:[di], al
        MOV          byte ptr es:[di], al
L_AC75 LABEL NEAR
        ; AC75: 03 7E D4  add di, word ptr [bp - 0x2c]
        ADD          di, word ptr [bp - 44]
        ; AC78: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; AC7B: 4B  dec bx
        DEC          bx
        ; AC7C: 7F B8  jg 0xac36
        JG SHORT L_AC36
        ; AC7E: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; AC82: 7D A3  jge 0xac27
        JGE SHORT L_AC27
        ; AC84: E9 29 FE  jmp 0xaab0
        JMP NEAR PTR L_AAB0
L_AC87 LABEL NEAR
        ; AC87: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; AC8A: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; AC8D: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; AC90: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; AC93: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_AC96 LABEL NEAR
        ; AC96: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; AC99: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; AC9C: 75 0E  jne 0xacac
        JNE SHORT L_ACAC
        ; AC9E: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; ACA1: D0 E6  shl dh, 1
        SHL          dh, 1
        ; ACA3: D0 E6  shl dh, 1
        SHL          dh, 1
        ; ACA5: 0B C9  or cx, cx
        OR           cx, cx
        ; ACA7: 74 1E  je 0xacc7
        JE SHORT L_ACC7
        ; ACA9: EB 07  jmp 0xacb2
        JMP SHORT L_ACB2
        ; ACAB: 90  nop
        NOP
L_ACAC LABEL NEAR
        ; ACAC: 26 8A 35  mov dh, byte ptr es:[di]
        MOV          dh, byte ptr es:[di]
        ; ACAF: 80 E6 FC  and dh, 0xfc
        AND          dh, 252
L_ACB2 LABEL NEAR
        ; ACB2: 32 E4  xor ah, ah
        XOR          ah, ah
        ; ACB4: AC  lodsb al, byte ptr [si]
        LODSB
        ; ACB5: D1 C0  rol ax, 1
        ROL          ax, 1
        ; ACB7: D1 C0  rol ax, 1
        ROL          ax, 1
        ; ACB9: 86 C4  xchg ah, al
        XCHG         al, ah
        ; ACBB: 0A C6  or al, dh
        OR           al, dh
        ; ACBD: 8A F4  mov dh, ah
        MOV          dh, ah
        ; ACBF: AA  stosb byte ptr es:[di], al
        STOSB
        ; ACC0: E2 F0  loop 0xacb2
        LOOP L_ACB2
        ; ACC2: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; ACC5: 74 0A  je 0xacd1
        JE SHORT L_ACD1
L_ACC7 LABEL NEAR
        ; ACC7: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; ACCA: 24 03  and al, 3
        AND          al, 3
        ; ACCC: 0A C6  or al, dh
        OR           al, dh
        ; ACCE: 26 88 05  mov byte ptr es:[di], al
        MOV          byte ptr es:[di], al
L_ACD1 LABEL NEAR
        ; ACD1: 03 7E D4  add di, word ptr [bp - 0x2c]
        ADD          di, word ptr [bp - 44]
        ; ACD4: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; ACD7: 4B  dec bx
        DEC          bx
        ; ACD8: 7F BC  jg 0xac96
        JG SHORT L_AC96
        ; ACDA: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; ACDE: 7D A7  jge 0xac87
        JGE SHORT L_AC87
        ; ACE0: E9 CD FD  jmp 0xaab0
        JMP NEAR PTR L_AAB0
L_ACE3 LABEL NEAR
        ; ACE3: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; ACE6: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; ACE9: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; ACEC: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; ACEF: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_ACF2 LABEL NEAR
        ; ACF2: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; ACF5: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; ACF8: 75 0C  jne 0xad06
        JNE SHORT L_AD06
        ; ACFA: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; ACFD: D0 E6  shl dh, 1
        SHL          dh, 1
        ; ACFF: 0B C9  or cx, cx
        OR           cx, cx
        ; AD01: 74 1C  je 0xad1f
        JE SHORT L_AD1F
        ; AD03: EB 07  jmp 0xad0c
        JMP SHORT L_AD0C
        ; AD05: 90  nop
        NOP
L_AD06 LABEL NEAR
        ; AD06: 26 8A 35  mov dh, byte ptr es:[di]
        MOV          dh, byte ptr es:[di]
        ; AD09: 80 E6 FE  and dh, 0xfe
        AND          dh, 254
L_AD0C LABEL NEAR
        ; AD0C: 32 E4  xor ah, ah
        XOR          ah, ah
        ; AD0E: AC  lodsb al, byte ptr [si]
        LODSB
        ; AD0F: D1 C0  rol ax, 1
        ROL          ax, 1
        ; AD11: 86 C4  xchg ah, al
        XCHG         al, ah
        ; AD13: 0A C6  or al, dh
        OR           al, dh
        ; AD15: 8A F4  mov dh, ah
        MOV          dh, ah
        ; AD17: AA  stosb byte ptr es:[di], al
        STOSB
        ; AD18: E2 F2  loop 0xad0c
        LOOP L_AD0C
        ; AD1A: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; AD1D: 74 0A  je 0xad29
        JE SHORT L_AD29
L_AD1F LABEL NEAR
        ; AD1F: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; AD22: 24 01  and al, 1
        AND          al, 1
        ; AD24: 0A C6  or al, dh
        OR           al, dh
        ; AD26: 26 88 05  mov byte ptr es:[di], al
        MOV          byte ptr es:[di], al
L_AD29 LABEL NEAR
        ; AD29: 03 7E D4  add di, word ptr [bp - 0x2c]
        ADD          di, word ptr [bp - 44]
        ; AD2C: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; AD2F: 4B  dec bx
        DEC          bx
        ; AD30: 7F C0  jg 0xacf2
        JG SHORT L_ACF2
        ; AD32: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; AD36: 7D AB  jge 0xace3
        JGE SHORT L_ACE3
        ; AD38: E9 75 FD  jmp 0xaab0
        JMP NEAR PTR L_AAB0
        PUBLIC _rcega_case_ad3b
_rcega_case_ad3b LABEL NEAR
        ; AD3B: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; AD3E: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; AD41: 80 7E BE 00  cmp byte ptr [bp - 0x42], 0
        CMP          byte ptr [bp - 66], 0
        ; AD45: 75 41  jne 0xad88
        JNE SHORT L_AD88
L_AD47 LABEL NEAR
        ; AD47: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_AD4A LABEL NEAR
        ; AD4A: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; AD4D: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; AD50: B0 02  mov al, 2
        MOV          al, 2
        ; AD52: EE  out dx, al
        OUT          dx, al
        ; AD53: 42  inc dx
        INC          dx
        ; AD54: 8A C1  mov al, cl
        MOV          al, cl
        ; AD56: EE  out dx, al
        OUT          dx, al
        ; AD57: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; AD5A: F3 A4  rep movsb byte ptr es:[di], byte ptr [si]
        REP MOVSB
        ; AD5C: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; AD5F: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; AD63: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; AD66: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; AD69: 72 DF  jb 0xad4a
        JB SHORT L_AD4A
        ; AD6B: 83 C7 28  add di, 0x28
        ADD          di, 40
        ; AD6E: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; AD71: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; AD74: 7F D1  jg 0xad47
        JG SHORT L_AD47
L_AD76 LABEL NEAR
        ; AD76: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; AD79: B0 03  mov al, 3
        MOV          al, 3
        ; AD7B: EE  out dx, al
        OUT          dx, al
        ; AD7C: 42  inc dx
        INC          dx
        ; AD7D: B0 00  mov al, 0
        MOV          al, 0
        ; AD7F: EE  out dx, al
        OUT          dx, al
        ; AD80: 83 C4 44  add sp, 0x44
        ADD          sp, 68
        ; AD83: 5F  pop di
        POP          di
        ; AD84: 5E  pop si
        POP          si
        ; AD85: 1F  pop ds
        POP          ds
        ; AD86: 5D  pop bp
        POP          bp
        ; AD87: C3  ret
        RET
L_AD88 LABEL NEAR
        ; AD88: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_AD8B LABEL NEAR
        ; AD8B: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; AD8E: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; AD91: B0 02  mov al, 2
        MOV          al, 2
        ; AD93: EE  out dx, al
        OUT          dx, al
        ; AD94: 42  inc dx
        INC          dx
        ; AD95: 8A C1  mov al, cl
        MOV          al, cl
        ; AD97: EE  out dx, al
        OUT          dx, al
        ; AD98: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
L_AD9B LABEL NEAR
        ; AD9B: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; AD9E: A4  movsb byte ptr es:[di], byte ptr [si]
        MOVSB
        ; AD9F: E2 FA  loop 0xad9b
        LOOP L_AD9B
        ; ADA1: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; ADA4: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; ADA8: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; ADAB: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; ADAE: 72 DB  jb 0xad8b
        JB SHORT L_AD8B
        ; ADB0: 83 C7 28  add di, 0x28
        ADD          di, 40
        ; ADB3: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; ADB6: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; ADB9: 7F CD  jg 0xad88
        JG SHORT L_AD88
        ; ADBB: EB B9  jmp 0xad76
        JMP SHORT L_AD76
L_ADBD LABEL NEAR
        ; ADBD: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; ADC0: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
L_ADC3 LABEL NEAR
        ; ADC3: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_ADC6 LABEL NEAR
        ; ADC6: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; ADC9: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; ADCC: B0 02  mov al, 2
        MOV          al, 2
        ; ADCE: EE  out dx, al
        OUT          dx, al
        ; ADCF: 42  inc dx
        INC          dx
        ; ADD0: 8A C1  mov al, cl
        MOV          al, cl
        ; ADD2: EE  out dx, al
        OUT          dx, al
        ; ADD3: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; ADD6: B0 04  mov al, 4
        MOV          al, 4
        ; ADD8: EE  out dx, al
        OUT          dx, al
        ; ADD9: 42  inc dx
        INC          dx
        ; ADDA: 8A C5  mov al, ch
        MOV          al, ch
        ; ADDC: EE  out dx, al
        OUT          dx, al
        ; ADDD: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; ADE0: 26 8A 35  mov dh, byte ptr es:[di]
        MOV          dh, byte ptr es:[di]
        ; ADE3: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; ADE6: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; ADE9: 75 0C  jne 0xadf7
        JNE SHORT L_ADF7
        ; ADEB: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; ADEE: D0 CE  ror dh, 1
        ROR          dh, 1
        ; ADF0: 80 E6 80  and dh, 0x80
        AND          dh, 128
        ; ADF3: 0B C9  or cx, cx
        OR           cx, cx
        ; ADF5: 74 17  je 0xae0e
        JE SHORT L_AE0E
L_ADF7 LABEL NEAR
        ; ADF7: 80 E6 80  and dh, 0x80
        AND          dh, 128
L_ADFA LABEL NEAR
        ; ADFA: 32 E4  xor ah, ah
        XOR          ah, ah
        ; ADFC: AC  lodsb al, byte ptr [si]
        LODSB
        ; ADFD: D1 C8  ror ax, 1
        ROR          ax, 1
        ; ADFF: 0A C6  or al, dh
        OR           al, dh
        ; AE01: 8A F4  mov dh, ah
        MOV          dh, ah
        ; AE03: AA  stosb byte ptr es:[di], al
        STOSB
        ; AE04: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; AE07: E2 F1  loop 0xadfa
        LOOP L_ADFA
        ; AE09: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; AE0C: 74 0A  je 0xae18
        JE SHORT L_AE18
L_AE0E LABEL NEAR
        ; AE0E: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; AE11: 24 7F  and al, 0x7f
        AND          al, 127
        ; AE13: 0A C6  or al, dh
        OR           al, dh
        ; AE15: 26 88 05  mov byte ptr es:[di], al
        MOV          byte ptr es:[di], al
L_AE18 LABEL NEAR
        ; AE18: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; AE1B: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; AE1F: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; AE22: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; AE25: 72 9F  jb 0xadc6
        JB SHORT L_ADC6
        ; AE27: 83 C7 28  add di, 0x28
        ADD          di, 40
        ; AE2A: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; AE2D: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; AE30: 7F 91  jg 0xadc3
        JG SHORT L_ADC3
        ; AE32: E9 41 FF  jmp 0xad76
        JMP NEAR PTR L_AD76
L_AE35 LABEL NEAR
        ; AE35: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; AE38: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
L_AE3B LABEL NEAR
        ; AE3B: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_AE3E LABEL NEAR
        ; AE3E: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; AE41: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; AE44: B0 02  mov al, 2
        MOV          al, 2
        ; AE46: EE  out dx, al
        OUT          dx, al
        ; AE47: 42  inc dx
        INC          dx
        ; AE48: 8A C1  mov al, cl
        MOV          al, cl
        ; AE4A: EE  out dx, al
        OUT          dx, al
        ; AE4B: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; AE4E: B0 04  mov al, 4
        MOV          al, 4
        ; AE50: EE  out dx, al
        OUT          dx, al
        ; AE51: 42  inc dx
        INC          dx
        ; AE52: 8A C5  mov al, ch
        MOV          al, ch
        ; AE54: EE  out dx, al
        OUT          dx, al
        ; AE55: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; AE58: 26 8A 35  mov dh, byte ptr es:[di]
        MOV          dh, byte ptr es:[di]
        ; AE5B: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; AE5E: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; AE61: 75 0E  jne 0xae71
        JNE SHORT L_AE71
        ; AE63: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; AE66: D0 CE  ror dh, 1
        ROR          dh, 1
        ; AE68: D0 CE  ror dh, 1
        ROR          dh, 1
        ; AE6A: 80 E6 C0  and dh, 0xc0
        AND          dh, 192
        ; AE6D: 0B C9  or cx, cx
        OR           cx, cx
        ; AE6F: 74 19  je 0xae8a
        JE SHORT L_AE8A
L_AE71 LABEL NEAR
        ; AE71: 80 E6 C0  and dh, 0xc0
        AND          dh, 192
L_AE74 LABEL NEAR
        ; AE74: 32 E4  xor ah, ah
        XOR          ah, ah
        ; AE76: AC  lodsb al, byte ptr [si]
        LODSB
        ; AE77: D1 C8  ror ax, 1
        ROR          ax, 1
        ; AE79: D1 C8  ror ax, 1
        ROR          ax, 1
        ; AE7B: 0A C6  or al, dh
        OR           al, dh
        ; AE7D: 8A F4  mov dh, ah
        MOV          dh, ah
        ; AE7F: AA  stosb byte ptr es:[di], al
        STOSB
        ; AE80: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; AE83: E2 EF  loop 0xae74
        LOOP L_AE74
        ; AE85: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; AE88: 74 0A  je 0xae94
        JE SHORT L_AE94
L_AE8A LABEL NEAR
        ; AE8A: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; AE8D: 24 3F  and al, 0x3f
        AND          al, 63
        ; AE8F: 0A C6  or al, dh
        OR           al, dh
        ; AE91: 26 88 05  mov byte ptr es:[di], al
        MOV          byte ptr es:[di], al
L_AE94 LABEL NEAR
        ; AE94: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; AE97: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; AE9B: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; AE9E: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; AEA1: 72 9B  jb 0xae3e
        JB SHORT L_AE3E
        ; AEA3: 83 C7 28  add di, 0x28
        ADD          di, 40
        ; AEA6: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; AEA9: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; AEAC: 7F 8D  jg 0xae3b
        JG SHORT L_AE3B
        ; AEAE: E9 C5 FE  jmp 0xad76
        JMP NEAR PTR L_AD76
L_AEB1 LABEL NEAR
        ; AEB1: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; AEB4: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
L_AEB7 LABEL NEAR
        ; AEB7: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_AEBA LABEL NEAR
        ; AEBA: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; AEBD: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; AEC0: B0 02  mov al, 2
        MOV          al, 2
        ; AEC2: EE  out dx, al
        OUT          dx, al
        ; AEC3: 42  inc dx
        INC          dx
        ; AEC4: 8A C1  mov al, cl
        MOV          al, cl
        ; AEC6: EE  out dx, al
        OUT          dx, al
        ; AEC7: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; AECA: B0 04  mov al, 4
        MOV          al, 4
        ; AECC: EE  out dx, al
        OUT          dx, al
        ; AECD: 42  inc dx
        INC          dx
        ; AECE: 8A C5  mov al, ch
        MOV          al, ch
        ; AED0: EE  out dx, al
        OUT          dx, al
        ; AED1: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; AED4: 26 8A 35  mov dh, byte ptr es:[di]
        MOV          dh, byte ptr es:[di]
        ; AED7: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; AEDA: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; AEDD: 75 10  jne 0xaeef
        JNE SHORT L_AEEF
        ; AEDF: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; AEE2: D0 CE  ror dh, 1
        ROR          dh, 1
        ; AEE4: D0 CE  ror dh, 1
        ROR          dh, 1
        ; AEE6: D0 CE  ror dh, 1
        ROR          dh, 1
        ; AEE8: 80 E6 E0  and dh, 0xe0
        AND          dh, 224
        ; AEEB: 0B C9  or cx, cx
        OR           cx, cx
        ; AEED: 74 1B  je 0xaf0a
        JE SHORT L_AF0A
L_AEEF LABEL NEAR
        ; AEEF: 80 E6 E0  and dh, 0xe0
        AND          dh, 224
L_AEF2 LABEL NEAR
        ; AEF2: 32 E4  xor ah, ah
        XOR          ah, ah
        ; AEF4: AC  lodsb al, byte ptr [si]
        LODSB
        ; AEF5: D1 C8  ror ax, 1
        ROR          ax, 1
        ; AEF7: D1 C8  ror ax, 1
        ROR          ax, 1
        ; AEF9: D1 C8  ror ax, 1
        ROR          ax, 1
        ; AEFB: 0A C6  or al, dh
        OR           al, dh
        ; AEFD: 8A F4  mov dh, ah
        MOV          dh, ah
        ; AEFF: AA  stosb byte ptr es:[di], al
        STOSB
        ; AF00: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; AF03: E2 ED  loop 0xaef2
        LOOP L_AEF2
        ; AF05: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; AF08: 74 0A  je 0xaf14
        JE SHORT L_AF14
L_AF0A LABEL NEAR
        ; AF0A: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; AF0D: 24 1F  and al, 0x1f
        AND          al, 31
        ; AF0F: 0A C6  or al, dh
        OR           al, dh
        ; AF11: 26 88 05  mov byte ptr es:[di], al
        MOV          byte ptr es:[di], al
L_AF14 LABEL NEAR
        ; AF14: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; AF17: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; AF1B: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; AF1E: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; AF21: 72 97  jb 0xaeba
        JB SHORT L_AEBA
        ; AF23: 83 C7 28  add di, 0x28
        ADD          di, 40
        ; AF26: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; AF29: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; AF2C: 7F 89  jg 0xaeb7
        JG SHORT L_AEB7
        ; AF2E: E9 45 FE  jmp 0xad76
        JMP NEAR PTR L_AD76
L_AF31 LABEL NEAR
        ; AF31: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; AF34: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
L_AF37 LABEL NEAR
        ; AF37: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_AF3A LABEL NEAR
        ; AF3A: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; AF3D: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; AF40: B0 02  mov al, 2
        MOV          al, 2
        ; AF42: EE  out dx, al
        OUT          dx, al
        ; AF43: 42  inc dx
        INC          dx
        ; AF44: 8A C1  mov al, cl
        MOV          al, cl
        ; AF46: EE  out dx, al
        OUT          dx, al
        ; AF47: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; AF4A: B0 04  mov al, 4
        MOV          al, 4
        ; AF4C: EE  out dx, al
        OUT          dx, al
        ; AF4D: 42  inc dx
        INC          dx
        ; AF4E: 8A C5  mov al, ch
        MOV          al, ch
        ; AF50: EE  out dx, al
        OUT          dx, al
        ; AF51: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; AF54: 26 8A 35  mov dh, byte ptr es:[di]
        MOV          dh, byte ptr es:[di]
        ; AF57: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; AF5A: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; AF5D: 75 0F  jne 0xaf6e
        JNE SHORT L_AF6E
        ; AF5F: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; AF62: D0 E6  shl dh, 1
        SHL          dh, 1
        ; AF64: D0 E6  shl dh, 1
        SHL          dh, 1
        ; AF66: D0 E6  shl dh, 1
        SHL          dh, 1
        ; AF68: D0 E6  shl dh, 1
        SHL          dh, 1
        ; AF6A: 0B C9  or cx, cx
        OR           cx, cx
        ; AF6C: 74 1D  je 0xaf8b
        JE SHORT L_AF8B
L_AF6E LABEL NEAR
        ; AF6E: 80 E6 F0  and dh, 0xf0
        AND          dh, 240
L_AF71 LABEL NEAR
        ; AF71: 32 E4  xor ah, ah
        XOR          ah, ah
        ; AF73: AC  lodsb al, byte ptr [si]
        LODSB
        ; AF74: D1 C8  ror ax, 1
        ROR          ax, 1
        ; AF76: D1 C8  ror ax, 1
        ROR          ax, 1
        ; AF78: D1 C8  ror ax, 1
        ROR          ax, 1
        ; AF7A: D1 C8  ror ax, 1
        ROR          ax, 1
        ; AF7C: 0A C6  or al, dh
        OR           al, dh
        ; AF7E: 8A F4  mov dh, ah
        MOV          dh, ah
        ; AF80: AA  stosb byte ptr es:[di], al
        STOSB
        ; AF81: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; AF84: E2 EB  loop 0xaf71
        LOOP L_AF71
        ; AF86: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; AF89: 74 0A  je 0xaf95
        JE SHORT L_AF95
L_AF8B LABEL NEAR
        ; AF8B: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; AF8E: 24 0F  and al, 0xf
        AND          al, 15
        ; AF90: 0A C6  or al, dh
        OR           al, dh
        ; AF92: 26 88 05  mov byte ptr es:[di], al
        MOV          byte ptr es:[di], al
L_AF95 LABEL NEAR
        ; AF95: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; AF98: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; AF9C: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; AF9F: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; AFA2: 72 96  jb 0xaf3a
        JB SHORT L_AF3A
        ; AFA4: 83 C7 28  add di, 0x28
        ADD          di, 40
        ; AFA7: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; AFAA: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; AFAD: 7F 88  jg 0xaf37
        JG SHORT L_AF37
        ; AFAF: E9 C4 FD  jmp 0xad76
        JMP NEAR PTR L_AD76
L_AFB2 LABEL NEAR
        ; AFB2: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; AFB5: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
L_AFB8 LABEL NEAR
        ; AFB8: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_AFBB LABEL NEAR
        ; AFBB: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; AFBE: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; AFC1: B0 02  mov al, 2
        MOV          al, 2
        ; AFC3: EE  out dx, al
        OUT          dx, al
        ; AFC4: 42  inc dx
        INC          dx
        ; AFC5: 8A C1  mov al, cl
        MOV          al, cl
        ; AFC7: EE  out dx, al
        OUT          dx, al
        ; AFC8: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; AFCB: B0 04  mov al, 4
        MOV          al, 4
        ; AFCD: EE  out dx, al
        OUT          dx, al
        ; AFCE: 42  inc dx
        INC          dx
        ; AFCF: 8A C5  mov al, ch
        MOV          al, ch
        ; AFD1: EE  out dx, al
        OUT          dx, al
        ; AFD2: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; AFD5: 26 8A 35  mov dh, byte ptr es:[di]
        MOV          dh, byte ptr es:[di]
        ; AFD8: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; AFDB: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; AFDE: 75 0D  jne 0xafed
        JNE SHORT L_AFED
        ; AFE0: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; AFE3: D0 E6  shl dh, 1
        SHL          dh, 1
        ; AFE5: D0 E6  shl dh, 1
        SHL          dh, 1
        ; AFE7: D0 E6  shl dh, 1
        SHL          dh, 1
        ; AFE9: 0B C9  or cx, cx
        OR           cx, cx
        ; AFEB: 74 1D  je 0xb00a
        JE SHORT L_B00A
L_AFED LABEL NEAR
        ; AFED: 80 E6 F8  and dh, 0xf8
        AND          dh, 248
L_AFF0 LABEL NEAR
        ; AFF0: 32 E4  xor ah, ah
        XOR          ah, ah
        ; AFF2: AC  lodsb al, byte ptr [si]
        LODSB
        ; AFF3: D1 C0  rol ax, 1
        ROL          ax, 1
        ; AFF5: D1 C0  rol ax, 1
        ROL          ax, 1
        ; AFF7: D1 C0  rol ax, 1
        ROL          ax, 1
        ; AFF9: 86 C4  xchg ah, al
        XCHG         al, ah
        ; AFFB: 0A C6  or al, dh
        OR           al, dh
        ; AFFD: 8A F4  mov dh, ah
        MOV          dh, ah
        ; AFFF: AA  stosb byte ptr es:[di], al
        STOSB
        ; B000: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; B003: E2 EB  loop 0xaff0
        LOOP L_AFF0
        ; B005: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; B008: 74 0A  je 0xb014
        JE SHORT L_B014
L_B00A LABEL NEAR
        ; B00A: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; B00D: 24 07  and al, 7
        AND          al, 7
        ; B00F: 0A C6  or al, dh
        OR           al, dh
        ; B011: 26 88 05  mov byte ptr es:[di], al
        MOV          byte ptr es:[di], al
L_B014 LABEL NEAR
        ; B014: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; B017: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; B01B: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; B01E: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; B021: 72 98  jb 0xafbb
        JB SHORT L_AFBB
        ; B023: 83 C7 28  add di, 0x28
        ADD          di, 40
        ; B026: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; B029: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; B02C: 7F 8A  jg 0xafb8
        JG SHORT L_AFB8
        ; B02E: E9 45 FD  jmp 0xad76
        JMP NEAR PTR L_AD76
L_B031 LABEL NEAR
        ; B031: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; B034: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
L_B037 LABEL NEAR
        ; B037: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_B03A LABEL NEAR
        ; B03A: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; B03D: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; B040: B0 02  mov al, 2
        MOV          al, 2
        ; B042: EE  out dx, al
        OUT          dx, al
        ; B043: 42  inc dx
        INC          dx
        ; B044: 8A C1  mov al, cl
        MOV          al, cl
        ; B046: EE  out dx, al
        OUT          dx, al
        ; B047: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; B04A: B0 04  mov al, 4
        MOV          al, 4
        ; B04C: EE  out dx, al
        OUT          dx, al
        ; B04D: 42  inc dx
        INC          dx
        ; B04E: 8A C5  mov al, ch
        MOV          al, ch
        ; B050: EE  out dx, al
        OUT          dx, al
        ; B051: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; B054: 26 8A 35  mov dh, byte ptr es:[di]
        MOV          dh, byte ptr es:[di]
        ; B057: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; B05A: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; B05D: 75 0B  jne 0xb06a
        JNE SHORT L_B06A
        ; B05F: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; B062: D0 E6  shl dh, 1
        SHL          dh, 1
        ; B064: D0 E6  shl dh, 1
        SHL          dh, 1
        ; B066: 0B C9  or cx, cx
        OR           cx, cx
        ; B068: 74 1B  je 0xb085
        JE SHORT L_B085
L_B06A LABEL NEAR
        ; B06A: 80 E6 FC  and dh, 0xfc
        AND          dh, 252
L_B06D LABEL NEAR
        ; B06D: 32 E4  xor ah, ah
        XOR          ah, ah
        ; B06F: AC  lodsb al, byte ptr [si]
        LODSB
        ; B070: D1 C0  rol ax, 1
        ROL          ax, 1
        ; B072: D1 C0  rol ax, 1
        ROL          ax, 1
        ; B074: 86 C4  xchg ah, al
        XCHG         al, ah
        ; B076: 0A C6  or al, dh
        OR           al, dh
        ; B078: 8A F4  mov dh, ah
        MOV          dh, ah
        ; B07A: AA  stosb byte ptr es:[di], al
        STOSB
        ; B07B: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; B07E: E2 ED  loop 0xb06d
        LOOP L_B06D
        ; B080: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; B083: 74 0A  je 0xb08f
        JE SHORT L_B08F
L_B085 LABEL NEAR
        ; B085: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; B088: 24 03  and al, 3
        AND          al, 3
        ; B08A: 0A C6  or al, dh
        OR           al, dh
        ; B08C: 26 88 05  mov byte ptr es:[di], al
        MOV          byte ptr es:[di], al
L_B08F LABEL NEAR
        ; B08F: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; B092: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; B096: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; B099: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; B09C: 72 9C  jb 0xb03a
        JB SHORT L_B03A
        ; B09E: 83 C7 28  add di, 0x28
        ADD          di, 40
        ; B0A1: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; B0A4: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; B0A7: 7F 8E  jg 0xb037
        JG SHORT L_B037
        ; B0A9: E9 CA FC  jmp 0xad76
        JMP NEAR PTR L_AD76
L_B0AC LABEL NEAR
        ; B0AC: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; B0AF: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
L_B0B2 LABEL NEAR
        ; B0B2: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_B0B5 LABEL NEAR
        ; B0B5: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; B0B8: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; B0BB: B0 02  mov al, 2
        MOV          al, 2
        ; B0BD: EE  out dx, al
        OUT          dx, al
        ; B0BE: 42  inc dx
        INC          dx
        ; B0BF: 8A C1  mov al, cl
        MOV          al, cl
        ; B0C1: EE  out dx, al
        OUT          dx, al
        ; B0C2: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; B0C5: B0 04  mov al, 4
        MOV          al, 4
        ; B0C7: EE  out dx, al
        OUT          dx, al
        ; B0C8: 42  inc dx
        INC          dx
        ; B0C9: 8A C5  mov al, ch
        MOV          al, ch
        ; B0CB: EE  out dx, al
        OUT          dx, al
        ; B0CC: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; B0CF: 26 8A 35  mov dh, byte ptr es:[di]
        MOV          dh, byte ptr es:[di]
        ; B0D2: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; B0D5: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; B0D8: 75 09  jne 0xb0e3
        JNE SHORT L_B0E3
        ; B0DA: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; B0DD: D0 E6  shl dh, 1
        SHL          dh, 1
        ; B0DF: 0B C9  or cx, cx
        OR           cx, cx
        ; B0E1: 74 19  je 0xb0fc
        JE SHORT L_B0FC
L_B0E3 LABEL NEAR
        ; B0E3: 80 E6 FE  and dh, 0xfe
        AND          dh, 254
L_B0E6 LABEL NEAR
        ; B0E6: 32 E4  xor ah, ah
        XOR          ah, ah
        ; B0E8: AC  lodsb al, byte ptr [si]
        LODSB
        ; B0E9: D1 C0  rol ax, 1
        ROL          ax, 1
        ; B0EB: 86 C4  xchg ah, al
        XCHG         al, ah
        ; B0ED: 0A C6  or al, dh
        OR           al, dh
        ; B0EF: 8A F4  mov dh, ah
        MOV          dh, ah
        ; B0F1: AA  stosb byte ptr es:[di], al
        STOSB
        ; B0F2: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; B0F5: E2 EF  loop 0xb0e6
        LOOP L_B0E6
        ; B0F7: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; B0FA: 74 0A  je 0xb106
        JE SHORT L_B106
L_B0FC LABEL NEAR
        ; B0FC: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; B0FF: 24 01  and al, 1
        AND          al, 1
        ; B101: 0A C6  or al, dh
        OR           al, dh
        ; B103: 26 88 05  mov byte ptr es:[di], al
        MOV          byte ptr es:[di], al
L_B106 LABEL NEAR
        ; B106: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; B109: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; B10D: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; B110: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; B113: 72 A0  jb 0xb0b5
        JB SHORT L_B0B5
        ; B115: 83 C7 28  add di, 0x28
        ADD          di, 40
        ; B118: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; B11B: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; B11E: 7F 92  jg 0xb0b2
        JG SHORT L_B0B2
        ; B120: E9 53 FC  jmp 0xad76
        JMP NEAR PTR L_AD76
_TEXT ENDS
        END
