; Cycles EGA shared continuation and far-entry family 8623..90C9 reconstructed from image bytes.
; Names are descriptive reconstructions, not recovered symbols.
; The complete EGARASTER_TEXT span starts at the shared continuation and includes entry 8670.
        .286
EXTRN _ext_CA08:NEAR
EXTRN _ext_DBA0:NEAR
EGARASTER_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:EGARASTER_TEXT
        PUBLIC _cye_shared_8623
_cye_shared_8623 LABEL NEAR
        ; 8623: 8E 5E 08  mov ds, word ptr [bp + 8]
        MOV          ds, word ptr [bp + 8]
        ; 8626: 8B 76 06  mov si, word ptr [bp + 6]
        MOV          si, word ptr [bp + 6]
        ; 8629: 8B 46 0A  mov ax, word ptr [bp + 0xa]
        MOV          ax, word ptr [bp + 10]
        ; 862C: 2B 44 04  sub ax, word ptr [si + 4]
        SUB          ax, word ptr [si + 4]
        ; 862F: 89 46 F8  mov word ptr [bp - 8], ax
        MOV          word ptr [bp - 8], ax
        ; 8632: 8B 46 0C  mov ax, word ptr [bp + 0xc]
        MOV          ax, word ptr [bp + 12]
        ; 8635: 2B 44 06  sub ax, word ptr [si + 6]
        SUB          ax, word ptr [si + 6]
        ; 8638: 89 46 F6  mov word ptr [bp - 0xa], ax
        MOV          word ptr [bp - 10], ax
        ; 863B: EB 62  jmp 0x869f
        JMP SHORT L_869F
        ; 863D: 90  nop
        NOP
        ; 863E: 55  push bp
        PUSH         bp
        ; 863F: 8B EC  mov bp, sp
        MOV          bp, sp
        ; 8641: 1E  push ds
        PUSH         ds
        ; 8642: 56  push si
        PUSH         si
        ; 8643: 57  push di
        PUSH         di
        ; 8644: 83 EC 44  sub sp, 0x44
        SUB          sp, 68
        ; 8647: B8 5C 33  mov ax, 0x335c
        MOV          ax, 13148
        ; 864A: 89 46 C0  mov word ptr [bp - 0x40], ax
        MOV          word ptr [bp - 64], ax
        ; 864D: B8 6C 33  mov ax, 0x336c
        MOV          ax, 13164
        ; 8650: 89 46 B6  mov word ptr [bp - 0x4a], ax
        MOV          word ptr [bp - 74], ax
        ; 8653: C6 46 BE 00  mov byte ptr [bp - 0x42], 0
        MOV          byte ptr [bp - 66], 0
        ; 8657: C6 46 BF 03  mov byte ptr [bp - 0x41], 3
        MOV          byte ptr [bp - 65], 3
        ; 865B: 8E 5E 08  mov ds, word ptr [bp + 8]
        MOV          ds, word ptr [bp + 8]
        ; 865E: 8B 76 06  mov si, word ptr [bp + 6]
        MOV          si, word ptr [bp + 6]
        ; 8661: 8B 46 0A  mov ax, word ptr [bp + 0xa]
        MOV          ax, word ptr [bp + 10]
        ; 8664: 89 46 F8  mov word ptr [bp - 8], ax
        MOV          word ptr [bp - 8], ax
        ; 8667: 8B 46 0C  mov ax, word ptr [bp + 0xc]
        MOV          ax, word ptr [bp + 12]
        ; 866A: 89 46 F6  mov word ptr [bp - 0xa], ax
        MOV          word ptr [bp - 10], ax
        ; 866D: EB 30  jmp 0x869f
        JMP SHORT L_869F
        ; 866F: 90  nop
        NOP
        PUBLIC _cye_654_entries
_cye_654_entries LABEL FAR
        ; 8670: 55  push bp
        PUSH         bp
        ; 8671: 8B EC  mov bp, sp
        MOV          bp, sp
        ; 8673: 1E  push ds
        PUSH         ds
        ; 8674: 56  push si
        PUSH         si
        ; 8675: 57  push di
        PUSH         di
        ; 8676: 83 EC 44  sub sp, 0x44
        SUB          sp, 68
        ; 8679: B8 5C 33  mov ax, 0x335c
        MOV          ax, 13148
        ; 867C: 89 46 C0  mov word ptr [bp - 0x40], ax
        MOV          word ptr [bp - 64], ax
        ; 867F: B8 6C 33  mov ax, 0x336c
        MOV          ax, 13164
        ; 8682: 89 46 B6  mov word ptr [bp - 0x4a], ax
        MOV          word ptr [bp - 74], ax
        ; 8685: C6 46 BE 00  mov byte ptr [bp - 0x42], 0
        MOV          byte ptr [bp - 66], 0
        ; 8689: C6 46 BF 03  mov byte ptr [bp - 0x41], 3
        MOV          byte ptr [bp - 65], 3
        ; 868D: 8E 5E 08  mov ds, word ptr [bp + 8]
        MOV          ds, word ptr [bp + 8]
        ; 8690: 8B 76 06  mov si, word ptr [bp + 6]
        MOV          si, word ptr [bp + 6]
        ; 8693: 8B 44 08  mov ax, word ptr [si + 8]
        MOV          ax, word ptr [si + 8]
        ; 8696: 89 46 F8  mov word ptr [bp - 8], ax
        MOV          word ptr [bp - 8], ax
        ; 8699: 8B 44 0A  mov ax, word ptr [si + 0xa]
        MOV          ax, word ptr [si + 10]
        ; 869C: 89 46 F6  mov word ptr [bp - 0xa], ax
        MOV          word ptr [bp - 10], ax
L_869F LABEL NEAR
        ; 869F: FC  cld
        CLD
        ; 86A0: 8B 5E F6  mov bx, word ptr [bp - 0xa]
        MOV          bx, word ptr [bp - 10]
        ; 86A3: 8B 4C 02  mov cx, word ptr [si + 2]
        MOV          cx, word ptr [si + 2]
        ; 86A6: 8D 54 10  lea dx, [si + 0x10]
        LEA          dx, [si + 16]
        ; 86A9: 8B C3  mov ax, bx
        MOV          ax, bx
        ; 86AB: 2E 3B 06 9A 4E  cmp ax, word ptr cs:[0x4e9a]
        CMP          ax, word ptr cs:[20122]
        ; 86B0: 7C 10  jl 0x86c2
        JL SHORT L_86C2
        ; 86B2: 03 C1  add ax, cx
        ADD          ax, cx
        ; 86B4: 2E 2B 06 9C 4E  sub ax, word ptr cs:[0x4e9c]
        SUB          ax, word ptr cs:[20124]
        ; 86B9: 7E 28  jle 0x86e3
        JLE SHORT L_86E3
        ; 86BB: 2B C8  sub cx, ax
        SUB          cx, ax
        ; 86BD: 7F 24  jg 0x86e3
        JG SHORT L_86E3
L_86BF LABEL NEAR
        ; 86BF: E9 82 03  jmp 0x8a44
        JMP NEAR PTR L_8A44
L_86C2 LABEL NEAR
        ; 86C2: 2E 8B 1E 9A 4E  mov bx, word ptr cs:[0x4e9a]
        MOV          bx, word ptr cs:[20122]
        ; 86C7: 03 C1  add ax, cx
        ADD          ax, cx
        ; 86C9: 2B C3  sub ax, bx
        SUB          ax, bx
        ; 86CB: 7E F2  jle 0x86bf
        JLE SHORT L_86BF
        ; 86CD: 91  xchg cx, ax
        XCHG         cx, ax
        ; 86CE: 2B C1  sub ax, cx
        SUB          ax, cx
        ; 86D0: F6 24  mul byte ptr [si]
        MUL          byte ptr [si]
        ; 86D2: 03 D0  add dx, ax
        ADD          dx, ax
        ; 86D4: 8B C3  mov ax, bx
        MOV          ax, bx
        ; 86D6: 03 C1  add ax, cx
        ADD          ax, cx
        ; 86D8: 2E 2B 06 9C 4E  sub ax, word ptr cs:[0x4e9c]
        SUB          ax, word ptr cs:[20124]
        ; 86DD: 7E 04  jle 0x86e3
        JLE SHORT L_86E3
        ; 86DF: 2B C8  sub cx, ax
        SUB          cx, ax
        ; 86E1: 7E DC  jle 0x86bf
        JLE SHORT L_86BF
L_86E3 LABEL NEAR
        ; 86E3: 89 56 D8  mov word ptr [bp - 0x28], dx
        MOV          word ptr [bp - 40], dx
        ; 86E6: 89 4E F2  mov word ptr [bp - 0xe], cx
        MOV          word ptr [bp - 14], cx
        ; 86E9: 89 5E F6  mov word ptr [bp - 0xa], bx
        MOV          word ptr [bp - 10], bx
        ; 86EC: C6 46 C2 03  mov byte ptr [bp - 0x3e], 3
        MOV          byte ptr [bp - 62], 3
        ; 86F0: 8B 0C  mov cx, word ptr [si]
        MOV          cx, word ptr [si]
        ; 86F2: 89 4E D2  mov word ptr [bp - 0x2e], cx
        MOV          word ptr [bp - 46], cx
        ; 86F5: 33 D2  xor dx, dx
        XOR          dx, dx
        ; 86F7: 8B 5E F8  mov bx, word ptr [bp - 8]
        MOV          bx, word ptr [bp - 8]
        ; 86FA: 8B C3  mov ax, bx
        MOV          ax, bx
        ; 86FC: 25 07 00  and ax, 7
        AND          ax, 7
        ; 86FF: 89 46 CC  mov word ptr [bp - 0x34], ax
        MOV          word ptr [bp - 52], ax
        ; 8702: D1 FB  sar bx, 1
        SAR          bx, 1
        ; 8704: D1 FB  sar bx, 1
        SAR          bx, 1
        ; 8706: D1 FB  sar bx, 1
        SAR          bx, 1
        ; 8708: 8B C3  mov ax, bx
        MOV          ax, bx
        ; 870A: 2E 3B 06 96 4E  cmp ax, word ptr cs:[0x4e96]
        CMP          ax, word ptr cs:[20118]
        ; 870F: 7C 16  jl 0x8727
        JL SHORT L_8727
        ; 8711: 03 C1  add ax, cx
        ADD          ax, cx
        ; 8713: 2E 2B 06 98 4E  sub ax, word ptr cs:[0x4e98]
        SUB          ax, word ptr cs:[20120]
        ; 8718: 7C 3A  jl 0x8754
        JL SHORT L_8754
        ; 871A: C6 46 C2 02  mov byte ptr [bp - 0x3e], 2
        MOV          byte ptr [bp - 62], 2
        ; 871E: 2B C8  sub cx, ax
        SUB          cx, ax
        ; 8720: 7E 9D  jle 0x86bf
        JLE SHORT L_86BF
        ; 8722: 8B D0  mov dx, ax
        MOV          dx, ax
        ; 8724: EB 2E  jmp 0x8754
        JMP SHORT L_8754
        ; 8726: 90  nop
        NOP
