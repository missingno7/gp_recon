_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _terrain_display
_g_007ee EQU 7eeh
_g_007f0 EQU 7f0h
_g_00a72 EQU 0a72h
_g_00a7c EQU 0a7ch
_g_00a88 EQU 0a88h
_g_05e46 EQU 5e46h
_g_05e48 EQU 5e48h
_g_05ebe EQU 5ebeh
_g_06c42 EQU 6c42h
EXTRN _FN_CIRCUIT_EGA_04A5B:NEAR
_terrain_display PROC NEAR
        mov ax, 5d49h
        mov word ptr ds:[_g_007ee], ax
        mov ax, word ptr ds:[_g_05ebe]
        mov byte ptr ds:[_g_00a88], al
        mov bp, 26h
        mov es, word ptr ds:[_g_05e46]
        mov si, 0ch
        shl si, 1
L_5C85:
        mov bx, word ptr ds:[_g_05e48]
        mov di, word ptr cs:[bx + si]
        xor dx, dx
        mov word ptr ds:[_g_06c42], dx
        mov word ptr ds:[_g_007f0], dx
        mov word ptr es:[di], dx
        mov ax, word ptr [si - 6390h]
        or al, al
        je short L_5CBA
        mov bp, word ptr [si - 6350h]
        shl bp, 1
        mov bl, byte ptr ds:[_g_00a88]
        inc bl
        and bx, 7
        mov byte ptr ds:[_g_00a88], bl
        mov word ptr ds:[_g_00a72], 2222h
L_5CBA:
        mov al, byte ptr [bp + 74d2h]
        or al, al
        je short L_5CDF
        cmp al, 3
        jbe short L_5CE5
        cmp al, 4dh
        jge short L_5CD5
        test al, 20h
        jne short L_5CE2
        cmp al, 5
        je short L_5CDC
        jmp near ptr L_5DE8
L_5CD5:
        cmp al, 4eh
        je short L_5CDF
        jmp near ptr L_5E49
L_5CDC:
        jmp short L_5D54
        nop
L_5CDF:
        jmp near ptr L_5DE8
L_5CE2:
        jmp near ptr L_5EA5
L_5CE5:
        mov bl, byte ptr ds:[_g_00a88]
        xor bh, bh
        mov al, byte ptr [bx + 0a74h]
        mov ah, al
        mov word ptr ds:[_g_00a7c], ax
        mov bx, word ptr ds:[_g_00a72]
        mov ax, word ptr [si + 6c44h]
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, word ptr ds:[_g_00a7c]
        mov ax, word ptr [si + 6d22h]
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, 8888h
        mov ax, bp
        sar al, 1
        sub al, byte ptr ds:[_g_05ebe]
        and al, 4
        jne short L_5D2D
        mov ax, word ptr [si + 6fbch]
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, 0ffffh
        add ax, word ptr [si + 0abch]
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, 8888h
L_5D2D:
        mov ax, word ptr [si + 6e00h]
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, word ptr ds:[_g_00a7c]
        mov ax, word ptr [si + 709ah]
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, word ptr ds:[_g_00a72]
        mov ax, 70h
        call _FN_CIRCUIT_EGA_04A5B
L_5D49:
        inc si
        inc si
        cmp si, 2ch
        jge short L_5D53
        jmp near ptr L_5C85
L_5D53:
        ret
L_5D54:
        mov ax, word ptr [si + 6d22h]
        sub ax, word ptr [si + 0b28h]
        mov bx, word ptr ds:[_g_00a72]
        call _FN_CIRCUIT_EGA_04A5B
        mov ax, word ptr [si + 6d22h]
        mov bx, 0ffffh
        call _FN_CIRCUIT_EGA_04A5B
        jmp short L_5D94
        nop
L_5D70:
        mov bx, 8888h
        mov ax, word ptr [si + 6e00h]
        call _FN_CIRCUIT_EGA_04A5B
        mov ax, word ptr [si + 6e00h]
        add ax, word ptr [si + 0b28h]
        mov bx, 0ffffh
        call _FN_CIRCUIT_EGA_04A5B
        mov ax, 70h
        mov bx, word ptr ds:[_g_00a72]
        call _FN_CIRCUIT_EGA_04A5B
        jmp short L_5D49
L_5D94:
        mov bx, 0ffffh
        mov ax, bp
        cmp ax, 24h
        jge short L_5D70
        sar al, 1
        sub al, byte ptr ds:[_g_05ebe]
        and al, 2
        je short L_5DC8
        mov ax, word ptr [si + 6d22h]
