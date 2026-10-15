.8086
.MODEL SMALL
.DATA
        EXTRN _G_A737:BYTE, _G_A5B8:WORD
.CODE
_TEXT ENDS
FILEOPEN_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:FILEOPEN_TEXT, DS:DGROUP
        EXTRN _fn_cycles_ega_034f5:NEAR, _fn_cycles_ega_04105:NEAR
        PUBLIC _grp_0376aefe
_grp_0376aefe PROC FAR
        push bp
        mov bp, sp
        sub sp, 4h
        xor bh, bh
        mov byte ptr [bp-2h], bh
        mov ax, word ptr [bp+8h]
        mov cx, ax
        mov byte ptr [bp-4h], 0
        test ax, 8000h
        jne SHORT L_338B
        test ax, 4000h
        jne SHORT L_3387
        test byte ptr [_G_A737], 80h
        jne SHORT L_338B
L_3387:
        mov byte ptr [bp-4h], 80h
L_338B:
        mov dx, word ptr [bp+6h]
        and al, 3h
        or al, bh
        mov ah, 3Dh
        int 21h
        jae SHORT L_33AA
        cmp ax, 2h
        jne SHORT L_33A6
        test cx, 100h
        je SHORT L_33A6
        jmp NEAR PTR L_3447
L_33A6:
        stc
        jmp NEAR PTR _fn_cycles_ega_04105
L_33AA:
        xchg bx, ax
        mov ax, cx
        and ax, 500h
        cmp ax, 500h
        jne SHORT L_33BE
        mov ah, 3Eh
        int 21h
        mov ax, 1100h
        jmp SHORT L_33A6
L_33BE:
        mov byte ptr [bp-3h], 1h
        mov ax, 4400h
        int 21h
        test dl, 80h
        je SHORT L_33D0
        or byte ptr [bp-4h], 40h
L_33D0:
        test byte ptr [bp-4h], 40h
        je SHORT L_33D9
        jmp NEAR PTR L_34AE
L_33D9:
        mov ax, word ptr [bp+8h]
        test ax, 200h
        je SHORT L_33FE
        test ax, 3h
        je SHORT L_33EF
        xor cx, cx
        mov ah, 40h
        int 21h
        jmp NEAR PTR L_34AE
L_33EF:
        mov ah, 3Eh
        int 21h
        mov dx, word ptr [bp+6h]
        mov ax, 4300h
        int 21h
        jmp SHORT L_3464
        nop
L_33FE:
        test byte ptr [bp-4h], 80h
        jne SHORT L_3407
        jmp NEAR PTR L_34AE
L_3407:
        test ax, 2h
        jne SHORT L_340F
        jmp NEAR PTR L_34AE
L_340F:
        mov cx, 0FFFFh
        mov dx, cx
        mov ax, 4202h
        int 21h
        neg cx
        lea dx, word ptr [bp-1h]
        mov ah, 3Fh
        int 21h
        or ax, ax
        je SHORT L_343B
        cmp byte ptr [bp-1h], 1Ah
        jne SHORT L_343B
        neg cx
        mov dx, cx
        mov ax, 4202h
        int 21h
        xor cx, cx
        mov ah, 40h
        int 21h
L_343B:
        xor cx, cx
        mov dx, cx
        mov ax, 4200h
        int 21h
        jmp SHORT L_34AE
        nop
L_3447:
        mov byte ptr [bp-3h], 0
        mov cx, word ptr [bp+0Ah]
        call NEAR PTR _fn_cycles_ega_034f5
        mov word ptr [bp+0Ah], cx
        test byte ptr [bp-2h], 0FFh
        jne SHORT L_3461
        test word ptr [bp+8h], 2h
        jne SHORT L_3464
L_3461:
        and cl, 0FEh
L_3464:
        mov dx, word ptr [bp+6h]
        mov ah, 3Ch
        int 21h
        jae SHORT L_3470
L_346D:
        jmp NEAR PTR _fn_cycles_ega_04105
L_3470:
        xchg bx, ax
        test byte ptr [bp-2h], 0FFh
        jne SHORT L_347E
        test word ptr [bp+8h], 2h
        jne SHORT L_34AE
L_347E:
        mov ah, 3Eh
        int 21h
        mov al, byte ptr [bp+8h]
        and al, 3h
        or al, byte ptr [bp-2h]
        mov dx, word ptr [bp+6h]
        mov ah, 3Dh
        int 21h
        jb SHORT L_346D
        xchg bx, ax
        test byte ptr [bp-3h], 1h
        jne SHORT L_34AE
        test word ptr [bp+0Ah], 1h
        je SHORT L_34AE
        or cl, 1h
        mov dx, word ptr [bp+6h]
        mov ax, 4301h
        int 21h
        jb SHORT L_346D
L_34AE:
        test byte ptr [bp-4h], 40h
        jne SHORT L_34F1
        mov dx, word ptr [bp+6h]
        mov ax, 4300h
        int 21h
        mov ax, cx
        xor cl, cl
        and ax, 1h
        je SHORT L_34C7
        mov cl, 10h
L_34C7:
        test word ptr [bp+8h], 8h
        je SHORT L_34D1
        or cl, 20h
L_34D1:
        cmp bx, word ptr [_G_A5B8]
        jb SHORT L_34E1
        mov ah, 3Eh
        int 21h
        mov ax, 1800h
        jmp NEAR PTR L_33A6
L_34E1:
        or cl, byte ptr [bp-4h]
        or cl, 1h
        mov byte ptr [bx+_G_A5B8+2], cl
        mov ax, bx
        mov sp, bp
        pop bp
        retf
L_34F1:
        xor cl, cl
        jmp SHORT L_34D1
_grp_0376aefe ENDP
FILEOPEN_TEXT ENDS
        END
