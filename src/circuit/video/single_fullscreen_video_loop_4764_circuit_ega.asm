_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _fn_circuit_ega_04764
_g_007d4 EQU 07d4h
_g_007de EQU 07deh
_g_007e2 EQU 07e2h
_g_007e4 EQU 07e4h
_g_007ee EQU 07eeh
_g_007f0 EQU 07f0h
_g_05e56 EQU 5e56h
_g_05e58 EQU 5e58h
_g_05ebe EQU 5ebeh
_g_06c42 EQU 6c42h
EXTRN _FN_CIRCUIT_EGA_04A5B:NEAR
_fn_circuit_ega_04764 PROC NEAR
        mov ax, 4844h
        mov word ptr ds:[_g_007ee], ax
        mov ax, word ptr ds:[_g_05ebe]
        mov byte ptr ds:[_g_007e4], al
        mov bp, 4eh
        mov es, word ptr ds:[_g_05e56]
        mov si, 49h
        shl si, 1
L_477C:
        mov bx, word ptr ds:[_g_05e58]
        mov di, word ptr cs:[bx + si]
        xor dx, dx
        mov word ptr ds:[_g_06c42], dx
        mov word ptr ds:[_g_007f0], dx
        mov word ptr es:[di], dx
        mov ax, word ptr [si - 64b6h]
        or al, al
        je short L_47B1
        mov bp, word ptr [si - 645eh]
        shl bp, 1
        mov bl, byte ptr ds:[_g_007e4]
        dec bl
        and bx, 7
        mov byte ptr ds:[_g_007e4], bl
        mov word ptr ds:[_g_007d4], 2222h
L_47B1:
        mov al, byte ptr [bp + 74d2h]
        or al, al
        je short L_47D6
        cmp al, 3
        jbe short L_47E0
        cmp al, 4dh
        jge short L_47CC
        test al, 20h
        jne short L_47D9
        cmp al, 5
        je short L_47D3
        jmp near ptr L_48E4
L_47CC:
        cmp al, 4eh
        je short L_47D6
        jmp near ptr L_4945
L_47D3:
        jmp short L_4850
        nop
L_47D6:
        jmp near ptr L_48E4
L_47D9:
        cmp al, 21h
        je short L_47D6
        jmp near ptr L_49A1
L_47E0:
        mov bl, byte ptr ds:[_g_007e4]
        xor bh, bh
        mov al, byte ptr [bx + 7d6h]
        mov ah, al
        mov word ptr ds:[_g_007de], ax
        mov bx, word ptr ds:[_g_007d4]
        mov ax, word ptr [si + 6c44h]
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, word ptr ds:[_g_007de]
        mov ax, word ptr [si + 6d22h]
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, 8888h
        mov ax, bp
        sar al, 1
        add al, byte ptr ds:[_g_05ebe]
        and al, 4
        jne short L_4828
        mov ax, word ptr [si + 6fbch]
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, 0ffffh
        add ax, word ptr [si + 762h]
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, 8888h
L_4828:
        mov ax, word ptr [si + 6e00h]
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, word ptr ds:[_g_007de]
        mov ax, word ptr [si + 709ah]
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, word ptr ds:[_g_007d4]
        mov ax, 140h
        call _FN_CIRCUIT_EGA_04A5B
L_4844:
        inc si
        inc si
        cmp si, 0deh
        jg short L_484F
        jmp near ptr L_477C
L_484F:
        ret
L_4850:
        mov ax, word ptr [si + 6d22h]
        sub ax, word ptr [si + 802h]
        mov bx, word ptr ds:[_g_007d4]
        call _FN_CIRCUIT_EGA_04A5B
        mov ax, word ptr [si + 6d22h]
        mov bx, 0ffffh
        call _FN_CIRCUIT_EGA_04A5B
        jmp short L_4890
        nop
L_486C:
        mov bx, 8888h
        mov ax, word ptr [si + 6e00h]
        call _FN_CIRCUIT_EGA_04A5B
        mov ax, word ptr [si + 6e00h]
        add ax, word ptr [si + 802h]
        mov bx, 0ffffh
        call _FN_CIRCUIT_EGA_04A5B
        mov ax, 140h
        mov bx, word ptr ds:[_g_007d4]
        call _FN_CIRCUIT_EGA_04A5B
        jmp short L_4844
L_4890:
        mov bx, 0ffffh
        mov ax, bp
        cmp ax, 24h
        jge short L_486C
        sar al, 1
        add al, byte ptr ds:[_g_05ebe]
        and al, 2
        je short L_48C4
        mov ax, word ptr [si + 6d22h]
L_48A8:
        add ax, word ptr [si + 7b2h]
        mov bx, 8888h
        cmp ax, word ptr [si + 6e00h]
        jge short L_486C
        call _FN_CIRCUIT_EGA_04A5B
        add ax, word ptr [si + 7b2h]
        mov bx, 0ffffh
        call _FN_CIRCUIT_EGA_04A5B
        jmp short L_48A8
