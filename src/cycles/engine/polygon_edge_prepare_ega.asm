.8086
EXTRN _FN_CYCLES_CGA_05710:FAR
EXTRN _fn_cycles_ega_0b0e5:FAR
EXTRN _fn_cycles_ega_0c47a:FAR
EXTRN _fn_cycles_ega_0c489:FAR
EXTRN _polygon_scan_convert:FAR
EXTRN _g_cga_a4f6:BYTE
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        db 81E0h dup (0)
        PUBLIC _fn_cycles_ega_0d880
_fn_cycles_ega_0d880 PROC FAR
L_0D880:
        push bp
L_0D881:
        mov bp, sp
L_0D883:
        sub sp, 1Eh
L_0D886:
        push si
L_0D887:
        push di
L_0D888:
        lea si, [bp + 0Ah]
L_0D88B:
        mov word ptr [bp - 2], si
L_0D88E:
        mov cx, word ptr [bp + 8]
L_0D891:
        mov ax, 12h
L_0D894:
        mul cx
L_0D896:
        mov dx, cx
L_0D898:
        shl dx, 1
L_0D89A:
        shl dx, 1
L_0D89C:
        shl dx, 1
L_0D89E:
        shl dx, 1
L_0D8A0:
        mov word ptr [bp - 1Ch], ax
L_0D8A3:
        sub sp, ax
L_0D8A5:
        mov ax, cx
L_0D8A7:
        dec ax
L_0D8A8:
        shl ax, 1
L_0D8AA:
        shl ax, 1
L_0D8AC:
        add ax, si
L_0D8AE:
        mov word ptr [bp - 4], ax
L_0D8B1:
        mov ax, word ptr [si + 2]
L_0D8B4:
        mov word ptr [bp - 6], ax
L_0D8B7:
        mov word ptr [bp - 0Ah], ax
L_0D8BA:
        mov word ptr [bp - 8], si
L_0D8BD:
        mov word ptr [bp - 0Ch], si
L_0D8C0:
        add si, 4
L_0D8C3:
        mov dx, 1
L_0D8C6:
        dec cx
L_0D8C7:
        jne SHORT L_0D8CC
L_0D8C9:
        jmp NEAR PTR L_0D9A6
L_0D8CC:
        mov ax, word ptr [si + 2]
L_0D8CF:
        cmp ax, word ptr [bp - 6]
L_0D8D2:
        jg SHORT L_0D8E4
L_0D8D4:
        jne SHORT L_0D8DA
L_0D8D6:
        or dx, dx
L_0D8D8:
        jne SHORT L_0D8E6
L_0D8DA:
        mov word ptr [bp - 6], ax
L_0D8DD:
        mov word ptr [bp - 8], si
L_0D8E0:
        inc dx
L_0D8E1:
        jmp SHORT L_0D8E6
L_0D8E3:
        nop
L_0D8E4:
        xor dx, dx
L_0D8E6:
        cmp ax, word ptr [bp - 0Ah]
L_0D8E9:
        jle SHORT L_0D8F1
L_0D8EB:
        mov word ptr [bp - 0Ah], ax
L_0D8EE:
        mov word ptr [bp - 0Ch], si
L_0D8F1:
        add si, 4
L_0D8F4:
        loop L_0D8CC
L_0D8F6:
        mov ax, word ptr [bp - 6]
L_0D8F9:
        cmp ax, word ptr [bp - 0Ah]
L_0D8FC:
        jne SHORT L_0D93A
L_0D8FE:
        mov cx, word ptr [bp + 8]
L_0D901:
        lea si, [bp + 0Ah]
L_0D904:
        mov bx, word ptr [si]
L_0D906:
        mov dx, bx
L_0D908:
        dec cx
L_0D909:
        add si, 4
L_0D90C:
        mov ax, word ptr [si]
L_0D90E:
        cmp ax, bx
L_0D910:
        jge SHORT L_0D914
L_0D912:
        mov bx, ax
L_0D914:
        cmp ax, dx
L_0D916:
        jle SHORT L_0D91A
L_0D918:
        mov dx, ax
L_0D91A:
        loop L_0D909
L_0D91C:
        push word ptr [bp + 6]
L_0D91F:
        lea si, [bp + 0Ah]
L_0D922:
        mov ax, word ptr [si + 2]
L_0D925:
        push ax
L_0D926:
        push dx
L_0D927:
        push ax
L_0D928:
        push bx
L_0D929:
        call FAR PTR _FN_CYCLES_CGA_05710
