.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _g_cir_seg0000_a844:WORD
EXTRN _g_cir_seg0000_a83c:WORD
EXTRN _g_cir_seg0000_6969:WORD
EXTRN _g_cir_seg0000_6933:WORD
EXTRN _g_cir_seg0000_6971:WORD
EXTRN _g_cir_seg0000_699c:WORD
EXTRN _g_cir_seg0000_69cb:WORD
PUBLIC _fn_circuit_cga_068ee
_fn_circuit_cga_068ee PROC NEAR
    push bp
    mov bp, sp
    push ds
    push si
    push di
    sub sp, 8
    mov ds, [bp+6]
    mov si, [bp+4]
    mov ax, [si+8]
    and ax, 0fffch
    mov [bp-8], ax
    mov ax, [si+0ah]
    mov [bp-0ah], ax
    mov bx, [bp-0ah]
    shl bx, 1
    add bx, cs:_g_cir_seg0000_a844
    mov ax, [si]
    mov [bp-0ch], ax
    mov es, cs:_g_cir_seg0000_a83c
    cld
    mov ax, [bp-8]
    mov di, ax
    sar ax, 1
    sar ax, 1
    mov [bp-8], ax
    test di, 3
    jne short _mask_dispatch
_mask_case0:
    mov dx, [si+2]
    add si, 10h
_mask_row0:
    mov di, cs:[bx]
    add di, [bp-8]
    mov cx, [bp-0ch]
_mask_pixel0:
    lodsb
    and byte ptr es:[di], al
    inc di
    loop short _mask_pixel0
    inc bx
    inc bx
    dec dx
    jg short _mask_row0
_mask_epilogue:
    add sp, 8
    pop di
    pop si
    pop ds
    pop bp
    ret
_mask_dispatch:
    mov ax, [si+2]
    mov [bp-0eh], ax
    add si, 10h
    and di, 3
    shl di, 1
    jmp word ptr cs:[di+_g_cir_seg0000_6969]
    dw OFFSET _g_cir_seg0000_6933
    dw OFFSET _g_cir_seg0000_6971
    dw OFFSET _g_cir_seg0000_699c
    dw OFFSET _g_cir_seg0000_69cb
_mask_case1:
    mov di, cs:[bx]
    add di, [bp-8]
    mov cx, [bp-0ch]
    mov dh, 0c0h
_mask_pixel1:
    xor ah, ah
    lodsb
    ror ax, 1
    ror ax, 1
    or al, dh
    mov dh, ah
    and byte ptr es:[di], al
    inc di
    loop short _mask_pixel1
    or dh, 3fh
    and byte ptr es:[di], dh
    inc bx
    inc bx
    dec word ptr [bp-0eh]
    jg short _mask_case1
    jmp near ptr _mask_epilogue
_mask_case2:
    mov di, cs:[bx]
    add di, [bp-8]
    mov cx, [bp-0ch]
    mov dh, 0f0h
_mask_pixel2:
    xor ah, ah
    lodsb
    ror ax, 1
    ror ax, 1
    ror ax, 1
    ror ax, 1
    or al, dh
    mov dh, ah
    and byte ptr es:[di], al
    inc di
    loop short _mask_pixel2
    or dh, 0fh
    and byte ptr es:[di], dh
    inc bx
    inc bx
    dec word ptr [bp-0eh]
    jg short _mask_case2
    jmp near ptr _mask_epilogue
_mask_case3:
    mov di, cs:[bx]
    add di, [bp-8]
    mov cx, [bp-0ch]
    mov dh, 0fch
_mask_pixel3:
    xor ah, ah
    lodsb
    rol ax, 1
    rol ax, 1
    xchg al, ah
    or al, dh
    mov dh, ah
    and byte ptr es:[di], al
    inc di
    loop short _mask_pixel3
    or dh, 3
    and byte ptr es:[di], dh
    inc bx
    inc bx
    dec word ptr [bp-0eh]
    jg short _mask_case3
    jmp near ptr _mask_epilogue
_fn_circuit_cga_068ee ENDP
_TEXT ENDS
END

