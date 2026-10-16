.8086
EXTRN _FN_CYCLES_CGA_05710:FAR
EXTRN _fn_cycles_cga_07a0e:FAR
EXTRN _fn_cycles_cga_07a1d:FAR
EXTRN _fn_cycles_cga_0a836:FAR
EXTRN _polygon_scan_convert:FAR
EXTRN _g_cga_a4f6:BYTE
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        db 6238h dup (0)
        PUBLIC _fn_cycles_cga_0b788
_fn_cycles_cga_0b788 PROC FAR
L_0B788:
        push bp
L_0B789:
        mov bp, sp
L_0B78B:
        sub sp, 1Eh
L_0B78E:
        push si
L_0B78F:
        push di
L_0B790:
        lea si, [bp + 0Ah]
L_0B793:
        mov word ptr [bp - 2], si
L_0B796:
        mov cx, word ptr [bp + 8]
L_0B799:
        mov ax, 12h
L_0B79C:
        mul cx
L_0B79E:
        mov dx, cx
L_0B7A0:
        shl dx, 1
L_0B7A2:
        shl dx, 1
L_0B7A4:
        shl dx, 1
L_0B7A6:
        shl dx, 1
L_0B7A8:
        mov word ptr [bp - 1Ch], ax
L_0B7AB:
        sub sp, ax
L_0B7AD:
        mov ax, cx
L_0B7AF:
        dec ax
L_0B7B0:
        shl ax, 1
L_0B7B2:
        shl ax, 1
L_0B7B4:
        add ax, si
L_0B7B6:
        mov word ptr [bp - 4], ax
L_0B7B9:
        mov ax, word ptr [si + 2]
L_0B7BC:
        mov word ptr [bp - 6], ax
L_0B7BF:
        mov word ptr [bp - 0Ah], ax
L_0B7C2:
        mov word ptr [bp - 8], si
L_0B7C5:
        mov word ptr [bp - 0Ch], si
L_0B7C8:
        add si, 4
L_0B7CB:
        mov dx, 1
L_0B7CE:
        dec cx
L_0B7CF:
        jne SHORT L_0B7D4
L_0B7D1:
        jmp NEAR PTR L_0B8AE
L_0B7D4:
        mov ax, word ptr [si + 2]
L_0B7D7:
        cmp ax, word ptr [bp - 6]
L_0B7DA:
        jg SHORT L_0B7EC
L_0B7DC:
        jne SHORT L_0B7E2
L_0B7DE:
        or dx, dx
L_0B7E0:
        jne SHORT L_0B7EE
L_0B7E2:
        mov word ptr [bp - 6], ax
L_0B7E5:
        mov word ptr [bp - 8], si
L_0B7E8:
        inc dx
L_0B7E9:
        jmp SHORT L_0B7EE
L_0B7EB:
        nop
L_0B7EC:
        xor dx, dx
L_0B7EE:
        cmp ax, word ptr [bp - 0Ah]
L_0B7F1:
        jle SHORT L_0B7F9
L_0B7F3:
        mov word ptr [bp - 0Ah], ax
L_0B7F6:
        mov word ptr [bp - 0Ch], si
L_0B7F9:
        add si, 4
L_0B7FC:
        loop L_0B7D4
L_0B7FE:
        mov ax, word ptr [bp - 6]
L_0B801:
        cmp ax, word ptr [bp - 0Ah]
L_0B804:
        jne SHORT L_0B842
L_0B806:
        mov cx, word ptr [bp + 8]
L_0B809:
        lea si, [bp + 0Ah]
L_0B80C:
        mov bx, word ptr [si]
L_0B80E:
        mov dx, bx
L_0B810:
        dec cx
L_0B811:
        add si, 4
L_0B814:
        mov ax, word ptr [si]
L_0B816:
        cmp ax, bx
L_0B818:
        jge SHORT L_0B81C
L_0B81A:
        mov bx, ax
L_0B81C:
        cmp ax, dx
L_0B81E:
        jle SHORT L_0B822
L_0B820:
        mov dx, ax
L_0B822:
        loop L_0B811
L_0B824:
        push word ptr [bp + 6]
L_0B827:
        lea si, [bp + 0Ah]
L_0B82A:
        mov ax, word ptr [si + 2]
L_0B82D:
        push ax
L_0B82E:
        push dx
L_0B82F:
        push ax
L_0B830:
        push bx
L_0B831:
        call FAR PTR _FN_CYCLES_CGA_05710