L_5DAC:
        add ax, word ptr [si + 0b04h]
        mov bx, 8888h
        cmp ax, word ptr [si + 6e00h]
        jge short L_5D70
        call _FN_CIRCUIT_EGA_04A5B
        add ax, word ptr [si + 0b04h]
        mov bx, 0ffffh
        call _FN_CIRCUIT_EGA_04A5B
        jmp short L_5DAC
L_5DC8:
        mov ax, word ptr [si + 6d22h]
L_5DCC:
        add ax, word ptr [si + 0b04h]
        mov bx, 0ffffh
        cmp ax, word ptr [si + 6e00h]
        jge short L_5D70
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, 8888h
        add ax, word ptr [si + 0b04h]
        call _FN_CIRCUIT_EGA_04A5B
        jmp short L_5DCC
L_5DE8:
        mov ax, word ptr [si + 6d22h]
        sub ax, word ptr [si + 0b28h]
        mov bx, word ptr ds:[_g_00a72]
        call _FN_CIRCUIT_EGA_04A5B
        mov ax, word ptr [si + 6d22h]
        mov bx, 0ffffh
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, 8888h
        mov ax, bp
        sar al, 1
        sub al, byte ptr ds:[_g_05ebe]
        and al, 4
        jne short L_5E24
        mov ax, word ptr [si + 6fbch]
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, 0ffffh
        add ax, word ptr [si + 0abch]
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, 8888h
L_5E24:
        mov ax, word ptr [si + 6e00h]
        mov bx, 8888h
        call _FN_CIRCUIT_EGA_04A5B
        mov ax, word ptr [si + 6e00h]
        add ax, word ptr [si + 0b28h]
        mov bx, 0ffffh
        call _FN_CIRCUIT_EGA_04A5B
        mov ax, 70h
        mov bx, word ptr ds:[_g_00a72]
        call _FN_CIRCUIT_EGA_04A5B
        jmp near ptr L_5D49
L_5E49:
        mov ax, word ptr [si + 6d22h]
        sub ax, word ptr [si + 0b28h]
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
        jne short L_5E84
        mov ax, word ptr [si + 6fbch]
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, 7777h
        add ax, word ptr [si + 0abch]
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, 0
L_5E84:
        mov ax, word ptr [si + 6e00h]
        call _FN_CIRCUIT_EGA_04A5B
        mov ax, word ptr [si + 6e00h]
        add ax, word ptr [si + 0b28h]
        mov bx, 7777h
        call _FN_CIRCUIT_EGA_04A5B
        mov ax, 70h
        mov bx, 0
        call _FN_CIRCUIT_EGA_04A5B
        jmp near ptr L_5D49
L_5EA5:
        mov ax, word ptr [si + 6d22h]
        sub ax, word ptr [si + 0b28h]
        mov bx, word ptr ds:[_g_00a72]
        call _FN_CIRCUIT_EGA_04A5B
        mov ax, word ptr [si + 6d22h]
        mov bx, 0ffffh
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, 8888h
        mov ax, bp
        sar al, 1
        sub al, byte ptr ds:[_g_05ebe]
        and al, 4
        jne short L_5EE1
        mov ax, word ptr [si + 6fbch]
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, 0ffffh
        add ax, word ptr [si + 0abch]
        call _FN_CIRCUIT_EGA_04A5B
        mov bx, 8888h
L_5EE1:
        mov ax, word ptr [si + 6e00h]
        call _FN_CIRCUIT_EGA_04A5B
        add ax, word ptr [si + 0abch]
        mov bx, 0ffffh
        call _FN_CIRCUIT_EGA_04A5B
        sub ax, word ptr [si + 0abch]
        test byte ptr [bp + 74d2h], 6
        je short L_5F09
        mov bx, word ptr [si + 0a98h]
        shl bx, 1
        add ax, bx
        mov word ptr [si + 6edeh], ax
L_5F09:
        mov ax, word ptr [si + 6edeh]
        sub ax, word ptr [si + 0a98h]
        sub ax, word ptr [si + 0abch]
        sub ax, word ptr [si + 0a74h]
        mov bx, word ptr ds:[_g_00a72]
        call _FN_CIRCUIT_EGA_04A5B
        add ax, word ptr [si + 0abch]
        mov bx, 0ffffh
        call _FN_CIRCUIT_EGA_04A5B
        mov ax, word ptr [si + 6edeh]
        mov bx, 8888h
        call _FN_CIRCUIT_EGA_04A5B
        add ax, word ptr [si + 0abch]
        mov bx, 0ffffh
        call _FN_CIRCUIT_EGA_04A5B
        mov ax, 70h
        mov bx, word ptr ds:[_g_00a72]
        call _FN_CIRCUIT_EGA_04A5B
        jmp near ptr L_5D49
_terrain_display ENDP
_TEXT ENDS
END
