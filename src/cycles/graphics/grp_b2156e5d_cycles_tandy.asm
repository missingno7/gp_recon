.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
CYCLES_TANDY_INIT_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CYCLES_TANDY_INIT_TEXT, DS:DGROUP
        EXTRN _G_0EF6:WORD, _G_0EF8:WORD, _G_881C:WORD
        EXTRN _fn_cycles_tandy_00794:NEAR
        PUBLIC _grp_b2156e5d
_grp_b2156e5d PROC NEAR
        mov cx, 0064h
        mov ax, 0FFFFh
        mov di, 7974h
        rep stosw
        mov WORD PTR ds:[_G_0EF6], 0078h
        mov WORD PTR ds:[_G_0EF8], 0
        mov bp, 0
        mov si, 0FFFEh
        mov ax, WORD PTR [bp+84FCh]
        mov di, WORD PTR ds:[_G_881C]
        shl di, 1
        jmp short L_1F45
L_1F10:
        mov cx, WORD PTR [bp+87FAh]
        cmp cx, WORD PTR [si+87FAh]
        jae short L_1F5F
        cmp cx, WORD PTR ds:[_G_0EF6]
        jb short L_1F22
        jmp short L_1F5F
L_1F22:
        mov WORD PTR ds:[_G_0EF6], cx
        mov WORD PTR ds:[_G_0EF8], bp
        mov ax, WORD PTR [bp+84FCh]
        mov bx, WORD PTR [si+84FCh]
        mov dx, cx
        sub dx, WORD PTR [si+87FAh]
        neg dx
        mov di, cx
        shl di, 1
        cmp dl, 1
        je short L_1F45
        jmp short L_1F96
L_1F45:
        mov WORD PTR [di+6EE4h], ax
        mov ax, WORD PTR [bp+1644h]
        mov WORD PTR [di+10ACh], ax
        mov WORD PTR [di+7974h], bp
        mov ax, WORD PTR [bp+829Ch]
        mov WORD PTR [di+699Ch], ax
L_1F5D:
        mov si, bp
L_1F5F:
        mov ax, WORD PTR ds:[_G_0EF6]
        mov WORD PTR [bp+862Ch], ax
        inc bp
        inc bp
        cmp bp, 004Ch
        jge short L_1F6F
        jmp short L_1F10
L_1F6F:
        mov bx, WORD PTR ds:[_G_0EF6]
        shl bx, 1
        mov si, WORD PTR ds:[_G_881C]
        shl si, 1
        xor cx, cx
        xor ax, ax
L_1F7F:
        mov ax, WORD PTR [si+7974h]
        or ax, ax
        jge short L_1F8D
        mov WORD PTR [si+7974h], cx
        mov ax, cx
L_1F8D:
        mov cx, ax
        dec si
        dec si
        cmp si, bx
        jg short L_1F7F
        ret
L_1F96:
        sub cx, WORD PTR [si+87FAh]
        neg cx
        push ax
        push bx
        mov WORD PTR [di+7974h], bp
        pop bx
        pop ax
        push di
        push cx
        push dx
        add di, 6EE4h
        call NEAR PTR _fn_cycles_tandy_00794
        pop dx
        pop cx
        pop di
        push di
        push cx
        push dx
        add di, 10ACh
        mov ax, WORD PTR [bp+1644h]
        mov bx, WORD PTR [si+1644h]
        call NEAR PTR _fn_cycles_tandy_00794
        pop dx
        pop cx
        pop di
        mov al, BYTE PTR [bp+89BEh]
        cmp al, 2
        jne short L_1F5D
        add di, 699Ch
        mov ax, WORD PTR [bp+829Ch]
        mov bx, WORD PTR [si+829Ch]
        call NEAR PTR _fn_cycles_tandy_00794
        jmp L_1F5D
_grp_b2156e5d ENDP
CYCLES_TANDY_INIT_TEXT ENDS
        END