L_8727 LABEL NEAR
        ; 8727: 2E 8B 1E 96 4E  mov bx, word ptr cs:[0x4e96]
        MOV          bx, word ptr cs:[20118]
        ; 872C: 03 C1  add ax, cx
        ADD          ax, cx
        ; 872E: 2B C3  sub ax, bx
        SUB          ax, bx
        ; 8730: 7C 8D  jl 0x86bf
        JL SHORT L_86BF
        ; 8732: 8B F1  mov si, cx
        MOV          si, cx
        ; 8734: 2B F0  sub si, ax
        SUB          si, ax
        ; 8736: 01 76 D8  add word ptr [bp - 0x28], si
        ADD          word ptr [bp - 40], si
        ; 8739: C6 46 C2 01  mov byte ptr [bp - 0x3e], 1
        MOV          byte ptr [bp - 62], 1
        ; 873D: 2E 8B 36 98 4E  mov si, word ptr cs:[0x4e98]
        MOV          si, word ptr cs:[20120]
        ; 8742: 2B F3  sub si, bx
        SUB          si, bx
        ; 8744: 3B C6  cmp ax, si
        CMP          ax, si
        ; 8746: 7C 06  jl 0x874e
        JL SHORT L_874E
        ; 8748: 8B C6  mov ax, si
        MOV          ax, si
        ; 874A: C6 46 C2 00  mov byte ptr [bp - 0x3e], 0
        MOV          byte ptr [bp - 62], 0
L_874E LABEL NEAR
        ; 874E: 87 CA  xchg dx, cx
        XCHG         cx, dx
        ; 8750: 2B D0  sub dx, ax
        SUB          dx, ax
        ; 8752: 03 C8  add cx, ax
        ADD          cx, ax
L_8754 LABEL NEAR
        ; 8754: 89 4E F4  mov word ptr [bp - 0xc], cx
        MOV          word ptr [bp - 12], cx
        ; 8757: 89 56 CA  mov word ptr [bp - 0x36], dx
        MOV          word ptr [bp - 54], dx
        ; 875A: 89 5E F8  mov word ptr [bp - 8], bx
        MOV          word ptr [bp - 8], bx
        ; 875D: 8B 76 06  mov si, word ptr [bp + 6]
        MOV          si, word ptr [bp + 6]
        ; 8760: 8B 5E F6  mov bx, word ptr [bp - 0xa]
        MOV          bx, word ptr [bp - 10]
        ; 8763: D1 E3  shl bx, 1
        SHL          bx, 1
        ; 8765: 2E 03 1E 94 4E  add bx, word ptr cs:[0x4e94]
        ADD          bx, word ptr cs:[20116]
        ; 876A: 8B 46 F8  mov ax, word ptr [bp - 8]
        MOV          ax, word ptr [bp - 8]
        ; 876D: 2E 03 07  add ax, word ptr cs:[bx]
        ADD          ax, word ptr cs:[bx]
        ; 8770: 89 46 D6  mov word ptr [bp - 0x2a], ax
        MOV          word ptr [bp - 42], ax
        ; 8773: 8B 44 02  mov ax, word ptr [si + 2]
        MOV          ax, word ptr [si + 2]
        ; 8776: F6 24  mul byte ptr [si]
        MUL          byte ptr [si]
        ; 8778: F6 44 0F F0  test byte ptr [si + 0xf], 0xf0
        TEST         byte ptr [si + 15], 240
        ; 877C: 74 0F  je 0x878d
        JE SHORT L_878D
        ; 877E: 8A 54 0F  mov dl, byte ptr [si + 0xf]
        MOV          dl, byte ptr [si + 15]
        ; 8781: D0 EA  shr dl, 1
        SHR          dl, 1
        ; 8783: D0 EA  shr dl, 1
        SHR          dl, 1
        ; 8785: D0 EA  shr dl, 1
        SHR          dl, 1
        ; 8787: D0 EA  shr dl, 1
        SHR          dl, 1
        ; 8789: 32 F6  xor dh, dh
        XOR          dh, dh
        ; 878B: 03 C2  add ax, dx
        ADD          ax, dx
L_878D LABEL NEAR
        ; 878D: 89 46 C8  mov word ptr [bp - 0x38], ax
        MOV          word ptr [bp - 56], ax
        ; 8790: 2E A1 9E 4E  mov ax, word ptr cs:[0x4e9e]
        MOV          ax, word ptr cs:[20126]
        ; 8794: 2B 46 F4  sub ax, word ptr [bp - 0xc]
        SUB          ax, word ptr [bp - 12]
        ; 8797: 89 46 D4  mov word ptr [bp - 0x2c], ax
        MOV          word ptr [bp - 44], ax
        ; 879A: 2E 81 3E 8C 4E 00 A0  cmp word ptr cs:[0x4e8c], 0xa000
        CMP          word ptr cs:[20108], 40960
        ; 87A1: 75 03  jne 0x87a6
        JNE SHORT L_87A6
        ; 87A3: E9 10 01  jmp 0x88b6
        JMP NEAR PTR L_88B6
L_87A6 LABEL NEAR
        ; 87A6: 8D 74 0C  lea si, [si + 0xc]
        LEA          si, [si + 12]
        ; 87A9: 33 FF  xor di, di
        XOR          di, di
        ; 87AB: 8B 56 D8  mov dx, word ptr [bp - 0x28]
        MOV          dx, word ptr [bp - 40]
L_87AE LABEL NEAR
        ; 87AE: 8A 1C  mov bl, byte ptr [si]
        MOV          bl, byte ptr [si]
        ; 87B0: 83 E3 0F  and bx, 0xf
        AND          bx, 15
        ; 87B3: 74 33  je 0x87e8
        JE SHORT L_87E8
L_87B5 LABEL NEAR
        ; 87B5: 0B DB  or bx, bx
        OR           bx, bx
        ; 87B7: 74 24  je 0x87dd
        JE SHORT L_87DD
        ; 87B9: 8B CB  mov cx, bx
        MOV          cx, bx
        ; 87BB: 2E 8A 9F 3E 2F  mov bl, byte ptr cs:[bx + 0x2f3e]
        MOV          bl, byte ptr cs:[bx + 12094]
        ; 87C0: 2E 22 8F 5E 2F  and cl, byte ptr cs:[bx + 0x2f5e]
        AND          cl, byte ptr cs:[bx + 12126]
        ; 87C5: D1 E3  shl bx, 1
        SHL          bx, 1
        ; 87C7: 2E 8B 87 8C 4E  mov ax, word ptr cs:[bx + 0x4e8c]
        MOV          ax, word ptr cs:[bx + 20108]
        ; 87CC: 8B D9  mov bx, cx
        MOV          bx, cx
        ; 87CE: 0B C0  or ax, ax
        OR           ax, ax
        ; 87D0: 74 E3  je 0x87b5
        JE SHORT L_87B5
        ; 87D2: 89 43 EA  mov word ptr [bp + di - 0x16], ax
        MOV          word ptr [bp + di - 22], ax
        ; 87D5: 89 53 E2  mov word ptr [bp + di - 0x1e], dx
        MOV          word ptr [bp + di - 30], dx
        ; 87D8: 83 C7 02  add di, 2
        ADD          di, 2
        ; 87DB: EB D8  jmp 0x87b5
        JMP SHORT L_87B5
L_87DD LABEL NEAR
        ; 87DD: 83 FF 08  cmp di, 8
        CMP          di, 8
        ; 87E0: 7D 06  jge 0x87e8
        JGE SHORT L_87E8
        ; 87E2: 46  inc si
        INC          si
        ; 87E3: 03 56 C8  add dx, word ptr [bp - 0x38]
        ADD          dx, word ptr [bp - 56]
        ; 87E6: EB C6  jmp 0x87ae
        JMP SHORT L_87AE
L_87E8 LABEL NEAR
        ; 87E8: 83 EF 02  sub di, 2
        SUB          di, 2
        ; 87EB: 89 7E C6  mov word ptr [bp - 0x3a], di
        MOV          word ptr [bp - 58], di
        ; 87EE: 8B 76 06  mov si, word ptr [bp + 6]
        MOV          si, word ptr [bp + 6]
        ; 87F1: F6 44 0C F0  test byte ptr [si + 0xc], 0xf0
        TEST         byte ptr [si + 12], 240
        ; 87F5: 74 46  je 0x883d
        JE SHORT L_883D
        ; 87F7: F6 46 BF 01  test byte ptr [bp - 0x41], 1
        TEST         byte ptr [bp - 65], 1
        ; 87FB: 74 40  je 0x883d
        JE SHORT L_883D
        ; 87FD: C6 46 BC 10  mov byte ptr [bp - 0x44], 0x10
        MOV          byte ptr [bp - 68], 16
        ; 8801: C7 46 BA 00 00  mov word ptr [bp - 0x46], 0
        MOV          word ptr [bp - 70], 0
L_8806 LABEL NEAR
        ; 8806: 8A 46 BC  mov al, byte ptr [bp - 0x44]
        MOV          al, byte ptr [bp - 68]
        ; 8809: 84 44 0C  test byte ptr [si + 0xc], al
        TEST         byte ptr [si + 12], al
        ; 880C: 74 26  je 0x8834
        JE SHORT L_8834
        ; 880E: 8B 5E BA  mov bx, word ptr [bp - 0x46]
        MOV          bx, word ptr [bp - 70]
        ; 8811: 2E 8B 87 8C 4E  mov ax, word ptr cs:[bx + 0x4e8c]
        MOV          ax, word ptr cs:[bx + 20108]
        ; 8816: 0B C0  or ax, ax
        OR           ax, ax
        ; 8818: 74 1A  je 0x8834
        JE SHORT L_8834
        ; 881A: 8E C0  mov es, ax
        MOV          es, ax
        ; 881C: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; 881F: 8B 56 F4  mov dx, word ptr [bp - 0xc]
        MOV          dx, word ptr [bp - 12]
        ; 8822: 8B 76 F2  mov si, word ptr [bp - 0xe]
        MOV          si, word ptr [bp - 14]
        ; 8825: 8B 4E D4  mov cx, word ptr [bp - 0x2c]
        MOV          cx, word ptr [bp - 44]
        ; 8828: 8B 5E CC  mov bx, word ptr [bp - 0x34]
        MOV          bx, word ptr [bp - 52]
        ; 882B: 8A 46 C2  mov al, byte ptr [bp - 0x3e]
        MOV          al, byte ptr [bp - 62]
        ; 882E: E8 D7 41  call 0xca08
        CALL _ext_CA08
        ; 8831: 8B 76 06  mov si, word ptr [bp + 6]
        MOV          si, word ptr [bp + 6]
L_8834 LABEL NEAR
        ; 8834: 83 46 BA 02  add word ptr [bp - 0x46], 2
        ADD          word ptr [bp - 70], 2
        ; 8838: D0 66 BC  shl byte ptr [bp - 0x44], 1
        SHL          byte ptr [bp - 68], 1
        ; 883B: 73 C9  jae 0x8806
        JAE SHORT L_8806
L_883D LABEL NEAR
        ; 883D: F6 44 0D F0  test byte ptr [si + 0xd], 0xf0
        TEST         byte ptr [si + 13], 240
        ; 8841: 74 55  je 0x8898
        JE SHORT L_8898
        ; 8843: F6 46 BF 06  test byte ptr [bp - 0x41], 6
        TEST         byte ptr [bp - 65], 6
        ; 8847: 74 4F  je 0x8898
        JE SHORT L_8898
        ; 8849: B8 CE 73  mov ax, 0x73ce
        MOV          ax, 29646
        ; 884C: F6 46 BF 04  test byte ptr [bp - 0x41], 4
        TEST         byte ptr [bp - 65], 4
        ; 8850: 74 03  je 0x8855
        JE SHORT L_8855
        ; 8852: B8 34 74  mov ax, 0x7434
        MOV          ax, 29748
