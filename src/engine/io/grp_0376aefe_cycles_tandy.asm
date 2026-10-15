.8086
.MODEL SMALL
.DATA
        EXTRN _G_A737:BYTE, _G_A5B8:WORD
.CODE
_TEXT ENDS
FILEOPEN_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:FILEOPEN_TEXT, DS:DGROUP
        EXTRN _fn_cycles_tandy_033a9:NEAR, _fn_cycles_tandy_03fb9:NEAR
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
        jne SHORT L_323F
        test ax, 4000h
        jne SHORT L_323B
        test byte ptr [_G_A737], 80h
        jne SHORT L_323F
L_323B:
        mov byte ptr [bp-4h], 80h
L_323F:
        mov dx, word ptr [bp+6h]
        and al, 3h
        or al, bh
        mov ah, 3Dh
        int 21h
        jae SHORT L_325E
        cmp ax, 2h
        jne SHORT L_325A
        test cx, 100h
        je SHORT L_325A
        jmp NEAR PTR L_32FB
L_325A:
        stc
        jmp NEAR PTR _fn_cycles_tandy_03fb9
L_325E:
        xchg bx, ax
        mov ax, cx
        and ax, 500h
        cmp ax, 500h
        jne SHORT L_3272
        mov ah, 3Eh
        int 21h
        mov ax, 1100h
        jmp SHORT L_325A
L_3272:
        mov byte ptr [bp-3h], 1h
        mov ax, 4400h
        int 21h
        test dl, 80h
        je SHORT L_3284
        or byte ptr [bp-4h], 40h
L_3284:
        test byte ptr [bp-4h], 40h
        je SHORT L_328D
        jmp NEAR PTR L_3362
L_328D:
        mov ax, word ptr [bp+8h]
        test ax, 200h
        je SHORT L_32B2
        test ax, 3h
        je SHORT L_32A3
        xor cx, cx
        mov ah, 40h
        int 21h
        jmp NEAR PTR L_3362
L_32A3:
        mov ah, 3Eh
        int 21h
        mov dx, word ptr [bp+6h]
        mov ax, 4300h
        int 21h
        jmp SHORT L_3318
        nop
L_32B2:
        test byte ptr [bp-4h], 80h
        jne SHORT L_32BB
        jmp NEAR PTR L_3362
L_32BB:
        test ax, 2h
        jne SHORT L_32C3
        jmp NEAR PTR L_3362
L_32C3:
        mov cx, 0FFFFh
        mov dx, cx
        mov ax, 4202h
        int 21h
        neg cx
        lea dx, word ptr [bp-1h]
        mov ah, 3Fh
        int 21h
        or ax, ax
        je SHORT L_32EF
        cmp byte ptr [bp-1h], 1Ah
        jne SHORT L_32EF
        neg cx
        mov dx, cx
        mov ax, 4202h
        int 21h
        xor cx, cx
        mov ah, 40h
        int 21h
L_32EF:
        xor cx, cx
        mov dx, cx
        mov ax, 4200h
        int 21h
        jmp SHORT L_3362
        nop
L_32FB:
        mov byte ptr [bp-3h], 0
        mov cx, word ptr [bp+0Ah]
        call NEAR PTR _fn_cycles_tandy_033a9
        mov word ptr [bp+0Ah], cx
        test byte ptr [bp-2h], 0FFh
        jne SHORT L_3315
        test word ptr [bp+8h], 2h
        jne SHORT L_3318
L_3315:
        and cl, 0FEh
L_3318:
        mov dx, word ptr [bp+6h]
        mov ah, 3Ch
        int 21h
        jae SHORT L_3324
L_3321:
        jmp NEAR PTR _fn_cycles_tandy_03fb9
L_3324:
        xchg bx, ax
        test byte ptr [bp-2h], 0FFh
        jne SHORT L_3332
        test word ptr [bp+8h], 2h
        jne SHORT L_3362
L_3332:
        mov ah, 3Eh
        int 21h
        mov al, byte ptr [bp+8h]
        and al, 3h
        or al, byte ptr [bp-2h]
        mov dx, word ptr [bp+6h]
        mov ah, 3Dh
        int 21h
        jb SHORT L_3321
        xchg bx, ax
        test byte ptr [bp-3h], 1h
        jne SHORT L_3362
        test word ptr [bp+0Ah], 1h
        je SHORT L_3362
        or cl, 1h
        mov dx, word ptr [bp+6h]
        mov ax, 4301h
        int 21h
        jb SHORT L_3321
L_3362:
        test byte ptr [bp-4h], 40h
        jne SHORT L_33A5
        mov dx, word ptr [bp+6h]
        mov ax, 4300h
        int 21h
        mov ax, cx
        xor cl, cl
        and ax, 1h
        je SHORT L_337B
        mov cl, 10h
L_337B:
        test word ptr [bp+8h], 8h
        je SHORT L_3385
        or cl, 20h
L_3385:
        cmp bx, word ptr [_G_A5B8]
        jb SHORT L_3395
        mov ah, 3Eh
        int 21h
        mov ax, 1800h
        jmp NEAR PTR L_325A
L_3395:
        or cl, byte ptr [bp-4h]
        or cl, 1h
        mov byte ptr [bx+_G_A5B8+2], cl
        mov ax, bx
        mov sp, bp
        pop bp
        retf
L_33A5:
        xor cl, cl
        jmp SHORT L_3385
_grp_0376aefe ENDP
FILEOPEN_TEXT ENDS
        END
