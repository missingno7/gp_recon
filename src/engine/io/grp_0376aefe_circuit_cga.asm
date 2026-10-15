.8086
.MODEL SMALL
.DATA
        EXTRN _G_A737:BYTE, _G_A5B8:WORD
.CODE
_TEXT ENDS
FILEOPEN_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:FILEOPEN_TEXT, DS:DGROUP
        EXTRN _fn_circuit_cga_0c021:NEAR, _fn_circuit_cga_0c83d:NEAR
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
        jne SHORT L_BEB7
        test ax, 4000h
        jne SHORT L_BEB3
        test byte ptr [_G_A737], 80h
        jne SHORT L_BEB7
L_BEB3:
        mov byte ptr [bp-4h], 80h
L_BEB7:
        mov dx, word ptr [bp+4h]
        and al, 3h
        or al, bh
        mov ah, 3Dh
        int 21h
        jae SHORT L_BED6
        cmp ax, 2h
        jne SHORT L_BED2
        test cx, 100h
        je SHORT L_BED2
        jmp NEAR PTR L_BF73
L_BED2:
        stc
        jmp NEAR PTR _fn_circuit_cga_0c83d
L_BED6:
        xchg bx, ax
        mov ax, cx
        and ax, 500h
        cmp ax, 500h
        jne SHORT L_BEEA
        mov ah, 3Eh
        int 21h
        mov ax, 1100h
        jmp SHORT L_BED2
L_BEEA:
        mov byte ptr [bp-3h], 1h
        mov ax, 4400h
        int 21h
        test dl, 80h
        je SHORT L_BEFC
        or byte ptr [bp-4h], 40h
L_BEFC:
        test byte ptr [bp-4h], 40h
        je SHORT L_BF05
        jmp NEAR PTR L_BFDA
L_BF05:
        mov ax, word ptr [bp+6h]
        test ax, 200h
        je SHORT L_BF2A
        test ax, 3h
        je SHORT L_BF1B
        xor cx, cx
        mov ah, 40h
        int 21h
        jmp NEAR PTR L_BFDA
L_BF1B:
        mov ah, 3Eh
        int 21h
        mov dx, word ptr [bp+4h]
        mov ax, 4300h
        int 21h
        jmp SHORT L_BF90
        nop
L_BF2A:
        test byte ptr [bp-4h], 80h
        jne SHORT L_BF33
        jmp NEAR PTR L_BFDA
L_BF33:
        test ax, 2h
        jne SHORT L_BF3B
        jmp NEAR PTR L_BFDA
L_BF3B:
        mov cx, 0FFFFh
        mov dx, cx
        mov ax, 4202h
        int 21h
        neg cx
        lea dx, word ptr [bp-1h]
        mov ah, 3Fh
        int 21h
        or ax, ax
        je SHORT L_BF67
        cmp byte ptr [bp-1h], 1Ah
        jne SHORT L_BF67
        neg cx
        mov dx, cx
        mov ax, 4202h
        int 21h
        xor cx, cx
        mov ah, 40h
        int 21h
L_BF67:
        xor cx, cx
        mov dx, cx
        mov ax, 4200h
        int 21h
        jmp SHORT L_BFDA
        nop
L_BF73:
        mov byte ptr [bp-3h], 0
        mov cx, word ptr [bp+8h]
        call NEAR PTR _fn_circuit_cga_0c021
        mov word ptr [bp+8h], cx
        test byte ptr [bp-2h], 0FFh
        jne SHORT L_BF8D
        test word ptr [bp+6h], 2h
        jne SHORT L_BF90
L_BF8D:
        and cl, 0FEh
L_BF90:
        mov dx, word ptr [bp+4h]
        mov ah, 3Ch
        int 21h
        jae SHORT L_BF9C
L_BF99:
        jmp NEAR PTR _fn_circuit_cga_0c83d
L_BF9C:
        xchg bx, ax
        test byte ptr [bp-2h], 0FFh
        jne SHORT L_BFAA
        test word ptr [bp+6h], 2h
        jne SHORT L_BFDA
L_BFAA:
        mov ah, 3Eh
        int 21h
        mov al, byte ptr [bp+6h]
        and al, 3h
        or al, byte ptr [bp-2h]
        mov dx, word ptr [bp+4h]
        mov ah, 3Dh
        int 21h
        jb SHORT L_BF99
        xchg bx, ax
        test byte ptr [bp-3h], 1h
        jne SHORT L_BFDA
        test word ptr [bp+8h], 1h
        je SHORT L_BFDA
        or cl, 1h
        mov dx, word ptr [bp+4h]
        mov ax, 4301h
        int 21h
        jb SHORT L_BF99
L_BFDA:
        test byte ptr [bp-4h], 40h
        jne SHORT L_C01D
        mov dx, word ptr [bp+4h]
        mov ax, 4300h
        int 21h
        mov ax, cx
        xor cl, cl
        and ax, 1h
        je SHORT L_BFF3
        mov cl, 10h
L_BFF3:
        test word ptr [bp+6h], 8h
        je SHORT L_BFFD
        or cl, 20h
L_BFFD:
        cmp bx, word ptr [_G_A5B8]
        jb SHORT L_C00D
        mov ah, 3Eh
        int 21h
        mov ax, 1800h
        jmp NEAR PTR L_BED2
L_C00D:
        or cl, byte ptr [bp-4h]
        or cl, 1h
        mov byte ptr [bx+_G_A5B8+2], cl
        mov ax, bx
        mov sp, bp
        pop bp
        ret
L_C01D:
        xor cl, cl
        jmp SHORT L_BFFD
_grp_0376aefe ENDP
FILEOPEN_TEXT ENDS
        END
