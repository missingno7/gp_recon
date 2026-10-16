.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _G_4E94:WORD
EXTRN _G_4E8C:WORD
_g_cga_99f0 EQU 099f0h
PUBLIC _ega_write_pixel
_ega_write_pixel PROC FAR
    push bp
    mov bp, sp
    push si
    push di
    mov di, WORD PTR [bp+6]
    mov bx, di
    and bx, 7
    shr di, 1
    shr di, 1
    shr di, 1
    mov si, WORD PTR [bp+8]
    shl si, 1
    add si, WORD PTR cs:[_G_4E94]
    add di, WORD PTR cs:[si]
    mov cl, BYTE PTR [bp+0ah]
    mov ax, WORD PTR cs:[_G_4E8C]
    cmp ax, 0a000h
    jne SHORT planar_write
    mov es, ax
    mov dx, 03c4h
    mov ax, 0ff02h
    out dx, ax
    mov dx, 03ceh
    mov ah, BYTE PTR [bx+_g_cga_99f0]
    mov al, 8
    out dx, ax
    mov ax, 0205h
    out dx, ax
    mov ch, BYTE PTR es:[di]
    mov BYTE PTR es:[di], cl
    mov ax, 0ff08h
    out dx, ax
    mov ax, 5
    out dx, ax
    pop di
    pop si
    pop bp
    retf
planar_write:
    mov dl, BYTE PTR [bx+_g_cga_99f0]
    mov dh, dl
    not dh
    xor bx, bx
plane_loop:
    mov ax, WORD PTR cs:[bx+_G_4E8C]
    or ax, ax
    je SHORT next_plane
    mov es, ax
    test cl, 1
    jne SHORT write_plane
    mov al, BYTE PTR es:[di]
    and al, dh
    mov BYTE PTR es:[di], al
    jmp SHORT next_plane
    nop
write_plane:
    or BYTE PTR es:[di], dl
next_plane:
    shr cl, 1
    add bx, 2
    cmp bx, 8
    jb SHORT plane_loop
    pop di
    pop si
    pop bp
    retf
_ega_write_pixel ENDP
_TEXT ENDS
END
