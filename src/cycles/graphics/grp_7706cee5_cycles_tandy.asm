.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
CYCLES_TANDY_BASEINIT_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CYCLES_TANDY_BASEINIT_TEXT, DS:DGROUP
        EXTRN _G_0EF6:WORD, _G_0EF8:WORD, _G_881C:WORD
        EXTRN _fn_cycles_tandy_00794:NEAR
        PUBLIC _grp_7706cee5
_grp_7706cee5 PROC NEAR
        mov cx, 166h
        mov ax, 00FFFFh
        mov di, 7974h
        rep stosw
        mov WORD PTR ds:[_G_0EF6], 17Ah
        mov WORD PTR ds:[_G_0EF8], 0
        mov bp, 0
        mov si, 00FFFEh
        mov ax, WORD PTR [bp+84FCh]
        mov di, WORD PTR ds:[_G_881C]
        shl di, 1
        jmp short L_05E6
L_05B1:
        mov cx, WORD PTR [bp+87FAh]
        cmp cx, WORD PTR [si+87FAh]
        jae short L_0600
        cmp cx, WORD PTR ds:[_G_0EF6]
        jb short L_05C3
        jmp short L_0600
L_05C3:
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
        je short L_05E6
        jmp short L_0638
L_05E6:
        mov WORD PTR [di+6EE4h], ax
        mov ax, WORD PTR [bp+1644h]
        mov WORD PTR [di+10ACh], ax
        mov WORD PTR [di+7974h], bp
        mov ax, WORD PTR [bp+829Ch]
        mov WORD PTR [di+699Ch], ax
L_05FE:
        mov si, bp
L_0600:
        mov ax, WORD PTR ds:[_G_0EF6]
        mov WORD PTR [bp+862Ch], ax
        inc bp
        inc bp
        cmp bp, 90h
        jge short L_0611
        jmp short L_05B1
L_0611:
        mov bx, WORD PTR ds:[_G_0EF6]
        shl bx, 1
        mov si, WORD PTR ds:[_G_881C]
        shl si, 1
        xor cx, cx
        xor ax, ax
L_0621:
        mov ax, WORD PTR [si+7974h]
        or ax, ax
        jge short L_062F
        mov WORD PTR [si+7974h], cx
        mov ax, cx
L_062F:
        mov cx, ax
        dec si
        dec si
        cmp si, bx
        jg short L_0621
        ret
L_0638:
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
        jne short L_05FE
        add di, 699Ch
        mov ax, WORD PTR [bp+829Ch]
        mov bx, WORD PTR [si+829Ch]
        call NEAR PTR _fn_cycles_tandy_00794
        jmp L_05FE
_grp_7706cee5 ENDP
CYCLES_TANDY_BASEINIT_TEXT ENDS
        END
