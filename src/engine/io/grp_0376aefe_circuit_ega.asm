.8086
.MODEL SMALL
.DATA
        EXTRN _G_A737:BYTE, _G_A5B8:WORD
.CODE
_TEXT ENDS
FILEOPEN_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:FILEOPEN_TEXT, DS:DGROUP
        EXTRN _fn_circuit_ega_0f4bb:NEAR, _fn_circuit_ega_0e535:NEAR
        PUBLIC _grp_0376aefe
_grp_0376aefe PROC NEAR
        push bp
        mov bp, sp
        sub sp, 4h
        xor bh, bh
        mov byte ptr [bp-2h], bh
        mov ax, word ptr [bp+6h]
        mov cx, ax
        mov byte ptr [bp-4h], 0
        test ax, 8000h
        jne SHORT L_F351
        test ax, 4000h
        jne SHORT L_F34D
        test byte ptr [_G_A737], 80h
        jne SHORT L_F351
L_F34D:
        mov byte ptr [bp-4h], 80h
L_F351:
        mov dx, word ptr [bp+4h]
        and al, 3h
        or al, bh
        mov ah, 3Dh
        int 21h
        jae SHORT L_F370
        cmp ax, 2h
        jne SHORT L_F36C
        test cx, 100h
        je SHORT L_F36C
        jmp NEAR PTR L_F40D
L_F36C:
        stc
        jmp NEAR PTR _fn_circuit_ega_0e535
L_F370:
        xchg bx, ax
        mov ax, cx
        and ax, 500h
        cmp ax, 500h
        jne SHORT L_F384
        mov ah, 3Eh
        int 21h
        mov ax, 1100h
        jmp SHORT L_F36C
L_F384:
        mov byte ptr [bp-3h], 1h
        mov ax, 4400h
        int 21h
        test dl, 80h
        je SHORT L_F396
        or byte ptr [bp-4h], 40h
L_F396:
        test byte ptr [bp-4h], 40h
        je SHORT L_F39F
        jmp NEAR PTR L_F474
L_F39F:
        mov ax, word ptr [bp+6h]
        test ax, 200h
        je SHORT L_F3C4
        test ax, 3h
        je SHORT L_F3B5
        xor cx, cx
        mov ah, 40h
        int 21h
        jmp NEAR PTR L_F474
L_F3B5:
        mov ah, 3Eh
        int 21h
        mov dx, word ptr [bp+4h]
        mov ax, 4300h
        int 21h
        jmp SHORT L_F42A
        nop
L_F3C4:
        test byte ptr [bp-4h], 80h
        jne SHORT L_F3CD
        jmp NEAR PTR L_F474
L_F3CD:
        test ax, 2h
        jne SHORT L_F3D5
        jmp NEAR PTR L_F474
L_F3D5:
        mov cx, 0FFFFh
        mov dx, cx
        mov ax, 4202h
        int 21h
        neg cx
        lea dx, word ptr [bp-1h]
        mov ah, 3Fh
        int 21h
        or ax, ax
        je SHORT L_F401
        cmp byte ptr [bp-1h], 1Ah
        jne SHORT L_F401
        neg cx
        mov dx, cx
        mov ax, 4202h
        int 21h
        xor cx, cx
        mov ah, 40h
        int 21h
L_F401:
        xor cx, cx
        mov dx, cx
        mov ax, 4200h
        int 21h
        jmp SHORT L_F474
        nop
L_F40D:
        mov byte ptr [bp-3h], 0
        mov cx, word ptr [bp+8h]
        call NEAR PTR _fn_circuit_ega_0f4bb
        mov word ptr [bp+8h], cx
        test byte ptr [bp-2h], 0FFh
        jne SHORT L_F427
        test word ptr [bp+6h], 2h
        jne SHORT L_F42A
L_F427:
        and cl, 0FEh
L_F42A:
        mov dx, word ptr [bp+4h]
        mov ah, 3Ch
        int 21h
        jae SHORT L_F436
L_F433:
        jmp NEAR PTR _fn_circuit_ega_0e535
L_F436:
        xchg bx, ax
        test byte ptr [bp-2h], 0FFh
        jne SHORT L_F444
        test word ptr [bp+6h], 2h
        jne SHORT L_F474
L_F444:
        mov ah, 3Eh
        int 21h
        mov al, byte ptr [bp+6h]
        and al, 3h
        or al, byte ptr [bp-2h]
        mov dx, word ptr [bp+4h]
        mov ah, 3Dh
        int 21h
        jb SHORT L_F433
        xchg bx, ax
        test byte ptr [bp-3h], 1h
        jne SHORT L_F474
        test word ptr [bp+8h], 1h
        je SHORT L_F474
        or cl, 1h
        mov dx, word ptr [bp+4h]
        mov ax, 4301h
        int 21h
        jb SHORT L_F433
L_F474:
        test byte ptr [bp-4h], 40h
        jne SHORT L_F4B7
        mov dx, word ptr [bp+4h]
        mov ax, 4300h
        int 21h
        mov ax, cx
        xor cl, cl
        and ax, 1h
        je SHORT L_F48D
        mov cl, 10h
L_F48D:
        test word ptr [bp+6h], 8h
        je SHORT L_F497
        or cl, 20h
L_F497:
        cmp bx, word ptr [_G_A5B8]
        jb SHORT L_F4A7
        mov ah, 3Eh
        int 21h
        mov ax, 1800h
        jmp NEAR PTR L_F36C
L_F4A7:
        or cl, byte ptr [bp-4h]
        or cl, 1h
        mov byte ptr [bx+_G_A5B8+2], cl
        mov ax, bx
        mov sp, bp
        pop bp
        ret
L_F4B7:
        xor cl, cl
        jmp SHORT L_F497
_grp_0376aefe ENDP
FILEOPEN_TEXT ENDS
        END