L_0D92E:
        add sp, 0Ah
L_0D931:
        add sp, word ptr [bp - 1Ch]
L_0D934:
        pop di
L_0D935:
        pop si
L_0D936:
        mov sp, bp
L_0D938:
        pop bp
L_0D939:
        retf
L_0D93A:
        lea di, [bp - 1Eh]
L_0D93D:
        sub di, word ptr [bp - 1Ch]
L_0D940:
        sub di, 4
L_0D943:
        mov word ptr [bp - 0Eh], di
L_0D946:
        mov byte ptr [bp - 1Ah], 0
L_0D94A:
        mov word ptr [bp - 10h], 0
L_0D94F:
        mov si, word ptr [bp - 8]
L_0D952:
        cmp si, word ptr [bp - 0Ch]
L_0D955:
        je SHORT L_0D9A0
L_0D957:
        push di
L_0D958:
        push word ptr [si + 2]
L_0D95B:
        push word ptr [si]
L_0D95D:
        add si, 4
L_0D960:
        cmp si, word ptr [bp - 4]
L_0D963:
        jle SHORT L_0D968
L_0D965:
        mov si, word ptr [bp - 2]
L_0D968:
        push word ptr [si + 2]
L_0D96B:
        push word ptr [si]
L_0D96D:
        cmp byte ptr [bp - 1Ah], 0
L_0D971:
        jne SHORT L_0D993
L_0D973:
        call FAR PTR _fn_cycles_ega_0c47a
L_0D978:
        cmp byte ptr [di + 0Eh], 8
L_0D97C:
        je SHORT L_0D98E
L_0D97E:
        mov byte ptr [bp - 1Ah], 1
L_0D982:
        mov word ptr [bp - 0Eh], di
L_0D985:
        inc word ptr [bp - 10h]
L_0D988:
        mov word ptr [bp - 16h], di
L_0D98B:
        add di, 12h
L_0D98E:
        add sp, 0Ah
L_0D991:
        jmp SHORT L_0D952
L_0D993:
        call FAR PTR _fn_cycles_ega_0c489
L_0D998:
        cmp byte ptr [di + 0Eh], 8
L_0D99C:
        jne SHORT L_0D985
L_0D99E:
        jmp SHORT L_0D98E
L_0D9A0:
        cmp byte ptr [bp - 1Ah], 0
L_0D9A4:
        jne SHORT L_0D9C2
L_0D9A6:
        push word ptr [bp + 6]
L_0D9A9:
        lea si, [bp + 0Ah]
L_0D9AC:
        push word ptr [si + 2]
L_0D9AF:
        push word ptr [si]
L_0D9B1:
        call FAR PTR _fn_cycles_ega_0b0e5
L_0D9B6:
        add sp, 6
L_0D9B9:
        add sp, word ptr [bp - 1Ch]
L_0D9BC:
        pop di
L_0D9BD:
        pop si
L_0D9BE:
        mov sp, bp
L_0D9C0:
        pop bp
L_0D9C1:
        retf
L_0D9C2:
        mov word ptr [bp - 12h], di
L_0D9C5:
        mov word ptr [bp - 14h], 0
L_0D9CA:
        mov byte ptr [bp - 1Ah], 0
L_0D9CE:
        mov si, word ptr [bp - 8]
L_0D9D1:
        cmp si, word ptr [bp - 0Ch]
L_0D9D4:
        je SHORT L_0DA1F
L_0D9D6:
        push di
L_0D9D7:
        push word ptr [si + 2]
L_0D9DA:
        push word ptr [si]
L_0D9DC:
        sub si, 4
L_0D9DF:
        cmp si, word ptr [bp - 2]
L_0D9E2:
        jge SHORT L_0D9E7
L_0D9E4:
        mov si, word ptr [bp - 4]
L_0D9E7:
        push word ptr [si + 2]
L_0D9EA:
        push word ptr [si]
L_0D9EC:
        cmp byte ptr [bp - 1Ah], 0
L_0D9F0:
        jne SHORT L_0DA12
L_0D9F2:
        call FAR PTR _fn_cycles_ega_0c47a
L_0D9F7:
        cmp byte ptr [di + 0Eh], 8
L_0D9FB:
        je SHORT L_0DA0D
L_0D9FD:
        mov byte ptr [bp - 1Ah], 1
L_0DA01:
        mov word ptr [bp - 12h], di
L_0DA04:
        inc word ptr [bp - 14h]
L_0DA07:
        mov word ptr [bp - 18h], di
