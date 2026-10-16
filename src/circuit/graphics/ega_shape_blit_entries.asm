.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _g_cir_seg0000_c7de:WORD
EXTRN _g_cir_seg0000_c4b0:BYTE
PUBLIC _fn_circuit_ega_0c4e4
PUBLIC _fn_circuit_ega_0c508
_fn_circuit_ega_0c4e4 PROC NEAR
    push bp
    mov bp, sp
    push ds
    push si
    push di
    sub sp, 12h
    mov ds, word ptr [bp+6]
    mov di, word ptr [bp+4]
    mov ax, word ptr [bp+8]
    mov word ptr [bp-8], ax
    mov word ptr [di+8], ax
    mov ax, word ptr [bp+0Ah]
    mov word ptr [bp-0Ah], ax
    mov word ptr [di+0Ah], ax
    jmp short L_COMMON
    nop
_fn_circuit_ega_0c4e4 ENDP
_fn_circuit_ega_0c508 PROC NEAR
    push bp
    mov bp, sp
    push ds
    push si
    push di
    sub sp, 12h
    mov ds, word ptr [bp+6]
    mov di, word ptr [bp+4]
    mov ax, word ptr [di+8]
    and ax, 0FFF8h
    mov word ptr [bp-8], ax
    mov ax, word ptr [di+0Ah]
    mov word ptr [bp-0Ah], ax
L_COMMON:
    mov ax, word ptr [di]
    mov word ptr [bp-0Ch], ax
    mov ax, word ptr [di+2]
    mov word ptr [bp-0Eh], ax
    mov ax, word ptr [bp-8]
    sar ax, 1
    sar ax, 1
    sar ax, 1
    mov word ptr [bp-8], ax
    mov bx, word ptr [bp-0Ah]
    shl bx, 1
    add bx, word ptr cs:_g_cir_seg0000_c7de
    mov ax, word ptr cs:[bx]
    add ax, word ptr [bp-8]
    mov word ptr [bp-10h], ax
    mov ax, 28h
    sub ax, word ptr [bp-0Ch]
    mov word ptr [bp-12h], ax
    lea ax, [di+0Ch]
    mov word ptr [bp-16h], ax
    mov al, byte ptr [di+0Fh]
    shr al, 1
    shr al, 1
    shr al, 1
    shr al, 1
    xor ah, ah
    mov word ptr [bp-18h], ax
    lea di, [di+10h]
    mov es, word ptr [bp+6]
    mov ax, 0A000h
    mov ds, ax
    cld
    mov byte ptr [bp-14h], 4
L_PLANE:
    mov bx, word ptr [bp-16h]
    mov bx, word ptr es:[bx]
    and bx, 0Fh
    je short L_NEXT_PLANE
    mov cl, byte ptr cs:[bx+_g_cir_seg0000_c4b0]
    mov dx, 03CEh
    mov al, 4
    out dx, al
    inc dx
    mov al, cl
    out dx, al
    mov si, word ptr [bp-10h]
    mov dx, word ptr [bp-0Eh]
L_COPY_ROWS:
    mov cx, word ptr [bp-0Ch]
    rep movsb
    add si, word ptr [bp-12h]
    dec dx
    jg short L_COPY_ROWS
L_NEXT_PLANE:
    inc word ptr [bp-16h]
    add di, word ptr [bp-18h]
    dec byte ptr [bp-14h]
    jg short L_PLANE
    add sp, 12h
    pop di
    pop si
    pop ds
    pop bp
    ret
_fn_circuit_ega_0c508 ENDP
_TEXT ENDS
END