L_0B836:
        add sp, 0Ah
L_0B839:
        add sp, word ptr [bp - 1Ch]
L_0B83C:
        pop di
L_0B83D:
        pop si
L_0B83E:
        mov sp, bp
L_0B840:
        pop bp
L_0B841:
        retf
L_0B842:
        lea di, [bp - 1Eh]
L_0B845:
        sub di, word ptr [bp - 1Ch]
L_0B848:
        sub di, 4
L_0B84B:
        mov word ptr [bp - 0Eh], di
L_0B84E:
        mov byte ptr [bp - 1Ah], 0
L_0B852:
        mov word ptr [bp - 10h], 0
L_0B857:
        mov si, word ptr [bp - 8]
L_0B85A:
        cmp si, word ptr [bp - 0Ch]
L_0B85D:
        je SHORT L_0B8A8
L_0B85F:
        push di
L_0B860:
        push word ptr [si + 2]
L_0B863:
        push word ptr [si]
L_0B865:
        add si, 4
L_0B868:
        cmp si, word ptr [bp - 4]
L_0B86B:
        jle SHORT L_0B870
L_0B86D:
        mov si, word ptr [bp - 2]
L_0B870:
        push word ptr [si + 2]
L_0B873:
        push word ptr [si]
L_0B875:
        cmp byte ptr [bp - 1Ah], 0
L_0B879:
        jne SHORT L_0B89B
L_0B87B:
        call FAR PTR _fn_cycles_cga_07a0e
L_0B880:
        cmp byte ptr [di + 0Eh], 8
L_0B884:
        je SHORT L_0B896
L_0B886:
        mov byte ptr [bp - 1Ah], 1
L_0B88A:
        mov word ptr [bp - 0Eh], di
L_0B88D:
        inc word ptr [bp - 10h]
L_0B890:
        mov word ptr [bp - 16h], di
L_0B893:
        add di, 12h
L_0B896:
        add sp, 0Ah
L_0B899:
        jmp SHORT L_0B85A
L_0B89B:
        call FAR PTR _fn_cycles_cga_07a1d
L_0B8A0:
        cmp byte ptr [di + 0Eh], 8
L_0B8A4:
        jne SHORT L_0B88D
L_0B8A6:
        jmp SHORT L_0B896
L_0B8A8:
        cmp byte ptr [bp - 1Ah], 0
L_0B8AC:
        jne SHORT L_0B8CA
L_0B8AE:
        push word ptr [bp + 6]
L_0B8B1:
        lea si, [bp + 0Ah]
L_0B8B4:
        push word ptr [si + 2]
L_0B8B7:
        push word ptr [si]
L_0B8B9:
        call FAR PTR _fn_cycles_cga_0a836
L_0B8BE:
        add sp, 6
L_0B8C1:
        add sp, word ptr [bp - 1Ch]
L_0B8C4:
        pop di
L_0B8C5:
        pop si
L_0B8C6:
        mov sp, bp
L_0B8C8:
        pop bp
L_0B8C9:
        retf
L_0B8CA:
        mov word ptr [bp - 12h], di
L_0B8CD:
        mov word ptr [bp - 14h], 0
L_0B8D2:
        mov byte ptr [bp - 1Ah], 0
L_0B8D6:
        mov si, word ptr [bp - 8]
L_0B8D9:
        cmp si, word ptr [bp - 0Ch]
L_0B8DC:
        je SHORT L_0B927
L_0B8DE:
        push di
L_0B8DF:
        push word ptr [si + 2]
L_0B8E2:
        push word ptr [si]
L_0B8E4:
        sub si, 4
L_0B8E7:
        cmp si, word ptr [bp - 2]
L_0B8EA:
        jge SHORT L_0B8EF
L_0B8EC:
        mov si, word ptr [bp - 4]
L_0B8EF:
        push word ptr [si + 2]
L_0B8F2:
        push word ptr [si]
L_0B8F4:
        cmp byte ptr [bp - 1Ah], 0
L_0B8F8:
        jne SHORT L_0B91A
L_0B8FA:
        call FAR PTR _fn_cycles_cga_07a0e
L_0B8FF:
        cmp byte ptr [di + 0Eh], 8
L_0B903:
        je SHORT L_0B915
L_0B905:
        mov byte ptr [bp - 1Ah], 1
L_0B909:
        mov word ptr [bp - 12h], di
L_0B90C:
        inc word ptr [bp - 14h]
L_0B90F:
        mov word ptr [bp - 18h], di
