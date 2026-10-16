_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _fn_circuit_cga_0476e
_g_007d2 EQU 07d2h
_g_007d4 EQU 07d4h
_g_007de EQU 07deh
_g_007e2 EQU 07e2h
_g_007e4 EQU 07e4h
_g_007ee EQU 07eeh
_g_05e52 EQU 5e52h
_g_05e54 EQU 5e54h
_g_05ea2 EQU 5ea2h
_g_06c1a EQU 6c1ah
EXTRN _GRP_404A1943:NEAR
_fn_circuit_cga_0476e PROC NEAR
        mov ax, 485ch
        mov word ptr ds:[_g_007ee], ax
        mov ax, word ptr ds:[_g_05ea2]
        mov byte ptr ds:[_g_007e4], al
        mov bp, 4eh
        mov es, word ptr ds:[_g_05e52]
        mov si, 49h
        shl si, 1
L_4786:
        mov bx, word ptr ds:[_g_05e54]
        mov di, word ptr cs:[bx + si]
        xor dx, dx
        mov word ptr ds:[_g_06c1a], dx
        mov word ptr es:[di], dx
        mov ax, word ptr [si - 64e6h]
        or al, al
        je short L_47BA
        mov bp, word ptr [si - 648eh]
        shl bp, 1
        mov bl, byte ptr ds:[_g_007e4]
        dec bl
        and bx, 7
        mov byte ptr ds:[_g_007e4], bl
        mov al, byte ptr [bx + 7e6h]
        mov ah, al
        mov word ptr ds:[_g_007d2], ax
L_47BA:
        mov bx, word ptr ds:[_g_007d2]
        mov cx, si
        and cl, 3
        ror bx, cl
        mov word ptr ds:[_g_007d4], bx
        mov al, byte ptr [bp + 74aah]
        or al, al
        je short L_47EE
        cmp al, 3
        jbe short L_47F8
        cmp al, 4dh
        jge short L_47E4
        test al, 20h
        jne short L_47F1
        cmp al, 5
        je short L_47EB
        jmp near ptr L_48FC
L_47E4:
        cmp al, 4eh
        je short L_47EE
        jmp near ptr L_495D
L_47EB:
        jmp short L_4868
        nop
L_47EE:
        jmp near ptr L_48FC
L_47F1:
        cmp al, 21h
        je short L_47EE
        jmp near ptr L_49B9
L_47F8:
        mov bl, byte ptr ds:[_g_007e4]
        xor bh, bh
        mov al, byte ptr [bx + 7d6h]
        mov ah, al
        mov word ptr ds:[_g_007de], ax
        mov bx, word ptr ds:[_g_007d4]
        mov ax, word ptr [si + 6c1ch]
        call _GRP_404A1943
        mov bx, word ptr ds:[_g_007de]
        mov ax, word ptr [si + 6cfah]
        call _GRP_404A1943
        mov bx, 0
        mov ax, bp
        sar al, 1
        add al, byte ptr ds:[_g_05ea2]
        and al, 4
        jne short L_4840
        mov ax, word ptr [si + 6f94h]
        call _GRP_404A1943
        mov bx, 0ffffh
        add ax, word ptr [si + 762h]
        call _GRP_404A1943
        mov bx, 0
L_4840:
        mov ax, word ptr [si + 6dd8h]
        call _GRP_404A1943
        mov bx, word ptr ds:[_g_007de]
        mov ax, word ptr [si + 7072h]
        call _GRP_404A1943
        mov bx, word ptr ds:[_g_007d4]
        mov ax, 140h
        call _GRP_404A1943
L_485C:
        inc si
        inc si
        cmp si, 0deh
        jg short L_4867
        jmp near ptr L_4786
L_4867:
        ret
L_4868:
        mov ax, word ptr [si + 6cfah]
        sub ax, word ptr [si + 802h]
        mov bx, word ptr ds:[_g_007d4]
        call _GRP_404A1943
        mov ax, word ptr [si + 6cfah]
        mov bx, 0ffffh
        call _GRP_404A1943
        jmp short L_48A8
        nop
L_4884:
        mov bx, 0
        mov ax, word ptr [si + 6dd8h]
        call _GRP_404A1943
        mov ax, word ptr [si + 6dd8h]
        add ax, word ptr [si + 802h]
        mov bx, 0ffffh
        call _GRP_404A1943
        mov ax, 140h
        mov bx, word ptr ds:[_g_007d4]
        call _GRP_404A1943
        jmp short L_485C
L_48A8:
        mov bx, 0ffffh
        mov ax, bp
        cmp ax, 24h
        jge short L_4884
        sar al, 1
        add al, byte ptr ds:[_g_05ea2]
        and al, 2
        je short L_48DC
        mov ax, word ptr [si + 6cfah]
