.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
CYCLES_EGA_INIT_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CYCLES_EGA_INIT_TEXT, DS:DGROUP
        EXTRN _G_0EF6:WORD, _G_0EF8:WORD, _G_881C:WORD
        EXTRN _fn_cycles_ega_00794:NEAR
        PUBLIC _grp_b2156e5d
_grp_b2156e5d PROC NEAR
        mov cx, 0064h
        mov ax, 0FFFFh
        mov di, 7996h
        rep stosw
        mov WORD PTR ds:[_G_0EF6], 0078h
        mov WORD PTR ds:[_G_0EF8], 0
        mov bp, 0
        mov si, 0FFFEh
        mov ax, WORD PTR [bp+851Eh]
        mov di, WORD PTR ds:[_G_881C]
        shl di, 1
        jmp short L_2071
L_203C:
        mov cx, WORD PTR [bp+881Ch]
        cmp cx, WORD PTR [si+881Ch]
        jae short L_208B
        cmp cx, WORD PTR ds:[_G_0EF6]
        jb short L_204E
        jmp short L_208B
L_204E:
        mov WORD PTR ds:[_G_0EF6], cx
        mov WORD PTR ds:[_G_0EF8], bp
        mov ax, WORD PTR [bp+851Eh]
        mov bx, WORD PTR [si+851Eh]
        mov dx, cx
        sub dx, WORD PTR [si+881Ch]
        neg dx
        mov di, cx
        shl di, 1
        cmp dl, 1
        je short L_2071
        jmp short L_20C2
L_2071:
        mov WORD PTR [di+6F06h], ax
        mov ax, WORD PTR [bp+1644h]
        mov WORD PTR [di+10ACh], ax
        mov WORD PTR [di+7996h], bp
        mov ax, WORD PTR [bp+82BEh]
        mov WORD PTR [di+69BEh], ax
L_2089:
        mov si, bp
L_208B:
        mov ax, WORD PTR ds:[_G_0EF6]
        mov WORD PTR [bp+864Eh], ax
        inc bp
        inc bp
        cmp bp, 004Ch
        jge short L_209B
        jmp short L_203C
L_209B:
        mov bx, WORD PTR ds:[_G_0EF6]
        shl bx, 1
        mov si, WORD PTR ds:[_G_881C]
        shl si, 1
        xor cx, cx
        xor ax, ax
L_20AB:
        mov ax, WORD PTR [si+7996h]
        or ax, ax
        jge short L_20B9
        mov WORD PTR [si+7996h], cx
        mov ax, cx
L_20B9:
        mov cx, ax
        dec si
        dec si
        cmp si, bx
        jg short L_20AB
        ret
L_20C2:
        sub cx, WORD PTR [si+881Ch]
        neg cx
        push ax
        push bx
        mov WORD PTR [di+7996h], bp
        pop bx
        pop ax
        push di
        push cx
        push dx
        add di, 6F06h
        call NEAR PTR _fn_cycles_ega_00794
        pop dx
        pop cx
        pop di
        push di
        push cx
        push dx
        add di, 10ACh
        mov ax, WORD PTR [bp+1644h]
        mov bx, WORD PTR [si+1644h]
        call NEAR PTR _fn_cycles_ega_00794
        pop dx
        pop cx
        pop di
        mov al, BYTE PTR [bp+89E0h]
        cmp al, 2
        jne short L_2089
        add di, 69BEh
        mov ax, WORD PTR [bp+82BEh]
        mov bx, WORD PTR [si+82BEh]
        call NEAR PTR _fn_cycles_ega_00794
        jmp L_2089
_grp_b2156e5d ENDP
CYCLES_EGA_INIT_TEXT ENDS
        END