L_0B912:
        add di, 12h
L_0B915:
        add sp, 0Ah
L_0B918:
        jmp SHORT L_0B8D9
L_0B91A:
        call FAR PTR _fn_cycles_cga_07a1d
L_0B91F:
        cmp byte ptr [di + 0Eh], 8
L_0B923:
        jne SHORT L_0B90C
L_0B925:
        jmp SHORT L_0B915
L_0B927:
        cmp byte ptr [bp - 1Ah], 0
L_0B92B:
        je SHORT L_0B8AE
L_0B92D:
        mov di, word ptr [bp - 0Eh]
L_0B930:
        mov dl, byte ptr [di + 0Eh]
L_0B933:
        xor dh, dh
L_0B935:
        mov si, word ptr [bp - 12h]
L_0B938:
        or dx, dx
L_0B93A:
        je SHORT L_0B95B
L_0B93C:
        mov bl, byte ptr [si + 0Eh]
L_0B93F:
        and bl, 7
L_0B942:
        xor bh, bh
L_0B944:
        shl bx, 1
L_0B946:
        jmp word ptr cs:[bx + L_SWITCH_TABLE]
L_SWITCH_TABLE LABEL WORD
        DW OFFSET L_0B95B
        DW OFFSET L_0B982
        DW OFFSET L_0B994
        DW OFFSET L_0B9A4
        DW OFFSET L_0B9B1
        DW OFFSET L_0B9CA
        DW OFFSET L_0B9E4
        DW OFFSET L_0B9FE
L_0B95B:
        test byte ptr [di + 10h], 80h
L_0B95F:
        jne SHORT L_0B97F
L_0B961:
        mov ax, word ptr [bp - 10h]
L_0B964:
        mov dx, word ptr [bp - 14h]
L_0B967:
        mov word ptr [bp - 10h], dx
L_0B96A:
        mov word ptr [bp - 14h], ax
L_0B96D:
        mov ax, word ptr [bp - 16h]
L_0B970:
        mov dx, word ptr [bp - 18h]
L_0B973:
        mov word ptr [bp - 16h], dx
L_0B976:
        mov word ptr [bp - 18h], ax
L_0B979:
        mov word ptr [bp - 0Eh], si
L_0B97C:
        mov word ptr [bp - 12h], di
L_0B97F:
        jmp NEAR PTR L_0BA3C
L_0B982:
        cmp dx, 1
L_0B985:
        je SHORT L_0B9A1
L_0B987:
        mov bx, dx
L_0B989:
        mov al, byte ptr [bx + _g_cga_a4f6]
L_0B98D:
        or al, al
L_0B98F:
        jne SHORT L_0B961
L_0B991:
        jmp NEAR PTR L_0BA3C
L_0B994:
        cmp dx, 2
L_0B997:
        je SHORT L_0B9A1
L_0B999:
        mov bx, dx
L_0B99B:
        mov al, byte ptr [bx + _g_cga_a4f6 + 8]
L_0B99F:
        jmp SHORT L_0B98D
L_0B9A1:
        jmp SHORT L_0BA18
L_0B9A3:
        nop
L_0B9A4:
        cmp dx, 3
L_0B9A7:
        je SHORT L_0BA18
L_0B9A9:
        mov bx, dx
L_0B9AB:
        mov al, byte ptr [bx + _g_cga_a4f6 + 16]
L_0B9AF:
        jmp SHORT L_0B98D
L_0B9B1:
        cmp dx, 4
L_0B9B4:
        je SHORT L_0B9BE
L_0B9B6:
        mov bx, dx
L_0B9B8:
        mov al, byte ptr [bx + _g_cga_a4f6 + 24]
L_0B9BC:
        jmp SHORT L_0B98D
L_0B9BE:
        mov ax, word ptr [si + 8]
L_0B9C1:
        cmp ax, word ptr [di + 8]
L_0B9C4:
        je SHORT L_0BA18
L_0B9C6:
        ja SHORT L_0BA3C
L_0B9C8:
        jmp SHORT L_0B961
L_0B9CA:
        cmp dx, 5
L_0B9CD:
        je SHORT L_0B9D7
L_0B9CF:
        mov bx, dx
L_0B9D1:
        mov al, byte ptr [bx + _g_cga_a4f6 + 32]
L_0B9D5:
        jmp SHORT L_0B98D
L_0B9D7:
        mov ax, word ptr [si + 8]
L_0B9DA:
        cmp ax, word ptr [di + 8]
