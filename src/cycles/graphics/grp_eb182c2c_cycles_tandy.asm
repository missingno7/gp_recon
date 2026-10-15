.8086
CYCLES_TANDY_COPY_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CYCLES_TANDY_COPY_TEXT
        EXTRN _GRP_7D50CA88:FAR
        PUBLIC _grp_eb182c2c
_grp_eb182c2c PROC FAR
        push bp
        mov bp, sp
        sub sp, 12h
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
L_ABDA:
        mov ax, WORD PTR [bp-4]
        cmp ax, WORD PTR [bp-2]
        jl short L_ABE9
        pop ds
        pop si
        pop di
        mov sp, bp
        pop bp
        retf
L_ABE9:
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
        shl ax, 1
        add ax, 10h
        add ax, bx
        adc dx, cx
        mov bx, WORD PTR [bp-4]
        inc bx
        cmp bx, WORD PTR [bp-2]
        jge short L_AC3F
        mov WORD PTR es:[di], ax
        mov WORD PTR es:[di+2], dx
        jmp short L_AC5A
        nop
L_AC3F:
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
L_AC5A:
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
        shl ax, 1
        mov WORD PTR es:[di], ax
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
        jle short L_AD09
        cmp cx, 1F40h
        ja short L_AD09
        shl cx, 1
        rep stosw
        add si, 10h
        mov WORD PTR [bp-10h], si
        xor bx, bx
        mov WORD PTR [bp-12h], bx
L_ACC1:
        mov si, WORD PTR [bp-0Ah]
        mov bx, WORD PTR [bp-12h]
        mov ah, BYTE PTR [bx+si+0Ch]
        and ah, 0Fh
        je short L_AD09
        mov bl, ah
        shl bl, 1
        shl bl, 1
        shl bl, 1
        shl bl, 1
        mov di, WORD PTR [bp-0Eh]
        add di, 10h
        mov si, WORD PTR [bp-10h]
        mov dx, WORD PTR [bp-0Ch]
L_ACE5:
        lodsb
        mov cx, 4
L_ACE9:
        shl al, 1
        jae short L_ACF0
        or BYTE PTR es:[di], bl
L_ACF0:
        shl al, 1
        jae short L_ACF7
        or BYTE PTR es:[di], ah
L_ACF7:
        inc di
        loop short L_ACE9
        dec dx
        jg short L_ACE5
        mov WORD PTR [bp-10h], si
        inc WORD PTR [bp-12h]
        cmp WORD PTR [bp-12h], 4
        jl short L_ACC1
L_AD09:
        inc WORD PTR [bp-4]
        jmp L_ABDA
_grp_eb182c2c ENDP
CYCLES_TANDY_COPY_TEXT ENDS
        END