L_48C4:
        mov ax, word ptr [si + 6d22h]
L_48C8:
        add ax, word ptr [si + 7b2h]
        mov bx, 0ffffh
        cmp ax, word ptr [si + 6e00h]
        jge short L_486C
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, 8888h
        add ax, word ptr [si + 7b2h]
        call _FN_CIRCUIT_EGA_04A5B
        jmp short L_48C8
L_48E4:
        mov ax, word ptr [si + 6d22h]
        sub ax, word ptr [si + 802h]
        mov bx, word ptr ds:[_g_007d4]
        call _FN_CIRCUIT_EGA_04A5B
        mov ax, word ptr [si + 6d22h]
        mov bx, 0ffffh
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, 8888h
        mov ax, bp
        sar al, 1
        add al, byte ptr ds:[_g_05ebe]
        and al, 4
        jne short L_4920
        mov ax, word ptr [si + 6fbch]
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, 0ffffh
        add ax, word ptr [si + 762h]
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, 8888h
L_4920:
        mov ax, word ptr [si + 6e00h]
        mov bx, 8888h
        call _FN_CIRCUIT_EGA_04A5B
        mov ax, word ptr [si + 6e00h]
        add ax, word ptr [si + 802h]
        mov bx, 0ffffh
        call _FN_CIRCUIT_EGA_04A5B
        mov ax, 140h
        mov bx, word ptr ds:[_g_007d4]
        call _FN_CIRCUIT_EGA_04A5B
        jmp near ptr L_4844
L_4945:
        mov ax, word ptr [si + 6d22h]
        sub ax, word ptr [si + 802h]
        mov bx, 0
        call _FN_CIRCUIT_EGA_04A5B
        mov ax, word ptr [si + 6d22h]
        mov bx, 7777h
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, 0
        mov ax, bp
        sar al, 1
        add al, byte ptr ds:[_g_05ebe]
        and al, 4
        jne short L_4980
        mov ax, word ptr [si + 6fbch]
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, 7777h
        add ax, word ptr [si + 762h]
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, 0
L_4980:
        mov ax, word ptr [si + 6e00h]
        call _FN_CIRCUIT_EGA_04A5B
        mov ax, word ptr [si + 6e00h]
        add ax, word ptr [si + 802h]
        mov bx, 7777h
        call _FN_CIRCUIT_EGA_04A5B
        mov ax, 140h
        mov bx, 0
        call _FN_CIRCUIT_EGA_04A5B
        jmp near ptr L_4844
L_49A1:
        mov word ptr ds:[_g_007e2], 8888h
        mov ax, word ptr [si + 6d22h]
        sub ax, word ptr [si + 802h]
        mov bx, word ptr ds:[_g_007d4]
        call _FN_CIRCUIT_EGA_04A5B
        mov ax, word ptr [si + 6d22h]
        mov bx, 0ffffh
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, 8888h
        mov ax, bp
        sar al, 1
        add al, byte ptr ds:[_g_05ebe]
        and al, 4
        jne short L_49E3
        mov ax, word ptr [si + 6fbch]
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, 0ffffh
        add ax, word ptr [si + 762h]
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, 8888h
L_49E3:
        mov ax, word ptr [si + 6e00h]
        call _FN_CIRCUIT_EGA_04A5B
        add ax, word ptr [si + 762h]
        mov bx, 0ffffh
        call _FN_CIRCUIT_EGA_04A5B
        sub ax, word ptr [si + 762h]
        test byte ptr [bp + 74d2h], 6
        je short L_4A18
        mov bx, word ptr [si + 4c0h]
        shl bx, 1
        add ax, bx
        mov word ptr [si + 6edeh], ax
        cmp byte ptr [bp + 747eh], 60h
        jne short L_4A18
        mov word ptr ds:[_g_007e2], 0ffffh
L_4A18:
        mov ax, word ptr [si + 6edeh]
        sub ax, word ptr [si + 4c0h]
        sub ax, word ptr [si + 762h]
        sub ax, word ptr [si + 510h]
        mov bx, word ptr ds:[_g_007d4]
        call _FN_CIRCUIT_EGA_04A5B
        add ax, word ptr [si + 762h]
        mov bx, 0ffffh
        call _FN_CIRCUIT_EGA_04A5B
        mov ax, word ptr [si + 6edeh]
        mov bx, word ptr ds:[_g_007e2]
        call _FN_CIRCUIT_EGA_04A5B
        add ax, word ptr [si + 762h]
        mov bx, 0ffffh
        call _FN_CIRCUIT_EGA_04A5B
        mov ax, 140h
        mov bx, word ptr ds:[_g_007d4]
        call _FN_CIRCUIT_EGA_04A5B
        jmp near ptr L_4844
_fn_circuit_ega_04764 ENDP
_TEXT ENDS
END
