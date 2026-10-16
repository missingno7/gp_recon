.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _g_cir_seg0000_c7de:WORD
EXTRN _CS_G_0C7BC:WORD
EXTRN _G_4E94:WORD
EXTRN _G_4E9E:WORD
PUBLIC _copy_ega_planar_rectangle
_copy_ega_planar_rectangle PROC NEAR
    push bp
    mov bp, sp
    push ds
    push si
    push di
    sub sp, 0Ah
    mov ax, word ptr [bp+0Ch]
    sar ax, 1
    sar ax, 1
    sar ax, 1
    mov word ptr [bp-10h], ax
    mov ax, word ptr [bp+4]
    sar ax, 1
    sar ax, 1
    sar ax, 1
    mov word ptr [bp+4], ax
    mov ax, word ptr [bp+8]
    sar ax, 1
    sar ax, 1
    sar ax, 1
    mov word ptr [bp+8], ax
    mov bx, word ptr [bp+6]
    shl bx, 1
    add bx, word ptr cs:_g_cir_seg0000_c7de
    mov ax, word ptr cs:[bx]
    add ax, word ptr [bp+4]
    mov word ptr [bp-8], ax
    mov ax, 28h
    sub ax, word ptr [bp-10h]
    mov word ptr [bp-0Ch], ax
    mov bx, word ptr [bp+0Ah]
    shl bx, 1
    add bx, word ptr cs:_G_4E94
    mov ax, word ptr cs:[bx]
    add ax, word ptr [bp+8]
    mov word ptr [bp-0Ah], ax
    mov ax, word ptr cs:_G_4E9E
    sub ax, word ptr [bp-10h]
    mov word ptr [bp-0Eh], ax
    mov es, word ptr cs:_CS_G_0C7BC
    mov ax, 0A000h
    mov ds, ax
    cld
    xor bx, bx
L_PLANE_LOOP:
    mov cx, bx
    shr cx, 1
    mov dx, 03CEh
    mov al, 4
    out dx, al
    inc dx
    mov al, cl
    out dx, al
    mov ax, word ptr cs:[bx+_CS_G_0C7BC]
    or ax, ax
    je short L_NEXT_PLANE
    mov es, ax
    mov si, word ptr [bp-8]
    mov di, word ptr [bp-0Ah]
    mov dx, word ptr [bp+0Eh]
L_COPY_ROW:
    mov cx, word ptr [bp-10h]
    rep movsb
    add si, word ptr [bp-0Ch]
    add di, word ptr [bp-0Eh]
    dec dx
    jg short L_COPY_ROW
L_NEXT_PLANE:
    add bx, 2
    cmp bx, 8
    jl short L_PLANE_LOOP
    add sp, 0Ah
    pop di
    pop si
    pop ds
    pop bp
    ret
_copy_ega_planar_rectangle ENDP
_TEXT ENDS
END