L_48C0:
        add ax, word ptr [si + 7b2h]
        mov bx, 0
        cmp ax, word ptr [si + 6dd8h]
        jge short L_4884
        call _GRP_404A1943
        add ax, word ptr [si + 7b2h]
        mov bx, 0ffffh
        call _GRP_404A1943
        jmp short L_48C0
L_48DC:
        mov ax, word ptr [si + 6cfah]
L_48E0:
        add ax, word ptr [si + 7b2h]
        mov bx, 0ffffh
        cmp ax, word ptr [si + 6dd8h]
        jge short L_4884
        call _GRP_404A1943
        mov bx, 0
        add ax, word ptr [si + 7b2h]
        call _GRP_404A1943
        jmp short L_48E0
L_48FC:
        mov ax, word ptr [si + 6cfah]
        sub ax, word ptr [si + 802h]
        mov bx, word ptr ds:[_g_007d4]
        call _GRP_404A1943
        mov ax, word ptr [si + 6cfah]
        mov bx, 0ffffh
        call _GRP_404A1943
        mov bx, 0
        mov ax, bp
        sar al, 1
        add al, byte ptr ds:[_g_05ea2]
        and al, 4
        jne short L_4938
        mov ax, word ptr [si + 6f94h]
        call _GRP_404A1943
        mov bx, 0ffffh
        add ax, word ptr [si + 762h]
        call _GRP_404A1943
        mov bx, 0
L_4938:
        mov ax, word ptr [si + 6dd8h]
        mov bx, 0
        call _GRP_404A1943
        mov ax, word ptr [si + 6dd8h]
        add ax, word ptr [si + 802h]
        mov bx, 0ffffh
        call _GRP_404A1943
        mov ax, 140h
        mov bx, word ptr ds:[_g_007d4]
        call _GRP_404A1943
        jmp near ptr L_485C
L_495D:
        mov ax, word ptr [si + 6cfah]
        sub ax, word ptr [si + 802h]
        mov bx, 0
        call _GRP_404A1943
        mov ax, word ptr [si + 6cfah]
        mov bx, 0ffffh
        call _GRP_404A1943
        mov bx, 0
        mov ax, bp
        sar al, 1
        add al, byte ptr ds:[_g_05ea2]
        and al, 4
        jne short L_4998
        mov ax, word ptr [si + 6f94h]
        call _GRP_404A1943
        mov bx, 0ffffh
        add ax, word ptr [si + 762h]
        call _GRP_404A1943
        mov bx, 0
L_4998:
        mov ax, word ptr [si + 6dd8h]
        call _GRP_404A1943
        mov ax, word ptr [si + 6dd8h]
        add ax, word ptr [si + 802h]
        mov bx, 0ffffh
        call _GRP_404A1943
        mov ax, 140h
        mov bx, 0
        call _GRP_404A1943
        jmp near ptr L_485C
L_49B9:
        mov word ptr ds:[_g_007e2], 0
        mov ax, word ptr [si + 6cfah]
        sub ax, word ptr [si + 802h]
        mov bx, word ptr ds:[_g_007d4]
        call _GRP_404A1943
        mov ax, word ptr [si + 6cfah]
        mov bx, 0ffffh
        call _GRP_404A1943
        mov bx, 0
        mov ax, bp
        sar al, 1
        add al, byte ptr ds:[_g_05ea2]
        and al, 4
        jne short L_49FB
        mov ax, word ptr [si + 6f94h]
        call _GRP_404A1943
        mov bx, 0ffffh
        add ax, word ptr [si + 762h]
        call _GRP_404A1943
        mov bx, 0
L_49FB:
        mov ax, word ptr [si + 6dd8h]
        call _GRP_404A1943
        add ax, word ptr [si + 762h]
        mov bx, 0ffffh
        call _GRP_404A1943
        sub ax, word ptr [si + 762h]
        test byte ptr [bp + 74aah], 6
        je short L_4A30
        mov bx, word ptr [si + 4c0h]
        shl bx, 1
        add ax, bx
        mov word ptr [si + 6eb6h], ax
        cmp byte ptr [bp + 7456h], 60h
        jne short L_4A30
        mov word ptr ds:[_g_007e2], 0ffffh
L_4A30:
        mov ax, word ptr [si + 6eb6h]
        sub ax, word ptr [si + 4c0h]
        sub ax, word ptr [si + 762h]
        sub ax, word ptr [si + 510h]
        mov bx, word ptr ds:[_g_007d4]
        call _GRP_404A1943
        add ax, word ptr [si + 762h]
        mov bx, 0ffffh
        call _GRP_404A1943
        mov ax, word ptr [si + 6eb6h]
        mov bx, word ptr ds:[_g_007e2]
        call _GRP_404A1943
        add ax, word ptr [si + 762h]
        mov bx, 0ffffh
        call _GRP_404A1943
        mov ax, 140h
        mov bx, word ptr ds:[_g_007d4]
        call _GRP_404A1943
        jmp near ptr L_485C
_fn_circuit_cga_0476e ENDP
_TEXT ENDS
END