L_8855 LABEL NEAR
        ; 8855: 89 46 B8  mov word ptr [bp - 0x48], ax
        MOV          word ptr [bp - 72], ax
        ; 8858: C6 46 BC 10  mov byte ptr [bp - 0x44], 0x10
        MOV          byte ptr [bp - 68], 16
        ; 885C: C7 46 BA 00 00  mov word ptr [bp - 0x46], 0
        MOV          word ptr [bp - 70], 0
L_8861 LABEL NEAR
        ; 8861: 8A 46 BC  mov al, byte ptr [bp - 0x44]
        MOV          al, byte ptr [bp - 68]
        ; 8864: 84 44 0D  test byte ptr [si + 0xd], al
        TEST         byte ptr [si + 13], al
        ; 8867: 74 26  je 0x888f
        JE SHORT L_888F
        ; 8869: 8B 5E BA  mov bx, word ptr [bp - 0x46]
        MOV          bx, word ptr [bp - 70]
        ; 886C: 2E 8B 87 8C 4E  mov ax, word ptr cs:[bx + 0x4e8c]
        MOV          ax, word ptr cs:[bx + 20108]
        ; 8871: 0B C0  or ax, ax
        OR           ax, ax
        ; 8873: 74 1A  je 0x888f
        JE SHORT L_888F
        ; 8875: 8E C0  mov es, ax
        MOV          es, ax
        ; 8877: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; 887A: 8B 56 F4  mov dx, word ptr [bp - 0xc]
        MOV          dx, word ptr [bp - 12]
        ; 887D: 8B 76 F2  mov si, word ptr [bp - 0xe]
        MOV          si, word ptr [bp - 14]
        ; 8880: 8B 4E D4  mov cx, word ptr [bp - 0x2c]
        MOV          cx, word ptr [bp - 44]
        ; 8883: 8B 5E CC  mov bx, word ptr [bp - 0x34]
        MOV          bx, word ptr [bp - 52]
        ; 8886: 8A 46 C2  mov al, byte ptr [bp - 0x3e]
        MOV          al, byte ptr [bp - 62]
        ; 8889: FF 56 B8  call word ptr [bp - 0x48]
        CALL         word ptr [bp - 72]
        ; 888C: 8B 76 06  mov si, word ptr [bp + 6]
        MOV          si, word ptr [bp + 6]
L_888F LABEL NEAR
        ; 888F: 83 46 BA 02  add word ptr [bp - 0x46], 2
        ADD          word ptr [bp - 70], 2
        ; 8893: D0 66 BC  shl byte ptr [bp - 0x44], 1
        SHL          byte ptr [bp - 68], 1
        ; 8896: 73 C9  jae 0x8861
        JAE SHORT L_8861
L_8898 LABEL NEAR
        ; 8898: 83 7E C6 00  cmp word ptr [bp - 0x3a], 0
        CMP          word ptr [bp - 58], 0
        ; 889C: 7C 15  jl 0x88b3
        JL SHORT L_88B3
        ; 889E: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; 88A1: 8B 5E CC  mov bx, word ptr [bp - 0x34]
        MOV          bx, word ptr [bp - 52]
        ; 88A4: D1 E3  shl bx, 1
        SHL          bx, 1
        ; 88A6: 8B 46 F4  mov ax, word ptr [bp - 0xc]
        MOV          ax, word ptr [bp - 12]
        ; 88A9: 03 C3  add ax, bx
        ADD          ax, bx
        ; 88AB: 74 06  je 0x88b3
        JE SHORT L_88B3
        ; 88AD: 03 5E C0  add bx, word ptr [bp - 0x40]
        ADD          bx, word ptr [bp - 64]
        ; 88B0: 2E FF 27  jmp word ptr cs:[bx]
        JMP          word ptr cs:[bx]
L_88B3 LABEL NEAR
        ; 88B3: E9 8E 01  jmp 0x8a44
        JMP NEAR PTR L_8A44
L_88B6 LABEL NEAR
        ; 88B6: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; 88B9: B0 03  mov al, 3
        MOV          al, 3
        ; 88BB: EE  out dx, al
        OUT          dx, al
        ; 88BC: 42  inc dx
        INC          dx
        ; 88BD: 8A 46 BE  mov al, byte ptr [bp - 0x42]
        MOV          al, byte ptr [bp - 66]
        ; 88C0: EE  out dx, al
        OUT          dx, al
        ; 88C1: 2E 8E 06 8C 4E  mov es, word ptr cs:[0x4e8c]
        MOV          es, word ptr cs:[20108]
        ; 88C6: 8B 46 C8  mov ax, word ptr [bp - 0x38]
        MOV          ax, word ptr [bp - 56]
        ; 88C9: 2B 46 F4  sub ax, word ptr [bp - 0xc]
        SUB          ax, word ptr [bp - 12]
        ; 88CC: 89 46 D0  mov word ptr [bp - 0x30], ax
        MOV          word ptr [bp - 48], ax
        ; 88CF: 8D 74 0C  lea si, [si + 0xc]
        LEA          si, [si + 12]
        ; 88D2: 33 FF  xor di, di
        XOR          di, di
        ; 88D4: B9 04 00  mov cx, 4
        MOV          cx, 4
        ; 88D7: 33 DB  xor bx, bx
        XOR          bx, bx
        ; 88D9: C7 46 CE 00 00  mov word ptr [bp - 0x32], 0
        MOV          word ptr [bp - 50], 0
L_88DE LABEL NEAR
        ; 88DE: 8A 1C  mov bl, byte ptr [si]
        MOV          bl, byte ptr [si]
        ; 88E0: 83 E3 0F  and bx, 0xf
        AND          bx, 15
        ; 88E3: 74 2D  je 0x8912
        JE SHORT L_8912
        ; 88E5: 8B 56 F4  mov dx, word ptr [bp - 0xc]
        MOV          dx, word ptr [bp - 12]
        ; 88E8: F7 DA  neg dx
        NEG          dx
L_88EA LABEL NEAR
        ; 88EA: 2E 8A A7 3E 2F  mov ah, byte ptr cs:[bx + 0x2f3e]
        MOV          ah, byte ptr cs:[bx + 12094]
        ; 88EF: 2E 8A 87 4E 2F  mov al, byte ptr cs:[bx + 0x2f4e]
        MOV          al, byte ptr cs:[bx + 12110]
        ; 88F4: 89 43 DA  mov word ptr [bp + di - 0x26], ax
        MOV          word ptr [bp + di - 38], ax
        ; 88F7: 89 53 E2  mov word ptr [bp + di - 0x1e], dx
        MOV          word ptr [bp + di - 30], dx
        ; 88FA: 83 C7 02  add di, 2
        ADD          di, 2
        ; 88FD: F7 D0  not ax
        NOT          ax
        ; 88FF: 23 D8  and bx, ax
        AND          bx, ax
        ; 8901: 75 E7  jne 0x88ea
        JNE SHORT L_88EA
        ; 8903: 8B 56 D0  mov dx, word ptr [bp - 0x30]
        MOV          dx, word ptr [bp - 48]
        ; 8906: 89 53 E0  mov word ptr [bp + di - 0x20], dx
        MOV          word ptr [bp + di - 32], dx
        ; 8909: 8B 56 C8  mov dx, word ptr [bp - 0x38]
        MOV          dx, word ptr [bp - 56]
        ; 890C: 01 56 CE  add word ptr [bp - 0x32], dx
        ADD          word ptr [bp - 50], dx
        ; 890F: 46  inc si
        INC          si
        ; 8910: E2 CC  loop 0x88de
        LOOP L_88DE
L_8912 LABEL NEAR
        ; 8912: 8D 43 DA  lea ax, [bp + di - 0x26]
        LEA          ax, [bp + di - 38]
        ; 8915: 89 46 C4  mov word ptr [bp - 0x3c], ax
        MOV          word ptr [bp - 60], ax
        ; 8918: 8B 56 D2  mov dx, word ptr [bp - 0x2e]
        MOV          dx, word ptr [bp - 46]
        ; 891B: 29 56 CE  sub word ptr [bp - 0x32], dx
        SUB          word ptr [bp - 50], dx
        ; 891E: 8B 76 06  mov si, word ptr [bp + 6]
        MOV          si, word ptr [bp + 6]
        ; 8921: F6 44 0C F0  test byte ptr [si + 0xc], 0xf0
        TEST         byte ptr [si + 12], 240
        ; 8925: 74 51  je 0x8978
        JE SHORT L_8978
        ; 8927: F6 46 BF 01  test byte ptr [bp - 0x41], 1
        TEST         byte ptr [bp - 65], 1
        ; 892B: 74 4B  je 0x8978
        JE SHORT L_8978
        ; 892D: C6 46 BC 10  mov byte ptr [bp - 0x44], 0x10
        MOV          byte ptr [bp - 68], 16
        ; 8931: C7 46 BA 00 00  mov word ptr [bp - 0x46], 0
        MOV          word ptr [bp - 70], 0
L_8936 LABEL NEAR
        ; 8936: 8A 46 BC  mov al, byte ptr [bp - 0x44]
        MOV          al, byte ptr [bp - 68]
        ; 8939: 84 44 0C  test byte ptr [si + 0xc], al
        TEST         byte ptr [si + 12], al
        ; 893C: 74 32  je 0x8970
        JE SHORT L_8970
        ; 893E: 8B 5E BA  mov bx, word ptr [bp - 0x46]
        MOV          bx, word ptr [bp - 70]
        ; 8941: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; 8944: B0 04  mov al, 4
        MOV          al, 4
        ; 8946: EE  out dx, al
        OUT          dx, al
        ; 8947: 42  inc dx
        INC          dx
        ; 8948: 8A C3  mov al, bl
        MOV          al, bl
        ; 894A: EE  out dx, al
        OUT          dx, al
        ; 894B: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; 894E: B0 02  mov al, 2
        MOV          al, 2
        ; 8950: EE  out dx, al
        OUT          dx, al
        ; 8951: 42  inc dx
        INC          dx
        ; 8952: 2E 8A 87 62 2F  mov al, byte ptr cs:[bx + 0x2f62]
        MOV          al, byte ptr cs:[bx + 12130]
        ; 8957: EE  out dx, al
        OUT          dx, al
        ; 8958: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; 895B: 8B 56 F4  mov dx, word ptr [bp - 0xc]
        MOV          dx, word ptr [bp - 12]
        ; 895E: 8B 76 F2  mov si, word ptr [bp - 0xe]
        MOV          si, word ptr [bp - 14]
        ; 8961: 8B 4E D4  mov cx, word ptr [bp - 0x2c]
        MOV          cx, word ptr [bp - 44]
        ; 8964: 8B 5E CC  mov bx, word ptr [bp - 0x34]
        MOV          bx, word ptr [bp - 52]
        ; 8967: 8A 46 C2  mov al, byte ptr [bp - 0x3e]
        MOV          al, byte ptr [bp - 62]
        ; 896A: E8 33 52  call 0xdba0
        CALL _ext_DBA0
        ; 896D: 8B 76 06  mov si, word ptr [bp + 6]
        MOV          si, word ptr [bp + 6]
L_8970 LABEL NEAR
        ; 8970: FF 46 BA  inc word ptr [bp - 0x46]
        INC          word ptr [bp - 70]
        ; 8973: D0 66 BC  shl byte ptr [bp - 0x44], 1
        SHL          byte ptr [bp - 68], 1
        ; 8976: 73 BE  jae 0x8936
        JAE SHORT L_8936
