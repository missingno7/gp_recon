.8086
EXTRN _FN_CYCLES_CGA_05710:FAR
EXTRN _fn_cycles_tandy_078fc:FAR
EXTRN _fn_cycles_tandy_0790b:FAR
EXTRN _fn_cycles_tandy_0a3be:FAR
EXTRN _polygon_scan_convert:FAR
EXTRN _g_cga_a4f6:BYTE
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        db 5C18h dup (0)
        PUBLIC _fn_cycles_tandy_0b168
_fn_cycles_tandy_0b168 PROC FAR
L_0B168:
        push bp
L_0B169:
        mov bp, sp
L_0B16B:
        sub sp, 1Eh
L_0B16E:
        push si
L_0B16F:
        push di
L_0B170:
        lea si, [bp + 0Ah]
L_0B173:
        mov word ptr [bp - 2], si
L_0B176:
        mov cx, word ptr [bp + 8]
L_0B179:
        mov ax, 12h
L_0B17C:
        mul cx
L_0B17E:
        mov dx, cx
L_0B180:
        shl dx, 1
L_0B182:
        shl dx, 1
L_0B184:
        shl dx, 1
L_0B186:
        shl dx, 1
L_0B188:
        mov word ptr [bp - 1Ch], ax
L_0B18B:
        sub sp, ax
L_0B18D:
        mov ax, cx
L_0B18F:
        dec ax
L_0B190:
        shl ax, 1
L_0B192:
        shl ax, 1
L_0B194:
        add ax, si
L_0B196:
        mov word ptr [bp - 4], ax
L_0B199:
        mov ax, word ptr [si + 2]
L_0B19C:
        mov word ptr [bp - 6], ax
L_0B19F:
        mov word ptr [bp - 0Ah], ax
L_0B1A2:
        mov word ptr [bp - 8], si
L_0B1A5:
        mov word ptr [bp - 0Ch], si
L_0B1A8:
        add si, 4
L_0B1AB:
        mov dx, 1
L_0B1AE:
        dec cx
L_0B1AF:
        jne SHORT L_0B1B4
L_0B1B1:
        jmp NEAR PTR L_0B28E
L_0B1B4:
        mov ax, word ptr [si + 2]
L_0B1B7:
        cmp ax, word ptr [bp - 6]
L_0B1BA:
        jg SHORT L_0B1CC
L_0B1BC:
        jne SHORT L_0B1C2
L_0B1BE:
        or dx, dx
L_0B1C0:
        jne SHORT L_0B1CE
L_0B1C2:
        mov word ptr [bp - 6], ax
L_0B1C5:
        mov word ptr [bp - 8], si
L_0B1C8:
        inc dx
L_0B1C9:
        jmp SHORT L_0B1CE
L_0B1CB:
        nop
L_0B1CC:
        xor dx, dx
L_0B1CE:
        cmp ax, word ptr [bp - 0Ah]
L_0B1D1:
        jle SHORT L_0B1D9
L_0B1D3:
        mov word ptr [bp - 0Ah], ax
L_0B1D6:
        mov word ptr [bp - 0Ch], si
L_0B1D9:
        add si, 4
L_0B1DC:
        loop L_0B1B4
L_0B1DE:
        mov ax, word ptr [bp - 6]
L_0B1E1:
        cmp ax, word ptr [bp - 0Ah]
L_0B1E4:
        jne SHORT L_0B222
L_0B1E6:
        mov cx, word ptr [bp + 8]
L_0B1E9:
        lea si, [bp + 0Ah]
L_0B1EC:
        mov bx, word ptr [si]
L_0B1EE:
        mov dx, bx
L_0B1F0:
        dec cx
L_0B1F1:
        add si, 4
L_0B1F4:
        mov ax, word ptr [si]
L_0B1F6:
        cmp ax, bx
L_0B1F8:
        jge SHORT L_0B1FC
L_0B1FA:
        mov bx, ax
L_0B1FC:
        cmp ax, dx
L_0B1FE:
        jle SHORT L_0B202
L_0B200:
        mov dx, ax
L_0B202:
        loop L_0B1F1
L_0B204:
        push word ptr [bp + 6]
L_0B207:
        lea si, [bp + 0Ah]
L_0B20A:
        mov ax, word ptr [si + 2]
L_0B20D:
        push ax
L_0B20E:
        push dx
L_0B20F:
        push ax
L_0B210:
        push bx