L_0B9DD:
        je SHORT L_0BA18
L_0B9DF:
        jb SHORT L_0BA3C
L_0B9E1:
        jmp NEAR PTR L_0B961
L_0B9E4:
        cmp dx, 6
L_0B9E7:
        je SHORT L_0B9F1
L_0B9E9:
        mov bx, dx
L_0B9EB:
        mov al, byte ptr [bx + _g_cga_a4f6 + 40]
L_0B9EF:
        jmp SHORT L_0B98D
L_0B9F1:
        mov ax, word ptr [si + 8]
L_0B9F4:
        cmp ax, word ptr [di + 8]
L_0B9F7:
        je SHORT L_0BA18
L_0B9F9:
        jb SHORT L_0BA3C
L_0B9FB:
        jmp NEAR PTR L_0B961
L_0B9FE:
        cmp dx, 7
L_0BA01:
        je SHORT L_0BA0B
L_0BA03:
        mov bx, dx
L_0BA05:
        mov al, byte ptr [bx + _g_cga_a4f6 + 48]
L_0BA09:
        jmp SHORT L_0B98D
L_0BA0B:
        mov ax, word ptr [si + 8]
L_0BA0E:
        cmp ax, word ptr [di + 8]
L_0BA11:
        je SHORT L_0BA18
L_0BA13:
        ja SHORT L_0BA3C
L_0BA15:
        jmp NEAR PTR L_0B961
L_0BA18:
        push word ptr [bp + 6]
L_0BA1B:
        mov si, word ptr [bp - 8]
L_0BA1E:
        push word ptr [si + 2]
L_0BA21:
        push word ptr [si]
L_0BA23:
        mov si, word ptr [bp - 0Ch]
L_0BA26:
        push word ptr [si + 2]
L_0BA29:
        push word ptr [si]
L_0BA2B:
        call FAR PTR _FN_CYCLES_CGA_05710
L_0BA30:
        add sp, 0Ah
L_0BA33:
        add sp, word ptr [bp - 1Ch]
L_0BA36:
        pop di
L_0BA37:
        pop si
L_0BA38:
        mov sp, bp
L_0BA3A:
        pop bp
L_0BA3B:
        retf
L_0BA3C:
        mov si, word ptr [bp - 12h]
L_0BA3F:
        cmp byte ptr [si + 0Eh], 0
L_0BA43:
        jne SHORT L_0BA51
L_0BA45:
        mov al, byte ptr [si + 10h]
L_0BA48:
        mov ah, byte ptr [si + 11h]
L_0BA4B:
        mov byte ptr [si + 10h], ah
L_0BA4E:
        mov byte ptr [si + 11h], al
L_0BA51:
        mov si, word ptr [bp - 16h]
L_0BA54:
        cmp byte ptr [si + 0Eh], 0
L_0BA58:
        jne SHORT L_0BA66
L_0BA5A:
        mov al, byte ptr [si + 10h]
L_0BA5D:
        mov ah, byte ptr [si + 11h]
L_0BA60:
        mov byte ptr [si + 10h], ah
L_0BA63:
        mov byte ptr [si + 11h], al
L_0BA66:
        xor ax, ax
L_0BA68:
        push ax
L_0BA69:
        mov cx, word ptr [bp - 10h]
L_0BA6C:
        mov si, word ptr [bp - 16h]
L_0BA6F:
        push si
L_0BA70:
        sub si, 12h
L_0BA73:
        loop L_0BA6F
L_0BA75:
        push ax
L_0BA76:
        mov cx, word ptr [bp - 14h]
L_0BA79:
        mov si, word ptr [bp - 18h]
L_0BA7C:
        push si
L_0BA7D:
        sub si, 12h
L_0BA80:
        loop L_0BA7C
L_0BA82:
        push word ptr [bp + 6]
L_0BA85:
        call FAR PTR _polygon_scan_convert
L_0BA8A:
        mov ax, word ptr [bp - 10h]
L_0BA8D:
        add ax, word ptr [bp - 14h]
L_0BA90:
        shl ax, 1
L_0BA92:
        add sp, ax
L_0BA94:
        add sp, 6
L_0BA97:
        add sp, word ptr [bp - 1Ch]
L_0BA9A:
        pop di
L_0BA9B:
        pop si
L_0BA9C:
        mov sp, bp
L_0BA9E:
        pop bp
L_0BA9F:
        retf
_fn_cycles_cga_0b788 ENDP
_TEXT ENDS
END