L_8978 LABEL NEAR
        ; 8978: F6 44 0D F0  test byte ptr [si + 0xd], 0xf0
        TEST         byte ptr [si + 13], 240
        ; 897C: 74 61  je 0x89df
        JE SHORT L_89DF
        ; 897E: F6 46 BF 06  test byte ptr [bp - 0x41], 6
        TEST         byte ptr [bp - 65], 6
        ; 8982: 74 5B  je 0x89df
        JE SHORT L_89DF
        ; 8984: B8 6D 85  mov ax, 0x856d
        MOV          ax, 34157
        ; 8987: F6 46 BF 04  test byte ptr [bp - 0x41], 4
        TEST         byte ptr [bp - 65], 4
        ; 898B: 74 03  je 0x8990
        JE SHORT L_8990
        ; 898D: B8 DA 85  mov ax, 0x85da
        MOV          ax, 34266
L_8990 LABEL NEAR
        ; 8990: 89 46 B8  mov word ptr [bp - 0x48], ax
        MOV          word ptr [bp - 72], ax
        ; 8993: C6 46 BC 10  mov byte ptr [bp - 0x44], 0x10
        MOV          byte ptr [bp - 68], 16
        ; 8997: C7 46 BA 00 00  mov word ptr [bp - 0x46], 0
        MOV          word ptr [bp - 70], 0
L_899C LABEL NEAR
        ; 899C: 8A 46 BC  mov al, byte ptr [bp - 0x44]
        MOV          al, byte ptr [bp - 68]
        ; 899F: 84 44 0D  test byte ptr [si + 0xd], al
        TEST         byte ptr [si + 13], al
        ; 89A2: 74 32  je 0x89d6
        JE SHORT L_89D6
        ; 89A4: 8B 5E BA  mov bx, word ptr [bp - 0x46]
        MOV          bx, word ptr [bp - 70]
        ; 89A7: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; 89AA: B0 04  mov al, 4
        MOV          al, 4
        ; 89AC: EE  out dx, al
        OUT          dx, al
        ; 89AD: 42  inc dx
        INC          dx
        ; 89AE: 8A C3  mov al, bl
        MOV          al, bl
        ; 89B0: EE  out dx, al
        OUT          dx, al
        ; 89B1: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; 89B4: B0 02  mov al, 2
        MOV          al, 2
        ; 89B6: EE  out dx, al
        OUT          dx, al
        ; 89B7: 42  inc dx
        INC          dx
        ; 89B8: 2E 8A 87 62 2F  mov al, byte ptr cs:[bx + 0x2f62]
        MOV          al, byte ptr cs:[bx + 12130]
        ; 89BD: EE  out dx, al
        OUT          dx, al
        ; 89BE: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; 89C1: 8B 56 F4  mov dx, word ptr [bp - 0xc]
        MOV          dx, word ptr [bp - 12]
        ; 89C4: 8B 76 F2  mov si, word ptr [bp - 0xe]
        MOV          si, word ptr [bp - 14]
        ; 89C7: 8B 4E D4  mov cx, word ptr [bp - 0x2c]
        MOV          cx, word ptr [bp - 44]
        ; 89CA: 8B 5E CC  mov bx, word ptr [bp - 0x34]
        MOV          bx, word ptr [bp - 52]
        ; 89CD: 8A 46 C2  mov al, byte ptr [bp - 0x3e]
        MOV          al, byte ptr [bp - 62]
        ; 89D0: FF 56 B8  call word ptr [bp - 0x48]
        CALL         word ptr [bp - 72]
        ; 89D3: 8B 76 06  mov si, word ptr [bp + 6]
        MOV          si, word ptr [bp + 6]
L_89D6 LABEL NEAR
        ; 89D6: 83 46 BA 01  add word ptr [bp - 0x46], 1
        ADD          word ptr [bp - 70], 1
        ; 89DA: D0 66 BC  shl byte ptr [bp - 0x44], 1
        SHL          byte ptr [bp - 68], 1
        ; 89DD: 73 BD  jae 0x899c
        JAE SHORT L_899C
L_89DF LABEL NEAR
        ; 89DF: 8D 46 DA  lea ax, [bp - 0x26]
        LEA          ax, [bp - 38]
        ; 89E2: 3B 46 C4  cmp ax, word ptr [bp - 0x3c]
        CMP          ax, word ptr [bp - 60]
        ; 89E5: 74 5D  je 0x8a44
        JE SHORT L_8A44
        ; 89E7: 8B 5E CC  mov bx, word ptr [bp - 0x34]
        MOV          bx, word ptr [bp - 52]
        ; 89EA: D1 E3  shl bx, 1
        SHL          bx, 1
        ; 89EC: 8B 46 F4  mov ax, word ptr [bp - 0xc]
        MOV          ax, word ptr [bp - 12]
        ; 89EF: 03 C3  add ax, bx
        ADD          ax, bx
        ; 89F1: 74 06  je 0x89f9
        JE SHORT L_89F9
        ; 89F3: 03 5E B6  add bx, word ptr [bp - 0x4a]
        ADD          bx, word ptr [bp - 74]
        ; 89F6: 2E FF 27  jmp word ptr cs:[bx]
        JMP          word ptr cs:[bx]
L_89F9 LABEL NEAR
        ; 89F9: E9 10 03  jmp 0x8d0c
        JMP NEAR PTR L_8D0C
_raster_654_table_a LABEL WORD
        DW OFFSET L_8A1C,OFFSET L_8A4C
        DW OFFSET L_8AA1,OFFSET L_8AFB
        DW OFFSET L_8B59,OFFSET L_8BBB
        DW OFFSET L_8C1B,OFFSET L_8C77
_raster_654_table_b LABEL WORD
        DW OFFSET _cye_case_8CCF,OFFSET L_8D55
        DW OFFSET L_8DCF,OFFSET L_8E4D
        DW OFFSET L_8ECF,OFFSET L_8F52
        DW OFFSET L_8FD3,OFFSET L_9050
L_8A1C LABEL NEAR
        ; 8A1C: 8B 56 D4  mov dx, word ptr [bp - 0x2c]
        MOV          dx, word ptr [bp - 44]
L_8A1F LABEL NEAR
        ; 8A1F: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; 8A22: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; 8A25: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; 8A28: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; 8A2B: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_8A2E LABEL NEAR
        ; 8A2E: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; 8A31: F3 A4  rep movsb byte ptr es:[di], byte ptr [si]
        REP MOVSB
        ; 8A33: 03 FA  add di, dx
        ADD          di, dx
        ; 8A35: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; 8A38: 4B  dec bx
        DEC          bx
        ; 8A39: 7F F3  jg 0x8a2e
        JG SHORT L_8A2E
        ; 8A3B: 03 76 C8  add si, word ptr [bp - 0x38]
        ADD          si, word ptr [bp - 56]
        ; 8A3E: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; 8A42: 7D DB  jge 0x8a1f
        JGE SHORT L_8A1F
L_8A44 LABEL NEAR
        ; 8A44: 83 C4 44  add sp, 0x44
        ADD          sp, 68
        ; 8A47: 5F  pop di
        POP          di
        ; 8A48: 5E  pop si
        POP          si
        ; 8A49: 1F  pop ds
        POP          ds
        ; 8A4A: 5D  pop bp
        POP          bp
        ; 8A4B: CB  retf
        RETF
L_8A4C LABEL NEAR
        ; 8A4C: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; 8A4F: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; 8A52: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; 8A55: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; 8A58: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_8A5B LABEL NEAR
        ; 8A5B: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; 8A5E: 26 8A 35  mov dh, byte ptr es:[di]
        MOV          dh, byte ptr es:[di]
        ; 8A61: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; 8A64: 75 0C  jne 0x8a72
        JNE SHORT L_8A72
        ; 8A66: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; 8A69: D0 CE  ror dh, 1
        ROR          dh, 1
        ; 8A6B: 80 E6 80  and dh, 0x80
        AND          dh, 128
        ; 8A6E: 0B C9  or cx, cx
        OR           cx, cx
        ; 8A70: 74 14  je 0x8a86
        JE SHORT L_8A86
L_8A72 LABEL NEAR
        ; 8A72: 80 E6 80  and dh, 0x80
        AND          dh, 128
L_8A75 LABEL NEAR
        ; 8A75: 32 E4  xor ah, ah
        XOR          ah, ah
        ; 8A77: AC  lodsb al, byte ptr [si]
        LODSB
        ; 8A78: D1 C8  ror ax, 1
        ROR          ax, 1
        ; 8A7A: 0A C6  or al, dh
        OR           al, dh
        ; 8A7C: 8A F4  mov dh, ah
        MOV          dh, ah
        ; 8A7E: AA  stosb byte ptr es:[di], al
        STOSB
        ; 8A7F: E2 F4  loop 0x8a75
        LOOP L_8A75
        ; 8A81: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; 8A84: 74 0A  je 0x8a90
        JE SHORT L_8A90
L_8A86 LABEL NEAR
        ; 8A86: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; 8A89: 24 7F  and al, 0x7f
        AND          al, 127
        ; 8A8B: 0A C6  or al, dh
        OR           al, dh
        ; 8A8D: 26 88 05  mov byte ptr es:[di], al
        MOV          byte ptr es:[di], al
L_8A90 LABEL NEAR
        ; 8A90: 03 7E D4  add di, word ptr [bp - 0x2c]
        ADD          di, word ptr [bp - 44]
        ; 8A93: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; 8A96: 4B  dec bx
        DEC          bx
        ; 8A97: 7F C2  jg 0x8a5b
        JG SHORT L_8A5B
        ; 8A99: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; 8A9D: 7D AD  jge 0x8a4c
        JGE SHORT L_8A4C
        ; 8A9F: EB A3  jmp 0x8a44
        JMP SHORT L_8A44
L_8AA1 LABEL NEAR
        ; 8AA1: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; 8AA4: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; 8AA7: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; 8AAA: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; 8AAD: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_8AB0 LABEL NEAR
        ; 8AB0: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; 8AB3: 26 8A 35  mov dh, byte ptr es:[di]
        MOV          dh, byte ptr es:[di]
        ; 8AB6: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; 8AB9: 75 0E  jne 0x8ac9
        JNE SHORT L_8AC9
        ; 8ABB: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; 8ABE: D0 CE  ror dh, 1
        ROR          dh, 1
        ; 8AC0: D0 CE  ror dh, 1
        ROR          dh, 1
        ; 8AC2: 80 E6 C0  and dh, 0xc0
        AND          dh, 192
        ; 8AC5: 0B C9  or cx, cx
        OR           cx, cx
        ; 8AC7: 74 16  je 0x8adf
        JE SHORT L_8ADF
L_8AC9 LABEL NEAR
        ; 8AC9: 80 E6 C0  and dh, 0xc0
        AND          dh, 192
L_8ACC LABEL NEAR
        ; 8ACC: 32 E4  xor ah, ah
        XOR          ah, ah
        ; 8ACE: AC  lodsb al, byte ptr [si]
        LODSB
        ; 8ACF: D1 C8  ror ax, 1
        ROR          ax, 1
        ; 8AD1: D1 C8  ror ax, 1
        ROR          ax, 1
        ; 8AD3: 0A C6  or al, dh
        OR           al, dh
        ; 8AD5: 8A F4  mov dh, ah
        MOV          dh, ah
        ; 8AD7: AA  stosb byte ptr es:[di], al
        STOSB
        ; 8AD8: E2 F2  loop 0x8acc
        LOOP L_8ACC
        ; 8ADA: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; 8ADD: 74 0A  je 0x8ae9
        JE SHORT L_8AE9
