PUBLIC _grp_448d2ff6
EXTRN _HOOK_INT09:BYTE
EXTRN _HOOK_INT16:BYTE
EXTRN _G_OLD_INT09_OFF:BYTE
EXTRN _G_OLD_INT09_SEG:BYTE
EXTRN _G_OLD_INT16_OFF:BYTE
EXTRN _G_OLD_INT16_SEG:BYTE
EXTRN _G_IRQ_BUFFER:BYTE
_TEXT SEGMENT PARA PUBLIC 'CODE'
ASSUME CS:_TEXT
_grp_448d2ff6 PROC NEAR
    push di
    in al, 21h
    mov ah, al
    or al, 3
    out 21h, al
    xor bx, bx
    mov es, bx
    mov bx, es:[24h]
    cmp bx, OFFSET _HOOK_INT09
    je short vectors_ready
    mov word ptr _G_OLD_INT09_OFF, bx
    mov bx, es:[26h]
    mov word ptr _G_OLD_INT09_SEG, bx
    mov word ptr es:[24h], OFFSET _HOOK_INT09
    mov word ptr es:[26h], cs
    mov bx, es:[58h]
    mov word ptr _G_OLD_INT16_OFF, bx
    mov bx, es:[5ah]
    mov word ptr _G_OLD_INT16_SEG, bx
    mov word ptr es:[58h], OFFSET _HOOK_INT16
    mov word ptr es:[5ah], cs
vectors_ready:
    mov al, ah
    out 21h, al
    mov ax, ds
    mov es, ax
    mov di, OFFSET _G_IRQ_BUFFER
    mov cx, 5ah
    xor ax, ax
    rep stosb
    pop di
    ret
_grp_448d2ff6 ENDP
_TEXT ENDS
END
