.8086
.MODEL SMALL
.DATA
        EXTRN _G_A737:BYTE, _G_A5B8:WORD
.CODE
_TEXT ENDS
FILEOPEN_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:FILEOPEN_TEXT, DS:DGROUP
        EXTRN _fn_cycles_cga_033b3:NEAR, _fn_cycles_cga_03fc3:NEAR
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
        jne SHORT L_3249
        test ax, 4000h
        jne SHORT L_3245
        test byte ptr [_G_A737], 80h
        jne SHORT L_3249
L_3245:
        mov byte ptr [bp-4h], 80h
L_3249:
        mov dx, word ptr [bp+6h]
        and al, 3h
        or al, bh
        mov ah, 3Dh
        int 21h
        jae SHORT L_3268
        cmp ax, 2h
        jne SHORT L_3264
        test cx, 100h
        je SHORT L_3264
        jmp NEAR PTR L_3305
L_3264:
        stc
        jmp NEAR PTR _fn_cycles_cga_03fc3
L_3268:
        xchg bx, ax
        mov ax, cx
        and ax, 500h
        cmp ax, 500h
        jne SHORT L_327C
        mov ah, 3Eh
        int 21h
        mov ax, 1100h
        jmp SHORT L_3264
L_327C:
        mov byte ptr [bp-3h], 1h
        mov ax, 4400h
        int 21h
        test dl, 80h
        je SHORT L_328E
        or byte ptr [bp-4h], 40h
L_328E:
        test byte ptr [bp-4h], 40h
        je SHORT L_3297
        jmp NEAR PTR L_336C
L_3297:
        mov ax, word ptr [bp+8h]
        test ax, 200h
        je SHORT L_32BC
        test ax, 3h
        je SHORT L_32AD
        xor cx, cx
        mov ah, 40h
        int 21h
        jmp NEAR PTR L_336C
L_32AD:
        mov ah, 3Eh
        int 21h
        mov dx, word ptr [bp+6h]
        mov ax, 4300h
        int 21h
        jmp SHORT L_3322
        nop
L_32BC:
        test byte ptr [bp-4h], 80h
        jne SHORT L_32C5
        jmp NEAR PTR L_336C
L_32C5:
        test ax, 2h
        jne SHORT L_32CD
        jmp NEAR PTR L_336C
L_32CD:
        mov cx, 0FFFFh
        mov dx, cx
        mov ax, 4202h
        int 21h
        neg cx
        lea dx, word ptr [bp-1h]
        mov ah, 3Fh
        int 21h
        or ax, ax
        je SHORT L_32F9
        cmp byte ptr [bp-1h], 1Ah
        jne SHORT L_32F9
        neg cx
        mov dx, cx
        mov ax, 4202h
        int 21h
        xor cx, cx
        mov ah, 40h
        int 21h
L_32F9:
        xor cx, cx
        mov dx, cx
        mov ax, 4200h
        int 21h
        jmp SHORT L_336C
        nop
L_3305:
        mov byte ptr [bp-3h], 0
        mov cx, word ptr [bp+0Ah]
        call NEAR PTR _fn_cycles_cga_033b3
        mov word ptr [bp+0Ah], cx
        test byte ptr [bp-2h], 0FFh
        jne SHORT L_331F
        test word ptr [bp+8h], 2h
        jne SHORT L_3322
L_331F:
        and cl, 0FEh
L_3322:
        mov dx, word ptr [bp+6h]
        mov ah, 3Ch
        int 21h
        jae SHORT L_332E
L_332B:
        jmp NEAR PTR _fn_cycles_cga_03fc3
L_332E:
        xchg bx, ax
        test byte ptr [bp-2h], 0FFh
        jne SHORT L_333C
        test word ptr [bp+8h], 2h
        jne SHORT L_336C
L_333C:
        mov ah, 3Eh
        int 21h
        mov al, byte ptr [bp+8h]
        and al, 3h
        or al, byte ptr [bp-2h]
        mov dx, word ptr [bp+6h]
        mov ah, 3Dh
        int 21h
        jb SHORT L_332B
        xchg bx, ax
        test byte ptr [bp-3h], 1h
        jne SHORT L_336C
        test word ptr [bp+0Ah], 1h
        je SHORT L_336C
        or cl, 1h
        mov dx, word ptr [bp+6h]
        mov ax, 4301h
        int 21h
        jb SHORT L_332B
L_336C:
        test byte ptr [bp-4h], 40h
        jne SHORT L_33AF
        mov dx, word ptr [bp+6h]
        mov ax, 4300h
        int 21h
        mov ax, cx
        xor cl, cl
        and ax, 1h
        je SHORT L_3385
        mov cl, 10h
L_3385:
        test word ptr [bp+8h], 8h
        je SHORT L_338F
        or cl, 20h
L_338F:
        cmp bx, word ptr [_G_A5B8]
        jb SHORT L_339F
        mov ah, 3Eh
        int 21h
        mov ax, 1800h
        jmp NEAR PTR L_3264
L_339F:
        or cl, byte ptr [bp-4h]
        or cl, 1h
        mov byte ptr [bx+_G_A5B8+2], cl
        mov ax, bx
        mov sp, bp
        pop bp
        retf
L_33AF:
        xor cl, cl
        jmp SHORT L_338F
_grp_0376aefe ENDP
FILEOPEN_TEXT ENDS
        END