L_8ADF LABEL NEAR
        ; 8ADF: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; 8AE2: 24 3F  and al, 0x3f
        AND          al, 63
        ; 8AE4: 0A C6  or al, dh
        OR           al, dh
        ; 8AE6: 26 88 05  mov byte ptr es:[di], al
        MOV          byte ptr es:[di], al
L_8AE9 LABEL NEAR
        ; 8AE9: 03 7E D4  add di, word ptr [bp - 0x2c]
        ADD          di, word ptr [bp - 44]
        ; 8AEC: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; 8AEF: 4B  dec bx
        DEC          bx
        ; 8AF0: 7F BE  jg 0x8ab0
        JG SHORT L_8AB0
        ; 8AF2: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; 8AF6: 7D A9  jge 0x8aa1
        JGE SHORT L_8AA1
        ; 8AF8: E9 49 FF  jmp 0x8a44
        JMP NEAR PTR L_8A44
L_8AFB LABEL NEAR
        ; 8AFB: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; 8AFE: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; 8B01: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; 8B04: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; 8B07: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_8B0A LABEL NEAR
        ; 8B0A: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; 8B0D: 26 8A 35  mov dh, byte ptr es:[di]
        MOV          dh, byte ptr es:[di]
        ; 8B10: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; 8B13: 75 10  jne 0x8b25
        JNE SHORT L_8B25
        ; 8B15: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; 8B18: D0 CE  ror dh, 1
        ROR          dh, 1
        ; 8B1A: D0 CE  ror dh, 1
        ROR          dh, 1
        ; 8B1C: D0 CE  ror dh, 1
        ROR          dh, 1
        ; 8B1E: 80 E6 E0  and dh, 0xe0
        AND          dh, 224
        ; 8B21: 0B C9  or cx, cx
        OR           cx, cx
        ; 8B23: 74 18  je 0x8b3d
        JE SHORT L_8B3D
L_8B25 LABEL NEAR
        ; 8B25: 80 E6 E0  and dh, 0xe0
        AND          dh, 224
L_8B28 LABEL NEAR
        ; 8B28: 32 E4  xor ah, ah
        XOR          ah, ah
        ; 8B2A: AC  lodsb al, byte ptr [si]
        LODSB
        ; 8B2B: D1 C8  ror ax, 1
        ROR          ax, 1
        ; 8B2D: D1 C8  ror ax, 1
        ROR          ax, 1
        ; 8B2F: D1 C8  ror ax, 1
        ROR          ax, 1
        ; 8B31: 0A C6  or al, dh
        OR           al, dh
        ; 8B33: 8A F4  mov dh, ah
        MOV          dh, ah
        ; 8B35: AA  stosb byte ptr es:[di], al
        STOSB
        ; 8B36: E2 F0  loop 0x8b28
        LOOP L_8B28
        ; 8B38: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; 8B3B: 74 0A  je 0x8b47
        JE SHORT L_8B47
L_8B3D LABEL NEAR
        ; 8B3D: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; 8B40: 24 1F  and al, 0x1f
        AND          al, 31
        ; 8B42: 0A C6  or al, dh
        OR           al, dh
        ; 8B44: 26 88 05  mov byte ptr es:[di], al
        MOV          byte ptr es:[di], al
L_8B47 LABEL NEAR
        ; 8B47: 03 7E D4  add di, word ptr [bp - 0x2c]
        ADD          di, word ptr [bp - 44]
        ; 8B4A: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; 8B4D: 4B  dec bx
        DEC          bx
        ; 8B4E: 7F BA  jg 0x8b0a
        JG SHORT L_8B0A
        ; 8B50: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; 8B54: 7D A5  jge 0x8afb
        JGE SHORT L_8AFB
        ; 8B56: E9 EB FE  jmp 0x8a44
        JMP NEAR PTR L_8A44
L_8B59 LABEL NEAR
        ; 8B59: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; 8B5C: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; 8B5F: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; 8B62: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; 8B65: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_8B68 LABEL NEAR
        ; 8B68: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; 8B6B: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; 8B6E: 75 12  jne 0x8b82
        JNE SHORT L_8B82
        ; 8B70: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; 8B73: D0 E6  shl dh, 1
        SHL          dh, 1
        ; 8B75: D0 E6  shl dh, 1
        SHL          dh, 1
        ; 8B77: D0 E6  shl dh, 1
        SHL          dh, 1
        ; 8B79: D0 E6  shl dh, 1
        SHL          dh, 1
        ; 8B7B: 0B C9  or cx, cx
        OR           cx, cx
        ; 8B7D: 74 20  je 0x8b9f
        JE SHORT L_8B9F
        ; 8B7F: EB 07  jmp 0x8b88
        JMP SHORT L_8B88
        ; 8B81: 90  nop
        NOP
L_8B82 LABEL NEAR
        ; 8B82: 26 8A 35  mov dh, byte ptr es:[di]
        MOV          dh, byte ptr es:[di]
        ; 8B85: 80 E6 F0  and dh, 0xf0
        AND          dh, 240
L_8B88 LABEL NEAR
        ; 8B88: 32 E4  xor ah, ah
        XOR          ah, ah
        ; 8B8A: AC  lodsb al, byte ptr [si]
        LODSB
        ; 8B8B: D1 C8  ror ax, 1
        ROR          ax, 1
        ; 8B8D: D1 C8  ror ax, 1
        ROR          ax, 1
        ; 8B8F: D1 C8  ror ax, 1
        ROR          ax, 1
        ; 8B91: D1 C8  ror ax, 1
        ROR          ax, 1
        ; 8B93: 0A C6  or al, dh
        OR           al, dh
        ; 8B95: 8A F4  mov dh, ah
        MOV          dh, ah
        ; 8B97: AA  stosb byte ptr es:[di], al
        STOSB
        ; 8B98: E2 EE  loop 0x8b88
        LOOP L_8B88
        ; 8B9A: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; 8B9D: 74 0A  je 0x8ba9
        JE SHORT L_8BA9
L_8B9F LABEL NEAR
        ; 8B9F: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; 8BA2: 24 0F  and al, 0xf
        AND          al, 15
        ; 8BA4: 0A C6  or al, dh
        OR           al, dh
        ; 8BA6: 26 88 05  mov byte ptr es:[di], al
        MOV          byte ptr es:[di], al
L_8BA9 LABEL NEAR
        ; 8BA9: 03 7E D4  add di, word ptr [bp - 0x2c]
        ADD          di, word ptr [bp - 44]
        ; 8BAC: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; 8BAF: 4B  dec bx
        DEC          bx
        ; 8BB0: 7F B6  jg 0x8b68
        JG SHORT L_8B68
        ; 8BB2: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; 8BB6: 7D A1  jge 0x8b59
        JGE SHORT L_8B59
        ; 8BB8: E9 89 FE  jmp 0x8a44
        JMP NEAR PTR L_8A44
L_8BBB LABEL NEAR
        ; 8BBB: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; 8BBE: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; 8BC1: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; 8BC4: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; 8BC7: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_8BCA LABEL NEAR
        ; 8BCA: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; 8BCD: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; 8BD0: 75 10  jne 0x8be2
        JNE SHORT L_8BE2
        ; 8BD2: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; 8BD5: D0 E6  shl dh, 1
        SHL          dh, 1
        ; 8BD7: D0 E6  shl dh, 1
        SHL          dh, 1
        ; 8BD9: D0 E6  shl dh, 1
        SHL          dh, 1
        ; 8BDB: 0B C9  or cx, cx
        OR           cx, cx
        ; 8BDD: 74 20  je 0x8bff
        JE SHORT L_8BFF
        ; 8BDF: EB 07  jmp 0x8be8
        JMP SHORT L_8BE8
        ; 8BE1: 90  nop
        NOP
L_8BE2 LABEL NEAR
        ; 8BE2: 26 8A 35  mov dh, byte ptr es:[di]
        MOV          dh, byte ptr es:[di]
        ; 8BE5: 80 E6 F8  and dh, 0xf8
        AND          dh, 248
L_8BE8 LABEL NEAR
        ; 8BE8: 32 E4  xor ah, ah
        XOR          ah, ah
        ; 8BEA: AC  lodsb al, byte ptr [si]
        LODSB
        ; 8BEB: D1 C0  rol ax, 1
        ROL          ax, 1
        ; 8BED: D1 C0  rol ax, 1
        ROL          ax, 1
        ; 8BEF: D1 C0  rol ax, 1
        ROL          ax, 1
        ; 8BF1: 86 C4  xchg ah, al
        XCHG         al, ah
        ; 8BF3: 0A C6  or al, dh
        OR           al, dh
        ; 8BF5: 8A F4  mov dh, ah
        MOV          dh, ah
        ; 8BF7: AA  stosb byte ptr es:[di], al
        STOSB
        ; 8BF8: E2 EE  loop 0x8be8
        LOOP L_8BE8
        ; 8BFA: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; 8BFD: 74 0A  je 0x8c09
        JE SHORT L_8C09
L_8BFF LABEL NEAR
        ; 8BFF: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; 8C02: 24 07  and al, 7
        AND          al, 7
        ; 8C04: 0A C6  or al, dh
        OR           al, dh
        ; 8C06: 26 88 05  mov byte ptr es:[di], al
        MOV          byte ptr es:[di], al
L_8C09 LABEL NEAR
        ; 8C09: 03 7E D4  add di, word ptr [bp - 0x2c]
        ADD          di, word ptr [bp - 44]
        ; 8C0C: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; 8C0F: 4B  dec bx
        DEC          bx
        ; 8C10: 7F B8  jg 0x8bca
        JG SHORT L_8BCA
        ; 8C12: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; 8C16: 7D A3  jge 0x8bbb
        JGE SHORT L_8BBB
        ; 8C18: E9 29 FE  jmp 0x8a44
        JMP NEAR PTR L_8A44
L_8C1B LABEL NEAR
        ; 8C1B: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; 8C1E: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; 8C21: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; 8C24: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; 8C27: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_8C2A LABEL NEAR
        ; 8C2A: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; 8C2D: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; 8C30: 75 0E  jne 0x8c40
        JNE SHORT L_8C40
        ; 8C32: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; 8C35: D0 E6  shl dh, 1
        SHL          dh, 1
        ; 8C37: D0 E6  shl dh, 1
        SHL          dh, 1
        ; 8C39: 0B C9  or cx, cx
        OR           cx, cx
        ; 8C3B: 74 1E  je 0x8c5b
        JE SHORT L_8C5B
        ; 8C3D: EB 07  jmp 0x8c46
        JMP SHORT L_8C46
        ; 8C3F: 90  nop
        NOP
L_8C40 LABEL NEAR
        ; 8C40: 26 8A 35  mov dh, byte ptr es:[di]
        MOV          dh, byte ptr es:[di]
        ; 8C43: 80 E6 FC  and dh, 0xfc
        AND          dh, 252
L_8C46 LABEL NEAR
        ; 8C46: 32 E4  xor ah, ah
        XOR          ah, ah
        ; 8C48: AC  lodsb al, byte ptr [si]
        LODSB
        ; 8C49: D1 C0  rol ax, 1
        ROL          ax, 1
        ; 8C4B: D1 C0  rol ax, 1
        ROL          ax, 1
        ; 8C4D: 86 C4  xchg ah, al
        XCHG         al, ah
        ; 8C4F: 0A C6  or al, dh
        OR           al, dh
        ; 8C51: 8A F4  mov dh, ah
        MOV          dh, ah
        ; 8C53: AA  stosb byte ptr es:[di], al
        STOSB
        ; 8C54: E2 F0  loop 0x8c46
        LOOP L_8C46
        ; 8C56: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; 8C59: 74 0A  je 0x8c65
        JE SHORT L_8C65