L_0DA0A:
        add di, 12h
L_0DA0D:
        add sp, 0Ah
L_0DA10:
        jmp SHORT L_0D9D1
L_0DA12:
        call FAR PTR _fn_cycles_ega_0c489
L_0DA17:
        cmp byte ptr [di + 0Eh], 8
L_0DA1B:
        jne SHORT L_0DA04
L_0DA1D:
        jmp SHORT L_0DA0D
L_0DA1F:
        cmp byte ptr [bp - 1Ah], 0
L_0DA23:
        je SHORT L_0D9A6
L_0DA25:
        mov di, word ptr [bp - 0Eh]
L_0DA28:
        mov dl, byte ptr [di + 0Eh]
L_0DA2B:
        xor dh, dh
L_0DA2D:
        mov si, word ptr [bp - 12h]
L_0DA30:
        or dx, dx
L_0DA32:
        je SHORT L_0DA53
L_0DA34:
        mov bl, byte ptr [si + 0Eh]
L_0DA37:
        and bl, 7
L_0DA3A:
        xor bh, bh
L_0DA3C:
        shl bx, 1
L_0DA3E:
        jmp word ptr cs:[bx - 7C5Dh]
L_SWITCH_TABLE LABEL WORD
        DW OFFSET L_0DA53
        DW OFFSET L_0DA7A
        DW OFFSET L_0DA8C
        DW OFFSET L_0DA9C
        DW OFFSET L_0DAA9
        DW OFFSET L_0DAC2
        DW OFFSET L_0DADC
        DW OFFSET L_0DAF6
L_0DA53:
        test byte ptr [di + 10h], 80h
L_0DA57:
        jne SHORT L_0DA77
L_0DA59:
        mov ax, word ptr [bp - 10h]
L_0DA5C:
        mov dx, word ptr [bp - 14h]
L_0DA5F:
        mov word ptr [bp - 10h], dx
L_0DA62:
        mov word ptr [bp - 14h], ax
L_0DA65:
        mov ax, word ptr [bp - 16h]
L_0DA68:
        mov dx, word ptr [bp - 18h]
L_0DA6B:
        mov word ptr [bp - 16h], dx
L_0DA6E:
        mov word ptr [bp - 18h], ax
L_0DA71:
        mov word ptr [bp - 0Eh], si
L_0DA74:
        mov word ptr [bp - 12h], di
L_0DA77:
        jmp NEAR PTR L_0DB34
L_0DA7A:
        cmp dx, 1
L_0DA7D:
        je SHORT L_0DA99
L_0DA7F:
        mov bx, dx
L_0DA81:
        mov al, byte ptr [bx + _g_cga_a4f6]
L_0DA85:
        or al, al
L_0DA87:
        jne SHORT L_0DA59
L_0DA89:
        jmp NEAR PTR L_0DB34
L_0DA8C:
        cmp dx, 2
L_0DA8F:
        je SHORT L_0DA99
L_0DA91:
        mov bx, dx
L_0DA93:
        mov al, byte ptr [bx + _g_cga_a4f6 + 8]
L_0DA97:
        jmp SHORT L_0DA85
L_0DA99:
        jmp SHORT L_0DB10
L_0DA9B:
        nop
L_0DA9C:
        cmp dx, 3
L_0DA9F:
        je SHORT L_0DB10
L_0DAA1:
        mov bx, dx
L_0DAA3:
        mov al, byte ptr [bx + _g_cga_a4f6 + 16]
L_0DAA7:
        jmp SHORT L_0DA85
L_0DAA9:
        cmp dx, 4
L_0DAAC:
        je SHORT L_0DAB6
L_0DAAE:
        mov bx, dx
L_0DAB0:
        mov al, byte ptr [bx + _g_cga_a4f6 + 24]
L_0DAB4:
        jmp SHORT L_0DA85
L_0DAB6:
        mov ax, word ptr [si + 8]
L_0DAB9:
        cmp ax, word ptr [di + 8]
L_0DABC:
        je SHORT L_0DB10
L_0DABE:
        ja SHORT L_0DB34
L_0DAC0:
        jmp SHORT L_0DA59
L_0DAC2:
        cmp dx, 5
L_0DAC5:
        je SHORT L_0DACF
L_0DAC7:
        mov bx, dx
L_0DAC9:
        mov al, byte ptr [bx + _g_cga_a4f6 + 32]
L_0DACD:
        jmp SHORT L_0DA85
L_0DACF:
        mov ax, word ptr [si + 8]
