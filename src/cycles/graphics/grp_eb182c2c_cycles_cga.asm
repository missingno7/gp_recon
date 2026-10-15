.8086
CYCLES_CGA_COPY_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CYCLES_CGA_COPY_TEXT
        EXTRN _GRP_7D50CA88:FAR
        PUBLIC _grp_eb182c2c
_grp_eb182c2c PROC FAR
        push bp
        mov bp, sp
        sub sp, 16h
        push di
        push si
        push ds
        cld
        mov ds, WORD PTR [bp+8]
        mov si, WORD PTR [bp+6]
        mov es, WORD PTR [bp+0Ch]
        mov di, WORD PTR [bp+0Ah]
        mov cx, WORD PTR [si+4]
        mov WORD PTR [bp-2], cx
        shl cx, 1
        add cx, 1
        add si, 4
        add di, 4
        rep movsw
        xor ax, ax
        mov WORD PTR [bp-4], ax
        mov WORD PTR [bp-6], di
        mov WORD PTR es:[di], ax
        mov WORD PTR es:[di+2], ax
L_B156:
        mov ax, WORD PTR [bp-4]
        cmp ax, WORD PTR [bp-2]
        jl short L_B165
        pop ds
        pop si
        pop di
        mov sp, bp
        pop bp
        retf
L_B165:
        push ax
        push WORD PTR [bp+8]
        push WORD PTR [bp+6]
        mov ax, ss
        mov ds, ax
        call FAR PTR _GRP_7D50CA88
        add sp, 6
        mov ds, dx
        mov si, ax
        mov WORD PTR [bp-8], dx
        mov WORD PTR [bp-0Ah], ax
        mov es, WORD PTR [bp+0Ch]
        mov di, WORD PTR [bp-6]
        mov bx, WORD PTR es:[di]
        mov cx, WORD PTR es:[di+2]
        add di, 4
        mov WORD PTR [bp-6], di
        mov ax, WORD PTR [si]
        mul WORD PTR [si+2]
        mov WORD PTR [bp-0Ch], ax
        shl ax, 1
        add ax, 10h
        add ax, bx
        adc dx, cx
        mov bx, WORD PTR [bp-4]
        inc bx
        cmp bx, WORD PTR [bp-2]
        jge short L_B1B9
        mov WORD PTR es:[di], ax
        mov WORD PTR es:[di+2], dx
        jmp short L_B1D4
        nop
L_B1B9:
        mov bx, WORD PTR [bp-2]
        shl bx, 1
        shl bx, 1
        shl bx, 1
        add bx, 6
        add ax, bx
        adc dx, 0
        mov di, WORD PTR [bp+0Ah]
        mov WORD PTR es:[di], ax
        mov WORD PTR es:[di+2], dx
L_B1D4:
        push WORD PTR [bp-4]
        push WORD PTR [bp+0Ch]
        push WORD PTR [bp+0Ah]
        mov ax, ss
        mov ds, ax
        call FAR PTR _GRP_7D50CA88
        add sp, 6
        mov es, dx
        mov di, ax
        mov WORD PTR [bp-0Eh], ax
        mov ds, WORD PTR [bp-8]
        mov cx, 6
        rep movsw
        mov si, WORD PTR [bp-0Ah]
        mov di, WORD PTR [bp-0Eh]
        mov ax, WORD PTR [si]
        shl ax, 1
        mov WORD PTR [bp-16h], ax
        mov WORD PTR es:[di], ax
        mov ax, WORD PTR [si+2]
        mov WORD PTR [bp-14h], ax
        mov al, BYTE PTR [si+0Dh]
        mov ah, al
        and ah, 0F0h
        shr al, 1
        shr al, 1
        shr al, 1
        shr al, 1
        or ah, al
        mov al, ah
        add di, 10h
        mov cx, WORD PTR [bp-0Ch]
        cmp cx, 0
        jle short L_B28A
        cmp cx, 1F40h
        ja short L_B28A
        shl cx, 1
        rep stosw
        add si, 10h
        mov WORD PTR [bp-10h], si
        xor bx, bx
        mov WORD PTR [bp-12h], bx
L_B242:
        mov si, WORD PTR [bp-0Ah]
        mov bx, WORD PTR [bp-12h]
        mov ah, BYTE PTR [bx+si+0Ch]
        and ah, 0Fh
        je short L_B28A
        mov bl, ah
        shl bl, 1
        shl bl, 1
        shl bl, 1
        shl bl, 1
        mov di, WORD PTR [bp-0Eh]
        add di, 10h
        mov si, WORD PTR [bp-10h]
        mov dx, WORD PTR [bp-0Ch]
L_B266:
        lodsb
        mov cx, 4
L_B26A:
        shl al, 1
        jae short L_B271
        or BYTE PTR es:[di], bl
L_B271:
        shl al, 1
        jae short L_B278
        or BYTE PTR es:[di], ah
L_B278:
        inc di
        loop short L_B26A
        dec dx
        jg short L_B266
        mov WORD PTR [bp-10h], si
        inc WORD PTR [bp-12h]
        cmp WORD PTR [bp-12h], 4
        jl short L_B242
L_B28A:
        mov si, WORD PTR [bp-0Eh]
        mov cx, WORD PTR es:[si+0Ah]
        add si, 10h
        mov di, si
        mov dx, WORD PTR [bp-14h]
        xor bh, bh
        mov ax, ss
        mov ds, ax
        and cx, 1
        jne short L_B2C9
L_B2A4:
        mov cx, WORD PTR [bp-16h]
L_B2A7:
        mov bl, BYTE PTR es:[si]
        mov al, BYTE PTR [bx-5D0Ah]
        and al, 0F0h
        inc si
        mov bl, BYTE PTR es:[si]
        mov ah, BYTE PTR [bx-5D0Ah]
        shr ah, 1
        shr ah, 1
        shr ah, 1
        shr ah, 1
        or al, ah
        inc si
        stosb
        loop short L_B2A7
        dec dx
        jle short L_B2EF
L_B2C9:
        mov cx, WORD PTR [bp-16h]
L_B2CC:
        mov bl, BYTE PTR es:[si]
        mov al, BYTE PTR [bx-5D0Ah]
        shl al, 1
        shl al, 1
        shl al, 1
        shl al, 1
        inc si
        mov bl, BYTE PTR es:[si]
        mov ah, BYTE PTR [bx-5D0Ah]
        and ah, 0Fh
        or al, ah
        inc si
        stosb
        loop short L_B2CC
        dec dx
        jg short L_B2A4
L_B2EF:
        inc WORD PTR [bp-4]
        jmp L_B156
_grp_eb182c2c ENDP
CYCLES_CGA_COPY_TEXT ENDS
        END