L_8C5B LABEL NEAR
        ; 8C5B: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; 8C5E: 24 03  and al, 3
        AND          al, 3
        ; 8C60: 0A C6  or al, dh
        OR           al, dh
        ; 8C62: 26 88 05  mov byte ptr es:[di], al
        MOV          byte ptr es:[di], al
L_8C65 LABEL NEAR
        ; 8C65: 03 7E D4  add di, word ptr [bp - 0x2c]
        ADD          di, word ptr [bp - 44]
        ; 8C68: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; 8C6B: 4B  dec bx
        DEC          bx
        ; 8C6C: 7F BC  jg 0x8c2a
        JG SHORT L_8C2A
        ; 8C6E: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; 8C72: 7D A7  jge 0x8c1b
        JGE SHORT L_8C1B
        ; 8C74: E9 CD FD  jmp 0x8a44
        JMP NEAR PTR L_8A44
L_8C77 LABEL NEAR
        ; 8C77: 8B 76 C6  mov si, word ptr [bp - 0x3a]
        MOV          si, word ptr [bp - 58]
        ; 8C7A: 8E 42 EA  mov es, word ptr [bp + si - 0x16]
        MOV          es, word ptr [bp + si - 22]
        ; 8C7D: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; 8C80: 8B 72 E2  mov si, word ptr [bp + si - 0x1e]
        MOV          si, word ptr [bp + si - 30]
        ; 8C83: 8B 5E F2  mov bx, word ptr [bp - 0xe]
        MOV          bx, word ptr [bp - 14]
L_8C86 LABEL NEAR
        ; 8C86: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; 8C89: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; 8C8C: 75 0C  jne 0x8c9a
        JNE SHORT L_8C9A
        ; 8C8E: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; 8C91: D0 E6  shl dh, 1
        SHL          dh, 1
        ; 8C93: 0B C9  or cx, cx
        OR           cx, cx
        ; 8C95: 74 1C  je 0x8cb3
        JE SHORT L_8CB3
        ; 8C97: EB 07  jmp 0x8ca0
        JMP SHORT L_8CA0
        ; 8C99: 90  nop
        NOP
L_8C9A LABEL NEAR
        ; 8C9A: 26 8A 35  mov dh, byte ptr es:[di]
        MOV          dh, byte ptr es:[di]
        ; 8C9D: 80 E6 FE  and dh, 0xfe
        AND          dh, 254
L_8CA0 LABEL NEAR
        ; 8CA0: 32 E4  xor ah, ah
        XOR          ah, ah
        ; 8CA2: AC  lodsb al, byte ptr [si]
        LODSB
        ; 8CA3: D1 C0  rol ax, 1
        ROL          ax, 1
        ; 8CA5: 86 C4  xchg ah, al
        XCHG         al, ah
        ; 8CA7: 0A C6  or al, dh
        OR           al, dh
        ; 8CA9: 8A F4  mov dh, ah
        MOV          dh, ah
        ; 8CAB: AA  stosb byte ptr es:[di], al
        STOSB
        ; 8CAC: E2 F2  loop 0x8ca0
        LOOP L_8CA0
        ; 8CAE: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; 8CB1: 74 0A  je 0x8cbd
        JE SHORT L_8CBD
L_8CB3 LABEL NEAR
        ; 8CB3: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; 8CB6: 24 01  and al, 1
        AND          al, 1
        ; 8CB8: 0A C6  or al, dh
        OR           al, dh
        ; 8CBA: 26 88 05  mov byte ptr es:[di], al
        MOV          byte ptr es:[di], al
L_8CBD LABEL NEAR
        ; 8CBD: 03 7E D4  add di, word ptr [bp - 0x2c]
        ADD          di, word ptr [bp - 44]
        ; 8CC0: 03 76 CA  add si, word ptr [bp - 0x36]
        ADD          si, word ptr [bp - 54]
        ; 8CC3: 4B  dec bx
        DEC          bx
        ; 8CC4: 7F C0  jg 0x8c86
        JG SHORT L_8C86
        ; 8CC6: 80 6E C6 02  sub byte ptr [bp - 0x3a], 2
        SUB          byte ptr [bp - 58], 2
        ; 8CCA: 7D AB  jge 0x8c77
        JGE SHORT L_8C77
        ; 8CCC: E9 75 FD  jmp 0x8a44
        JMP NEAR PTR L_8A44
        PUBLIC _cye_case_8CCF
_cye_case_8CCF LABEL NEAR
        ; 8CCF: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; 8CD2: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
        ; 8CD5: 80 7E BE 00  cmp byte ptr [bp - 0x42], 0
        CMP          byte ptr [bp - 66], 0
        ; 8CD9: 75 43  jne 0x8d1e
        JNE SHORT L_8D1E
L_8CDB LABEL NEAR
        ; 8CDB: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_8CDE LABEL NEAR
        ; 8CDE: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; 8CE1: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; 8CE4: B0 02  mov al, 2
        MOV          al, 2
        ; 8CE6: EE  out dx, al
        OUT          dx, al
        ; 8CE7: 42  inc dx
        INC          dx
        ; 8CE8: 8A C1  mov al, cl
        MOV          al, cl
        ; 8CEA: EE  out dx, al
        OUT          dx, al
        ; 8CEB: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; 8CEE: F3 A4  rep movsb byte ptr es:[di], byte ptr [si]
        REP MOVSB
        ; 8CF0: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; 8CF3: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; 8CF7: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; 8CFA: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; 8CFD: 72 DF  jb 0x8cde
        JB SHORT L_8CDE
        ; 8CFF: 2E 03 3E 9E 4E  add di, word ptr cs:[0x4e9e]
        ADD          di, word ptr cs:[20126]
        ; 8D04: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; 8D07: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; 8D0A: 7F CF  jg 0x8cdb
        JG SHORT L_8CDB
L_8D0C LABEL NEAR
        ; 8D0C: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; 8D0F: B0 03  mov al, 3
        MOV          al, 3
        ; 8D11: EE  out dx, al
        OUT          dx, al
        ; 8D12: 42  inc dx
        INC          dx
        ; 8D13: B0 00  mov al, 0
        MOV          al, 0
        ; 8D15: EE  out dx, al
        OUT          dx, al
        ; 8D16: 83 C4 44  add sp, 0x44
        ADD          sp, 68
        ; 8D19: 5F  pop di
        POP          di
        ; 8D1A: 5E  pop si
        POP          si
        ; 8D1B: 1F  pop ds
        POP          ds
        ; 8D1C: 5D  pop bp
        POP          bp
        ; 8D1D: CB  retf
        RETF
L_8D1E LABEL NEAR
        ; 8D1E: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_8D21 LABEL NEAR
        ; 8D21: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; 8D24: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; 8D27: B0 02  mov al, 2
        MOV          al, 2
        ; 8D29: EE  out dx, al
        OUT          dx, al
        ; 8D2A: 42  inc dx
        INC          dx
        ; 8D2B: 8A C1  mov al, cl
        MOV          al, cl
        ; 8D2D: EE  out dx, al
        OUT          dx, al
        ; 8D2E: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
L_8D31 LABEL NEAR
        ; 8D31: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; 8D34: A4  movsb byte ptr es:[di], byte ptr [si]
        MOVSB
        ; 8D35: E2 FA  loop 0x8d31
        LOOP L_8D31
        ; 8D37: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; 8D3A: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; 8D3E: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; 8D41: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; 8D44: 72 DB  jb 0x8d21
        JB SHORT L_8D21
        ; 8D46: 2E 03 3E 9E 4E  add di, word ptr cs:[0x4e9e]
        ADD          di, word ptr cs:[20126]
        ; 8D4B: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; 8D4E: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; 8D51: 7F CB  jg 0x8d1e
        JG SHORT L_8D1E
        ; 8D53: EB B7  jmp 0x8d0c
        JMP SHORT L_8D0C
L_8D55 LABEL NEAR
        ; 8D55: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; 8D58: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
L_8D5B LABEL NEAR
        ; 8D5B: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_8D5E LABEL NEAR
        ; 8D5E: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; 8D61: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; 8D64: B0 02  mov al, 2
        MOV          al, 2
        ; 8D66: EE  out dx, al
        OUT          dx, al
        ; 8D67: 42  inc dx
        INC          dx
        ; 8D68: 8A C1  mov al, cl
        MOV          al, cl
        ; 8D6A: EE  out dx, al
        OUT          dx, al
        ; 8D6B: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; 8D6E: B0 04  mov al, 4
        MOV          al, 4
        ; 8D70: EE  out dx, al
        OUT          dx, al
        ; 8D71: 42  inc dx
        INC          dx
        ; 8D72: 8A C5  mov al, ch
        MOV          al, ch
        ; 8D74: EE  out dx, al
        OUT          dx, al
        ; 8D75: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; 8D78: 26 8A 35  mov dh, byte ptr es:[di]
        MOV          dh, byte ptr es:[di]
        ; 8D7B: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; 8D7E: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; 8D81: 75 0C  jne 0x8d8f
        JNE SHORT L_8D8F
        ; 8D83: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; 8D86: D0 CE  ror dh, 1
        ROR          dh, 1
        ; 8D88: 80 E6 80  and dh, 0x80
        AND          dh, 128
        ; 8D8B: 0B C9  or cx, cx
        OR           cx, cx
        ; 8D8D: 74 17  je 0x8da6
        JE SHORT L_8DA6
L_8D8F LABEL NEAR
        ; 8D8F: 80 E6 80  and dh, 0x80
        AND          dh, 128
L_8D92 LABEL NEAR
        ; 8D92: 32 E4  xor ah, ah
        XOR          ah, ah
        ; 8D94: AC  lodsb al, byte ptr [si]
        LODSB
        ; 8D95: D1 C8  ror ax, 1
        ROR          ax, 1
        ; 8D97: 0A C6  or al, dh
        OR           al, dh
        ; 8D99: 8A F4  mov dh, ah
        MOV          dh, ah
        ; 8D9B: AA  stosb byte ptr es:[di], al
        STOSB
        ; 8D9C: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; 8D9F: E2 F1  loop 0x8d92
        LOOP L_8D92
        ; 8DA1: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; 8DA4: 74 0A  je 0x8db0
        JE SHORT L_8DB0
L_8DA6 LABEL NEAR
        ; 8DA6: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; 8DA9: 24 7F  and al, 0x7f
        AND          al, 127
        ; 8DAB: 0A C6  or al, dh
        OR           al, dh
        ; 8DAD: 26 88 05  mov byte ptr es:[di], al
        MOV          byte ptr es:[di], al
L_8DB0 LABEL NEAR
        ; 8DB0: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; 8DB3: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; 8DB7: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; 8DBA: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; 8DBD: 72 9F  jb 0x8d5e
        JB SHORT L_8D5E
        ; 8DBF: 2E 03 3E 9E 4E  add di, word ptr cs:[0x4e9e]
        ADD          di, word ptr cs:[20126]
        ; 8DC4: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; 8DC7: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; 8DCA: 7F 8F  jg 0x8d5b
        JG SHORT L_8D5B
        ; 8DCC: E9 3D FF  jmp 0x8d0c
        JMP NEAR PTR L_8D0C
L_8DCF LABEL NEAR
        ; 8DCF: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; 8DD2: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