L_0B211:
        call FAR PTR _FN_CYCLES_CGA_05710
L_0B216:
        add sp, 0Ah
L_0B219:
        add sp, word ptr [bp - 1Ch]
L_0B21C:
        pop di
L_0B21D:
        pop si
L_0B21E:
        mov sp, bp
L_0B220:
        pop bp
L_0B221:
        retf
L_0B222:
        lea di, [bp - 1Eh]
L_0B225:
        sub di, word ptr [bp - 1Ch]
L_0B228:
        sub di, 4
L_0B22B:
        mov word ptr [bp - 0Eh], di
L_0B22E:
        mov byte ptr [bp - 1Ah], 0
L_0B232:
        mov word ptr [bp - 10h], 0
L_0B237:
        mov si, word ptr [bp - 8]
L_0B23A:
        cmp si, word ptr [bp - 0Ch]
L_0B23D:
        je SHORT L_0B288
L_0B23F:
        push di
L_0B240:
        push word ptr [si + 2]
L_0B243:
        push word ptr [si]
L_0B245:
        add si, 4
L_0B248:
        cmp si, word ptr [bp - 4]
L_0B24B:
        jle SHORT L_0B250
L_0B24D:
        mov si, word ptr [bp - 2]
L_0B250:
        push word ptr [si + 2]
L_0B253:
        push word ptr [si]
L_0B255:
        cmp byte ptr [bp - 1Ah], 0
L_0B259:
        jne SHORT L_0B27B
L_0B25B:
        call FAR PTR _fn_cycles_tandy_078fc
L_0B260:
        cmp byte ptr [di + 0Eh], 8
L_0B264:
        je SHORT L_0B276
L_0B266:
        mov byte ptr [bp - 1Ah], 1
L_0B26A:
        mov word ptr [bp - 0Eh], di
L_0B26D:
        inc word ptr [bp - 10h]
L_0B270:
        mov word ptr [bp - 16h], di
L_0B273:
        add di, 12h
L_0B276:
        add sp, 0Ah
L_0B279:
        jmp SHORT L_0B23A
L_0B27B:
        call FAR PTR _fn_cycles_tandy_0790b
L_0B280:
        cmp byte ptr [di + 0Eh], 8
L_0B284:
        jne SHORT L_0B26D
L_0B286:
        jmp SHORT L_0B276
L_0B288:
        cmp byte ptr [bp - 1Ah], 0
L_0B28C:
        jne SHORT L_0B2AA
L_0B28E:
        push word ptr [bp + 6]
L_0B291:
        lea si, [bp + 0Ah]
L_0B294:
        push word ptr [si + 2]
L_0B297:
        push word ptr [si]
L_0B299:
        call FAR PTR _fn_cycles_tandy_0a3be
L_0B29E:
        add sp, 6
L_0B2A1:
        add sp, word ptr [bp - 1Ch]
L_0B2A4:
        pop di
L_0B2A5:
        pop si
L_0B2A6:
        mov sp, bp
L_0B2A8:
        pop bp
L_0B2A9:
        retf
L_0B2AA:
        mov word ptr [bp - 12h], di
L_0B2AD:
        mov word ptr [bp - 14h], 0
L_0B2B2:
        mov byte ptr [bp - 1Ah], 0
L_0B2B6:
        mov si, word ptr [bp - 8]
L_0B2B9:
        cmp si, word ptr [bp - 0Ch]
L_0B2BC:
        je SHORT L_0B307
L_0B2BE:
        push di
L_0B2BF:
        push word ptr [si + 2]
L_0B2C2:
        push word ptr [si]
L_0B2C4:
        sub si, 4
L_0B2C7:
        cmp si, word ptr [bp - 2]
L_0B2CA:
        jge SHORT L_0B2CF
L_0B2CC:
        mov si, word ptr [bp - 4]
L_0B2CF:
        push word ptr [si + 2]
L_0B2D2:
        push word ptr [si]
L_0B2D4:
        cmp byte ptr [bp - 1Ah], 0
L_0B2D8:
        jne SHORT L_0B2FA
L_0B2DA:
        call FAR PTR _fn_cycles_tandy_078fc
L_0B2DF:
        cmp byte ptr [di + 0Eh], 8
L_0B2E3:
        je SHORT L_0B2F5
L_0B2E5:
        mov byte ptr [bp - 1Ah], 1
L_0B2E9:
        mov word ptr [bp - 12h], di
L_0B2EC:
        inc word ptr [bp - 14h]