L_0DAD2:
        cmp ax, word ptr [di + 8]
L_0DAD5:
        je SHORT L_0DB10
L_0DAD7:
        jb SHORT L_0DB34
L_0DAD9:
        jmp NEAR PTR L_0DA59
L_0DADC:
        cmp dx, 6
L_0DADF:
        je SHORT L_0DAE9
L_0DAE1:
        mov bx, dx
L_0DAE3:
        mov al, byte ptr [bx + _g_cga_a4f6 + 40]
L_0DAE7:
        jmp SHORT L_0DA85
L_0DAE9:
        mov ax, word ptr [si + 8]
L_0DAEC:
        cmp ax, word ptr [di + 8]
L_0DAEF:
        je SHORT L_0DB10
L_0DAF1:
        jb SHORT L_0DB34
L_0DAF3:
        jmp NEAR PTR L_0DA59
L_0DAF6:
        cmp dx, 7
L_0DAF9:
        je SHORT L_0DB03
L_0DAFB:
        mov bx, dx
L_0DAFD:
        mov al, byte ptr [bx + _g_cga_a4f6 + 48]
L_0DB01:
        jmp SHORT L_0DA85
L_0DB03:
        mov ax, word ptr [si + 8]
L_0DB06:
        cmp ax, word ptr [di + 8]
L_0DB09:
        je SHORT L_0DB10
L_0DB0B:
        ja SHORT L_0DB34
L_0DB0D:
        jmp NEAR PTR L_0DA59
L_0DB10:
        push word ptr [bp + 6]
L_0DB13:
        mov si, word ptr [bp - 8]
L_0DB16:
        push word ptr [si + 2]
L_0DB19:
        push word ptr [si]
L_0DB1B:
        mov si, word ptr [bp - 0Ch]
L_0DB1E:
        push word ptr [si + 2]
L_0DB21:
        push word ptr [si]
L_0DB23:
        call FAR PTR _FN_CYCLES_CGA_05710
L_0DB28:
        add sp, 0Ah
L_0DB2B:
        add sp, word ptr [bp - 1Ch]
L_0DB2E:
        pop di
L_0DB2F:
        pop si
L_0DB30:
        mov sp, bp
L_0DB32:
        pop bp
L_0DB33:
        retf
L_0DB34:
        mov si, word ptr [bp - 12h]
L_0DB37:
        cmp byte ptr [si + 0Eh], 0
L_0DB3B:
        jne SHORT L_0DB49
L_0DB3D:
        mov al, byte ptr [si + 10h]
L_0DB40:
        mov ah, byte ptr [si + 11h]
L_0DB43:
        mov byte ptr [si + 10h], ah
L_0DB46:
        mov byte ptr [si + 11h], al
L_0DB49:
        mov si, word ptr [bp - 16h]
L_0DB4C:
        cmp byte ptr [si + 0Eh], 0
L_0DB50:
        jne SHORT L_0DB5E
L_0DB52:
        mov al, byte ptr [si + 10h]
L_0DB55:
        mov ah, byte ptr [si + 11h]
L_0DB58:
        mov byte ptr [si + 10h], ah
L_0DB5B:
        mov byte ptr [si + 11h], al
L_0DB5E:
        xor ax, ax
L_0DB60:
        push ax
L_0DB61:
        mov cx, word ptr [bp - 10h]
L_0DB64:
        mov si, word ptr [bp - 16h]
L_0DB67:
        push si
L_0DB68:
        sub si, 12h
L_0DB6B:
        loop L_0DB67
L_0DB6D:
        push ax
L_0DB6E:
        mov cx, word ptr [bp - 14h]
L_0DB71:
        mov si, word ptr [bp - 18h]
L_0DB74:
        push si
L_0DB75:
        sub si, 12h
L_0DB78:
        loop L_0DB74
L_0DB7A:
        push word ptr [bp + 6]
L_0DB7D:
        call FAR PTR _polygon_scan_convert
L_0DB82:
        mov ax, word ptr [bp - 10h]
L_0DB85:
        add ax, word ptr [bp - 14h]
L_0DB88:
        shl ax, 1
L_0DB8A:
        add sp, ax
L_0DB8C:
        add sp, 6
L_0DB8F:
        add sp, word ptr [bp - 1Ch]
L_0DB92:
        pop di
L_0DB93:
        pop si
L_0DB94:
        mov sp, bp
L_0DB96:
        pop bp
L_0DB97:
        retf
_fn_cycles_ega_0d880 ENDP
_TEXT ENDS
END