L_8DD5 LABEL NEAR
        ; 8DD5: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_8DD8 LABEL NEAR
        ; 8DD8: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; 8DDB: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; 8DDE: B0 02  mov al, 2
        MOV          al, 2
        ; 8DE0: EE  out dx, al
        OUT          dx, al
        ; 8DE1: 42  inc dx
        INC          dx
        ; 8DE2: 8A C1  mov al, cl
        MOV          al, cl
        ; 8DE4: EE  out dx, al
        OUT          dx, al
        ; 8DE5: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; 8DE8: B0 04  mov al, 4
        MOV          al, 4
        ; 8DEA: EE  out dx, al
        OUT          dx, al
        ; 8DEB: 42  inc dx
        INC          dx
        ; 8DEC: 8A C5  mov al, ch
        MOV          al, ch
        ; 8DEE: EE  out dx, al
        OUT          dx, al
        ; 8DEF: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; 8DF2: 26 8A 35  mov dh, byte ptr es:[di]
        MOV          dh, byte ptr es:[di]
        ; 8DF5: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; 8DF8: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; 8DFB: 75 0E  jne 0x8e0b
        JNE SHORT L_8E0B
        ; 8DFD: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; 8E00: D0 CE  ror dh, 1
        ROR          dh, 1
        ; 8E02: D0 CE  ror dh, 1
        ROR          dh, 1
        ; 8E04: 80 E6 C0  and dh, 0xc0
        AND          dh, 192
        ; 8E07: 0B C9  or cx, cx
        OR           cx, cx
        ; 8E09: 74 19  je 0x8e24
        JE SHORT L_8E24
L_8E0B LABEL NEAR
        ; 8E0B: 80 E6 C0  and dh, 0xc0
        AND          dh, 192
L_8E0E LABEL NEAR
        ; 8E0E: 32 E4  xor ah, ah
        XOR          ah, ah
        ; 8E10: AC  lodsb al, byte ptr [si]
        LODSB
        ; 8E11: D1 C8  ror ax, 1
        ROR          ax, 1
        ; 8E13: D1 C8  ror ax, 1
        ROR          ax, 1
        ; 8E15: 0A C6  or al, dh
        OR           al, dh
        ; 8E17: 8A F4  mov dh, ah
        MOV          dh, ah
        ; 8E19: AA  stosb byte ptr es:[di], al
        STOSB
        ; 8E1A: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; 8E1D: E2 EF  loop 0x8e0e
        LOOP L_8E0E
        ; 8E1F: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; 8E22: 74 0A  je 0x8e2e
        JE SHORT L_8E2E
L_8E24 LABEL NEAR
        ; 8E24: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; 8E27: 24 3F  and al, 0x3f
        AND          al, 63
        ; 8E29: 0A C6  or al, dh
        OR           al, dh
        ; 8E2B: 26 88 05  mov byte ptr es:[di], al
        MOV          byte ptr es:[di], al
L_8E2E LABEL NEAR
        ; 8E2E: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; 8E31: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; 8E35: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; 8E38: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; 8E3B: 72 9B  jb 0x8dd8
        JB SHORT L_8DD8
        ; 8E3D: 2E 03 3E 9E 4E  add di, word ptr cs:[0x4e9e]
        ADD          di, word ptr cs:[20126]
        ; 8E42: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; 8E45: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; 8E48: 7F 8B  jg 0x8dd5
        JG SHORT L_8DD5
        ; 8E4A: E9 BF FE  jmp 0x8d0c
        JMP NEAR PTR L_8D0C
L_8E4D LABEL NEAR
        ; 8E4D: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; 8E50: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
L_8E53 LABEL NEAR
        ; 8E53: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_8E56 LABEL NEAR
        ; 8E56: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; 8E59: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; 8E5C: B0 02  mov al, 2
        MOV          al, 2
        ; 8E5E: EE  out dx, al
        OUT          dx, al
        ; 8E5F: 42  inc dx
        INC          dx
        ; 8E60: 8A C1  mov al, cl
        MOV          al, cl
        ; 8E62: EE  out dx, al
        OUT          dx, al
        ; 8E63: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; 8E66: B0 04  mov al, 4
        MOV          al, 4
        ; 8E68: EE  out dx, al
        OUT          dx, al
        ; 8E69: 42  inc dx
        INC          dx
        ; 8E6A: 8A C5  mov al, ch
        MOV          al, ch
        ; 8E6C: EE  out dx, al
        OUT          dx, al
        ; 8E6D: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; 8E70: 26 8A 35  mov dh, byte ptr es:[di]
        MOV          dh, byte ptr es:[di]
        ; 8E73: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; 8E76: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; 8E79: 75 10  jne 0x8e8b
        JNE SHORT L_8E8B
        ; 8E7B: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; 8E7E: D0 CE  ror dh, 1
        ROR          dh, 1
        ; 8E80: D0 CE  ror dh, 1
        ROR          dh, 1
        ; 8E82: D0 CE  ror dh, 1
        ROR          dh, 1
        ; 8E84: 80 E6 E0  and dh, 0xe0
        AND          dh, 224
        ; 8E87: 0B C9  or cx, cx
        OR           cx, cx
        ; 8E89: 74 1B  je 0x8ea6
        JE SHORT L_8EA6
L_8E8B LABEL NEAR
        ; 8E8B: 80 E6 E0  and dh, 0xe0
        AND          dh, 224
L_8E8E LABEL NEAR
        ; 8E8E: 32 E4  xor ah, ah
        XOR          ah, ah
        ; 8E90: AC  lodsb al, byte ptr [si]
        LODSB
        ; 8E91: D1 C8  ror ax, 1
        ROR          ax, 1
        ; 8E93: D1 C8  ror ax, 1
        ROR          ax, 1
        ; 8E95: D1 C8  ror ax, 1
        ROR          ax, 1
        ; 8E97: 0A C6  or al, dh
        OR           al, dh
        ; 8E99: 8A F4  mov dh, ah
        MOV          dh, ah
        ; 8E9B: AA  stosb byte ptr es:[di], al
        STOSB
        ; 8E9C: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; 8E9F: E2 ED  loop 0x8e8e
        LOOP L_8E8E
        ; 8EA1: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; 8EA4: 74 0A  je 0x8eb0
        JE SHORT L_8EB0
L_8EA6 LABEL NEAR
        ; 8EA6: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; 8EA9: 24 1F  and al, 0x1f
        AND          al, 31
        ; 8EAB: 0A C6  or al, dh
        OR           al, dh
        ; 8EAD: 26 88 05  mov byte ptr es:[di], al
        MOV          byte ptr es:[di], al
L_8EB0 LABEL NEAR
        ; 8EB0: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; 8EB3: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; 8EB7: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; 8EBA: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; 8EBD: 72 97  jb 0x8e56
        JB SHORT L_8E56
        ; 8EBF: 2E 03 3E 9E 4E  add di, word ptr cs:[0x4e9e]
        ADD          di, word ptr cs:[20126]
        ; 8EC4: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; 8EC7: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; 8ECA: 7F 87  jg 0x8e53
        JG SHORT L_8E53
        ; 8ECC: E9 3D FE  jmp 0x8d0c
        JMP NEAR PTR L_8D0C
L_8ECF LABEL NEAR
        ; 8ECF: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; 8ED2: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
L_8ED5 LABEL NEAR
        ; 8ED5: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_8ED8 LABEL NEAR
        ; 8ED8: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; 8EDB: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; 8EDE: B0 02  mov al, 2
        MOV          al, 2
        ; 8EE0: EE  out dx, al
        OUT          dx, al
        ; 8EE1: 42  inc dx
        INC          dx
        ; 8EE2: 8A C1  mov al, cl
        MOV          al, cl
        ; 8EE4: EE  out dx, al
        OUT          dx, al
        ; 8EE5: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; 8EE8: B0 04  mov al, 4
        MOV          al, 4
        ; 8EEA: EE  out dx, al
        OUT          dx, al
        ; 8EEB: 42  inc dx
        INC          dx
        ; 8EEC: 8A C5  mov al, ch
        MOV          al, ch
        ; 8EEE: EE  out dx, al
        OUT          dx, al
        ; 8EEF: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; 8EF2: 26 8A 35  mov dh, byte ptr es:[di]
        MOV          dh, byte ptr es:[di]
        ; 8EF5: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; 8EF8: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; 8EFB: 75 0F  jne 0x8f0c
        JNE SHORT L_8F0C
        ; 8EFD: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; 8F00: D0 E6  shl dh, 1
        SHL          dh, 1
        ; 8F02: D0 E6  shl dh, 1
        SHL          dh, 1
        ; 8F04: D0 E6  shl dh, 1
        SHL          dh, 1
        ; 8F06: D0 E6  shl dh, 1
        SHL          dh, 1
        ; 8F08: 0B C9  or cx, cx
        OR           cx, cx
        ; 8F0A: 74 1D  je 0x8f29
        JE SHORT L_8F29
L_8F0C LABEL NEAR
        ; 8F0C: 80 E6 F0  and dh, 0xf0
        AND          dh, 240
L_8F0F LABEL NEAR
        ; 8F0F: 32 E4  xor ah, ah
        XOR          ah, ah
        ; 8F11: AC  lodsb al, byte ptr [si]
        LODSB
        ; 8F12: D1 C8  ror ax, 1
        ROR          ax, 1
        ; 8F14: D1 C8  ror ax, 1
        ROR          ax, 1
        ; 8F16: D1 C8  ror ax, 1
        ROR          ax, 1
        ; 8F18: D1 C8  ror ax, 1
        ROR          ax, 1
        ; 8F1A: 0A C6  or al, dh
        OR           al, dh
        ; 8F1C: 8A F4  mov dh, ah
        MOV          dh, ah
        ; 8F1E: AA  stosb byte ptr es:[di], al
        STOSB
        ; 8F1F: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; 8F22: E2 EB  loop 0x8f0f
        LOOP L_8F0F
        ; 8F24: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; 8F27: 74 0A  je 0x8f33
        JE SHORT L_8F33
L_8F29 LABEL NEAR
        ; 8F29: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; 8F2C: 24 0F  and al, 0xf
        AND          al, 15
        ; 8F2E: 0A C6  or al, dh
        OR           al, dh
        ; 8F30: 26 88 05  mov byte ptr es:[di], al
        MOV          byte ptr es:[di], al
L_8F33 LABEL NEAR
        ; 8F33: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; 8F36: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; 8F3A: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; 8F3D: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; 8F40: 72 96  jb 0x8ed8
        JB SHORT L_8ED8
        ; 8F42: 2E 03 3E 9E 4E  add di, word ptr cs:[0x4e9e]
        ADD          di, word ptr cs:[20126]
        ; 8F47: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; 8F4A: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; 8F4D: 7F 86  jg 0x8ed5
        JG SHORT L_8ED5
        ; 8F4F: E9 BA FD  jmp 0x8d0c
        JMP NEAR PTR L_8D0C
L_8F52 LABEL NEAR
        ; 8F52: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; 8F55: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