L_0B2EF:
        mov word ptr [bp - 18h], di
L_0B2F2:
        add di, 12h
L_0B2F5:
        add sp, 0Ah
L_0B2F8:
        jmp SHORT L_0B2B9
L_0B2FA:
        call FAR PTR _fn_cycles_tandy_0790b
L_0B2FF:
        cmp byte ptr [di + 0Eh], 8
L_0B303:
        jne SHORT L_0B2EC
L_0B305:
        jmp SHORT L_0B2F5
L_0B307:
        cmp byte ptr [bp - 1Ah], 0
L_0B30B:
        je SHORT L_0B28E
L_0B30D:
        mov di, word ptr [bp - 0Eh]
L_0B310:
        mov dl, byte ptr [di + 0Eh]
L_0B313:
        xor dh, dh
L_0B315:
        mov si, word ptr [bp - 12h]
L_0B318:
        or dx, dx
L_0B31A:
        je SHORT L_0B33B
L_0B31C:
        mov bl, byte ptr [si + 0Eh]
L_0B31F:
        and bl, 7
L_0B322:
        xor bh, bh
L_0B324:
        shl bx, 1
L_0B326:
        jmp word ptr cs:[bx + L_SWITCH_TABLE]
L_SWITCH_TABLE LABEL WORD
        DW OFFSET L_0B33B
        DW OFFSET L_0B362
        DW OFFSET L_0B374
        DW OFFSET L_0B384
        DW OFFSET L_0B391
        DW OFFSET L_0B3AA
        DW OFFSET L_0B3C4
        DW OFFSET L_0B3DE
L_0B33B:
        test byte ptr [di + 10h], 80h
L_0B33F:
        jne SHORT L_0B35F
L_0B341:
        mov ax, word ptr [bp - 10h]
L_0B344:
        mov dx, word ptr [bp - 14h]
L_0B347:
        mov word ptr [bp - 10h], dx
L_0B34A:
        mov word ptr [bp - 14h], ax
L_0B34D:
        mov ax, word ptr [bp - 16h]
L_0B350:
        mov dx, word ptr [bp - 18h]
L_0B353:
        mov word ptr [bp - 16h], dx
L_0B356:
        mov word ptr [bp - 18h], ax
L_0B359:
        mov word ptr [bp - 0Eh], si
L_0B35C:
        mov word ptr [bp - 12h], di
L_0B35F:
        jmp NEAR PTR L_0B41C
L_0B362:
        cmp dx, 1
L_0B365:
        je SHORT L_0B381
L_0B367:
        mov bx, dx
L_0B369:
        mov al, byte ptr [bx + _g_cga_a4f6]
L_0B36D:
        or al, al
L_0B36F:
        jne SHORT L_0B341
L_0B371:
        jmp NEAR PTR L_0B41C
L_0B374:
        cmp dx, 2
L_0B377:
        je SHORT L_0B381
L_0B379:
        mov bx, dx
L_0B37B:
        mov al, byte ptr [bx + _g_cga_a4f6 + 8]
L_0B37F:
        jmp SHORT L_0B36D
L_0B381:
        jmp SHORT L_0B3F8
L_0B383:
        nop
L_0B384:
        cmp dx, 3
L_0B387:
        je SHORT L_0B3F8
L_0B389:
        mov bx, dx
L_0B38B:
        mov al, byte ptr [bx + _g_cga_a4f6 + 16]
L_0B38F:
        jmp SHORT L_0B36D
L_0B391:
        cmp dx, 4
L_0B394:
        je SHORT L_0B39E
L_0B396:
        mov bx, dx
L_0B398:
        mov al, byte ptr [bx + _g_cga_a4f6 + 24]
L_0B39C:
        jmp SHORT L_0B36D
L_0B39E:
        mov ax, word ptr [si + 8]
L_0B3A1:
        cmp ax, word ptr [di + 8]
L_0B3A4:
        je SHORT L_0B3F8
L_0B3A6:
        ja SHORT L_0B41C
L_0B3A8:
        jmp SHORT L_0B341
L_0B3AA:
        cmp dx, 5
L_0B3AD:
        je SHORT L_0B3B7
L_0B3AF:
        mov bx, dx
L_0B3B1:
        mov al, byte ptr [bx + _g_cga_a4f6 + 32]
L_0B3B5:
        jmp SHORT L_0B36D
L_0B3B7:
        mov ax, word ptr [si + 8]
