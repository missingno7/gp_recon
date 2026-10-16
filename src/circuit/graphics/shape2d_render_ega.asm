.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
EXTRN _grp_7d50ca88:NEAR
PUBLIC _fn_circuit_ega_0ded6
_fn_circuit_ega_0ded6 PROC NEAR
    push bp
    mov bp, sp
    sub sp, 14h
    push ds
    push si
    push di
    mov ax, word ptr [bp + 6]
    mov ds, ax
    mov ax, word ptr [bp + 4]
    mov si, ax
    mov bx, word ptr [si + 4]
    mov word ptr [bp - 2], bx
    mov word ptr [bp - 4], 0
L_DEF4:
    push word ptr [bp - 4]
    push word ptr [bp + 6]
    push word ptr [bp + 4]
    mov ax, DGROUP
    mov ds, ax
    call _grp_7d50ca88
    add sp, 6
    mov word ptr [bp - 6], ax
    mov word ptr [bp - 8], dx
    mov si, ax
    mov ds, dx
    mov al, byte ptr [si + 0Fh]
    and al, 0F0h
    jne L_DF2C
    mov bl, byte ptr [si + 0Eh]
    shr bl, 1
    shr bl, 1
    shr bl, 1
    shr bl, 1
    and bl, 0Fh
    mov byte ptr [bp - 14h], bl
    jne L_DF3B
L_DF2C:
    inc word ptr [bp - 4]
    dec word ptr [bp - 2]
    jg L_DEF4
    pop di
    pop si
    pop ds
    mov sp, bp
    pop bp
    ret
L_DF3B:
    mov ax, word ptr [si]
    mov word ptr [bp - 0Ah], ax
    mov dx, word ptr [si + 2]
    mov word ptr [bp - 0Ch], dx
    mul dx
    mov word ptr [bp - 0Eh], ax
    add si, 10h
    mov word ptr [bp - 10h], si
    mov byte ptr [bp - 12h], 4
L_DF55:
    shr byte ptr [bp - 14h], 1
    jae L_DF8D
    mov es, word ptr [bp + 0Ah]
    mov di, word ptr [bp + 8]
    mov ds, word ptr [bp - 8]
    xor dx, dx
    mov bx, word ptr [bp - 0Ch]
L_DF68:
    mov si, word ptr [bp - 10h]
    add si, dx
    mov cx, word ptr [bp - 0Ah]
L_DF70:
    mov al, byte ptr [si]
    stosb
    add si, bx
    loop L_DF70
    inc dx
    cmp dx, bx
    jne L_DF68
    mov es, word ptr [bp - 8]
    mov di, word ptr [bp - 10h]
    mov ds, word ptr [bp + 0Ah]
    mov si, word ptr [bp + 8]
    mov cx, word ptr [bp - 0Eh]
    rep movsb
L_DF8D:
    mov ax, word ptr [bp - 0Eh]
    add word ptr [bp - 10h], ax
    dec byte ptr [bp - 12h]
    jne L_DF55
    jmp SHORT L_DF2C
_fn_circuit_ega_0ded6 ENDP
_TEXT ENDS
END