L_8F58 LABEL NEAR
        ; 8F58: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_8F5B LABEL NEAR
        ; 8F5B: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; 8F5E: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; 8F61: B0 02  mov al, 2
        MOV          al, 2
        ; 8F63: EE  out dx, al
        OUT          dx, al
        ; 8F64: 42  inc dx
        INC          dx
        ; 8F65: 8A C1  mov al, cl
        MOV          al, cl
        ; 8F67: EE  out dx, al
        OUT          dx, al
        ; 8F68: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; 8F6B: B0 04  mov al, 4
        MOV          al, 4
        ; 8F6D: EE  out dx, al
        OUT          dx, al
        ; 8F6E: 42  inc dx
        INC          dx
        ; 8F6F: 8A C5  mov al, ch
        MOV          al, ch
        ; 8F71: EE  out dx, al
        OUT          dx, al
        ; 8F72: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; 8F75: 26 8A 35  mov dh, byte ptr es:[di]
        MOV          dh, byte ptr es:[di]
        ; 8F78: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; 8F7B: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; 8F7E: 75 0D  jne 0x8f8d
        JNE SHORT L_8F8D
        ; 8F80: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; 8F83: D0 E6  shl dh, 1
        SHL          dh, 1
        ; 8F85: D0 E6  shl dh, 1
        SHL          dh, 1
        ; 8F87: D0 E6  shl dh, 1
        SHL          dh, 1
        ; 8F89: 0B C9  or cx, cx
        OR           cx, cx
        ; 8F8B: 74 1D  je 0x8faa
        JE SHORT L_8FAA
L_8F8D LABEL NEAR
        ; 8F8D: 80 E6 F8  and dh, 0xf8
        AND          dh, 248
L_8F90 LABEL NEAR
        ; 8F90: 32 E4  xor ah, ah
        XOR          ah, ah
        ; 8F92: AC  lodsb al, byte ptr [si]
        LODSB
        ; 8F93: D1 C0  rol ax, 1
        ROL          ax, 1
        ; 8F95: D1 C0  rol ax, 1
        ROL          ax, 1
        ; 8F97: D1 C0  rol ax, 1
        ROL          ax, 1
        ; 8F99: 86 C4  xchg ah, al
        XCHG         al, ah
        ; 8F9B: 0A C6  or al, dh
        OR           al, dh
        ; 8F9D: 8A F4  mov dh, ah
        MOV          dh, ah
        ; 8F9F: AA  stosb byte ptr es:[di], al
        STOSB
        ; 8FA0: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; 8FA3: E2 EB  loop 0x8f90
        LOOP L_8F90
        ; 8FA5: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; 8FA8: 74 0A  je 0x8fb4
        JE SHORT L_8FB4
L_8FAA LABEL NEAR
        ; 8FAA: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; 8FAD: 24 07  and al, 7
        AND          al, 7
        ; 8FAF: 0A C6  or al, dh
        OR           al, dh
        ; 8FB1: 26 88 05  mov byte ptr es:[di], al
        MOV          byte ptr es:[di], al
L_8FB4 LABEL NEAR
        ; 8FB4: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; 8FB7: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; 8FBB: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; 8FBE: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; 8FC1: 72 98  jb 0x8f5b
        JB SHORT L_8F5B
        ; 8FC3: 2E 03 3E 9E 4E  add di, word ptr cs:[0x4e9e]
        ADD          di, word ptr cs:[20126]
        ; 8FC8: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; 8FCB: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; 8FCE: 7F 88  jg 0x8f58
        JG SHORT L_8F58
        ; 8FD0: E9 39 FD  jmp 0x8d0c
        JMP NEAR PTR L_8D0C
L_8FD3 LABEL NEAR
        ; 8FD3: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; 8FD6: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
L_8FD9 LABEL NEAR
        ; 8FD9: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_8FDC LABEL NEAR
        ; 8FDC: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; 8FDF: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; 8FE2: B0 02  mov al, 2
        MOV          al, 2
        ; 8FE4: EE  out dx, al
        OUT          dx, al
        ; 8FE5: 42  inc dx
        INC          dx
        ; 8FE6: 8A C1  mov al, cl
        MOV          al, cl
        ; 8FE8: EE  out dx, al
        OUT          dx, al
        ; 8FE9: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; 8FEC: B0 04  mov al, 4
        MOV          al, 4
        ; 8FEE: EE  out dx, al
        OUT          dx, al
        ; 8FEF: 42  inc dx
        INC          dx
        ; 8FF0: 8A C5  mov al, ch
        MOV          al, ch
        ; 8FF2: EE  out dx, al
        OUT          dx, al
        ; 8FF3: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; 8FF6: 26 8A 35  mov dh, byte ptr es:[di]
        MOV          dh, byte ptr es:[di]
        ; 8FF9: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; 8FFC: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; 8FFF: 75 0B  jne 0x900c
        JNE SHORT L_900C
        ; 9001: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; 9004: D0 E6  shl dh, 1
        SHL          dh, 1
        ; 9006: D0 E6  shl dh, 1
        SHL          dh, 1
        ; 9008: 0B C9  or cx, cx
        OR           cx, cx
        ; 900A: 74 1B  je 0x9027
        JE SHORT L_9027
L_900C LABEL NEAR
        ; 900C: 80 E6 FC  and dh, 0xfc
        AND          dh, 252
L_900F LABEL NEAR
        ; 900F: 32 E4  xor ah, ah
        XOR          ah, ah
        ; 9011: AC  lodsb al, byte ptr [si]
        LODSB
        ; 9012: D1 C0  rol ax, 1
        ROL          ax, 1
        ; 9014: D1 C0  rol ax, 1
        ROL          ax, 1
        ; 9016: 86 C4  xchg ah, al
        XCHG         al, ah
        ; 9018: 0A C6  or al, dh
        OR           al, dh
        ; 901A: 8A F4  mov dh, ah
        MOV          dh, ah
        ; 901C: AA  stosb byte ptr es:[di], al
        STOSB
        ; 901D: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; 9020: E2 ED  loop 0x900f
        LOOP L_900F
        ; 9022: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; 9025: 74 0A  je 0x9031
        JE SHORT L_9031
L_9027 LABEL NEAR
        ; 9027: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; 902A: 24 03  and al, 3
        AND          al, 3
        ; 902C: 0A C6  or al, dh
        OR           al, dh
        ; 902E: 26 88 05  mov byte ptr es:[di], al
        MOV          byte ptr es:[di], al
L_9031 LABEL NEAR
        ; 9031: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; 9034: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; 9038: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; 903B: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; 903E: 72 9C  jb 0x8fdc
        JB SHORT L_8FDC
        ; 9040: 2E 03 3E 9E 4E  add di, word ptr cs:[0x4e9e]
        ADD          di, word ptr cs:[20126]
        ; 9045: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; 9048: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; 904B: 7F 8C  jg 0x8fd9
        JG SHORT L_8FD9
        ; 904D: E9 BC FC  jmp 0x8d0c
        JMP NEAR PTR L_8D0C
L_9050 LABEL NEAR
        ; 9050: 8B 76 D8  mov si, word ptr [bp - 0x28]
        MOV          si, word ptr [bp - 40]
        ; 9053: 8B 7E D6  mov di, word ptr [bp - 0x2a]
        MOV          di, word ptr [bp - 42]
L_9056 LABEL NEAR
        ; 9056: 8D 5E DA  lea bx, [bp - 0x26]
        LEA          bx, [bp - 38]
L_9059 LABEL NEAR
        ; 9059: 36 8B 0F  mov cx, word ptr ss:[bx]
        MOV          cx, word ptr ss:[bx]
        ; 905C: BA C4 03  mov dx, 0x3c4
        MOV          dx, 964
        ; 905F: B0 02  mov al, 2
        MOV          al, 2
        ; 9061: EE  out dx, al
        OUT          dx, al
        ; 9062: 42  inc dx
        INC          dx
        ; 9063: 8A C1  mov al, cl
        MOV          al, cl
        ; 9065: EE  out dx, al
        OUT          dx, al
        ; 9066: BA CE 03  mov dx, 0x3ce
        MOV          dx, 974
        ; 9069: B0 04  mov al, 4
        MOV          al, 4
        ; 906B: EE  out dx, al
        OUT          dx, al
        ; 906C: 42  inc dx
        INC          dx
        ; 906D: 8A C5  mov al, ch
        MOV          al, ch
        ; 906F: EE  out dx, al
        OUT          dx, al
        ; 9070: 8B 4E F4  mov cx, word ptr [bp - 0xc]
        MOV          cx, word ptr [bp - 12]
        ; 9073: 26 8A 35  mov dh, byte ptr es:[di]
        MOV          dh, byte ptr es:[di]
        ; 9076: 8A 56 C2  mov dl, byte ptr [bp - 0x3e]
        MOV          dl, byte ptr [bp - 62]
        ; 9079: F6 C2 02  test dl, 2
        TEST         dl, 2
        ; 907C: 75 09  jne 0x9087
        JNE SHORT L_9087
        ; 907E: 8A 74 FF  mov dh, byte ptr [si - 1]
        MOV          dh, byte ptr [si - 1]
        ; 9081: D0 E6  shl dh, 1
        SHL          dh, 1
        ; 9083: 0B C9  or cx, cx
        OR           cx, cx
        ; 9085: 74 19  je 0x90a0
        JE SHORT L_90A0
L_9087 LABEL NEAR
        ; 9087: 80 E6 FE  and dh, 0xfe
        AND          dh, 254
L_908A LABEL NEAR
        ; 908A: 32 E4  xor ah, ah
        XOR          ah, ah
        ; 908C: AC  lodsb al, byte ptr [si]
        LODSB
        ; 908D: D1 C0  rol ax, 1
        ROL          ax, 1
        ; 908F: 86 C4  xchg ah, al
        XCHG         al, ah
        ; 9091: 0A C6  or al, dh
        OR           al, dh
        ; 9093: 8A F4  mov dh, ah
        MOV          dh, ah
        ; 9095: AA  stosb byte ptr es:[di], al
        STOSB
        ; 9096: 26 8A 25  mov ah, byte ptr es:[di]
        MOV          ah, byte ptr es:[di]
        ; 9099: E2 EF  loop 0x908a
        LOOP L_908A
        ; 909B: F6 C2 01  test dl, 1
        TEST         dl, 1
        ; 909E: 74 0A  je 0x90aa
        JE SHORT L_90AA
L_90A0 LABEL NEAR
        ; 90A0: 26 8A 05  mov al, byte ptr es:[di]
        MOV          al, byte ptr es:[di]
        ; 90A3: 24 01  and al, 1
        AND          al, 1
        ; 90A5: 0A C6  or al, dh
        OR           al, dh
        ; 90A7: 26 88 05  mov byte ptr es:[di], al
        MOV          byte ptr es:[di], al
L_90AA LABEL NEAR
        ; 90AA: 2B 7E F4  sub di, word ptr [bp - 0xc]
        SUB          di, word ptr [bp - 12]
        ; 90AD: 36 03 77 08  add si, word ptr ss:[bx + 8]
        ADD          si, word ptr ss:[bx + 8]
        ; 90B1: 83 C3 02  add bx, 2
        ADD          bx, 2
        ; 90B4: 3B 5E C4  cmp bx, word ptr [bp - 0x3c]
        CMP          bx, word ptr [bp - 60]
        ; 90B7: 72 A0  jb 0x9059
        JB SHORT L_9059
        ; 90B9: 2E 03 3E 9E 4E  add di, word ptr cs:[0x4e9e]
        ADD          di, word ptr cs:[20126]
        ; 90BE: 2B 76 CE  sub si, word ptr [bp - 0x32]
        SUB          si, word ptr [bp - 50]
        ; 90C1: FF 4E F2  dec word ptr [bp - 0xe]
        DEC          word ptr [bp - 14]
        ; 90C4: 7F 90  jg 0x9056
        JG SHORT L_9056
        ; 90C6: E9 43 FC  jmp 0x8d0c
        JMP NEAR PTR L_8D0C
EGARASTER_TEXT ENDS
        END