L_0B3BA:
        cmp ax, word ptr [di + 8]
L_0B3BD:
        je SHORT L_0B3F8
L_0B3BF:
        jb SHORT L_0B41C
L_0B3C1:
        jmp NEAR PTR L_0B341
L_0B3C4:
        cmp dx, 6
L_0B3C7:
        je SHORT L_0B3D1
L_0B3C9:
        mov bx, dx
L_0B3CB:
        mov al, byte ptr [bx + _g_cga_a4f6 + 40]
L_0B3CF:
        jmp SHORT L_0B36D
L_0B3D1:
        mov ax, word ptr [si + 8]
L_0B3D4:
        cmp ax, word ptr [di + 8]
L_0B3D7:
        je SHORT L_0B3F8
L_0B3D9:
        jb SHORT L_0B41C
L_0B3DB:
        jmp NEAR PTR L_0B341
L_0B3DE:
        cmp dx, 7
L_0B3E1:
        je SHORT L_0B3EB
L_0B3E3:
        mov bx, dx
L_0B3E5:
        mov al, byte ptr [bx + _g_cga_a4f6 + 48]
L_0B3E9:
        jmp SHORT L_0B36D
L_0B3EB:
        mov ax, word ptr [si + 8]
L_0B3EE:
        cmp ax, word ptr [di + 8]
L_0B3F1:
        je SHORT L_0B3F8
L_0B3F3:
        ja SHORT L_0B41C
L_0B3F5:
        jmp NEAR PTR L_0B341
L_0B3F8:
        push word ptr [bp + 6]
L_0B3FB:
        mov si, word ptr [bp - 8]
L_0B3FE:
        push word ptr [si + 2]
L_0B401:
        push word ptr [si]
L_0B403:
        mov si, word ptr [bp - 0Ch]
L_0B406:
        push word ptr [si + 2]
L_0B409:
        push word ptr [si]
L_0B40B:
        call FAR PTR _FN_CYCLES_CGA_05710
L_0B410:
        add sp, 0Ah
L_0B413:
        add sp, word ptr [bp - 1Ch]
L_0B416:
        pop di
L_0B417:
        pop si
L_0B418:
        mov sp, bp
L_0B41A:
        pop bp
L_0B41B:
        retf
L_0B41C:
        mov si, word ptr [bp - 12h]
L_0B41F:
        cmp byte ptr [si + 0Eh], 0
L_0B423:
        jne SHORT L_0B431
L_0B425:
        mov al, byte ptr [si + 10h]
L_0B428:
        mov ah, byte ptr [si + 11h]
L_0B42B:
        mov byte ptr [si + 10h], ah
L_0B42E:
        mov byte ptr [si + 11h], al
L_0B431:
        mov si, word ptr [bp - 16h]
L_0B434:
        cmp byte ptr [si + 0Eh], 0
L_0B438:
        jne SHORT L_0B446
L_0B43A:
        mov al, byte ptr [si + 10h]
L_0B43D:
        mov ah, byte ptr [si + 11h]
L_0B440:
        mov byte ptr [si + 10h], ah
L_0B443:
        mov byte ptr [si + 11h], al
L_0B446:
        xor ax, ax
L_0B448:
        push ax
L_0B449:
        mov cx, word ptr [bp - 10h]
L_0B44C:
        mov si, word ptr [bp - 16h]
L_0B44F:
        push si
L_0B450:
        sub si, 12h
L_0B453:
        loop L_0B44F
L_0B455:
        push ax
L_0B456:
        mov cx, word ptr [bp - 14h]
L_0B459:
        mov si, word ptr [bp - 18h]
L_0B45C:
        push si
L_0B45D:
        sub si, 12h
L_0B460:
        loop L_0B45C
L_0B462:
        push word ptr [bp + 6]
L_0B465:
        call FAR PTR _polygon_scan_convert
L_0B46A:
        mov ax, word ptr [bp - 10h]
L_0B46D:
        add ax, word ptr [bp - 14h]
L_0B470:
        shl ax, 1
L_0B472:
        add sp, ax
L_0B474:
        add sp, 6
L_0B477:
        add sp, word ptr [bp - 1Ch]
L_0B47A:
        pop di
L_0B47B:
        pop si
L_0B47C:
        mov sp, bp
L_0B47E:
        pop bp
L_0B47F:
        retf
_fn_cycles_tandy_0b168 ENDP
_TEXT ENDS
END
