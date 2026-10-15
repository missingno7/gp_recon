.8086
_TEXT segment word public 'CODE'
assume cs:_TEXT
public _file_decomp_rle_single
_file_decomp_rle_single proc near
    mov     cx, 80h
    lea     di, [bp-122h]
    mov     ax, ss
    mov     es, ax
    mov     ds, ax
    xor     ax, ax
    rep     stosw
    mov     cl, [bp-18h]
    and     cx, 7Fh
    lea     si, [bp-17h]
    lea     di, [bp-122h]
    xor     ax, ax
    xor     bh, bh
write_escape_map:
    inc     ax
    mov     bl, [si]
    mov     [bx+di], al
    inc     si
    loop    write_escape_map
    mov     ds, [bp-8]
    mov     si, [bp-0Ah]
    mov     es, [bp-0Ch]
    xor     di, di
    mov     dx, [bp-1Ch]
    mov     ax, [bp-1Ah]
    mov     [bp-22h], ax
check_source_wrap:
    cmp     si, 8000h
    jbe     short check_output_wrap
    jmp     short wrap_source
    nop
check_output_wrap:
    cmp     di, 8000h
    jbe     short read_control
    jmp     short wrap_output
    nop
read_control:
    lodsb
    xor     ah, ah
    lea     bx, [bp-122h]
    add     bx, ax
    mov     cl, ss:[bx]
    test    cl, 0FFh
    jnz     short decode_run
    stosb
    dec     dx
    jnz     short check_source_wrap
    cmp     word ptr [bp-22h], 0
    jz      short return_length
    dec     word ptr [bp-22h]
    jmp     short check_source_wrap
decode_run:
    xor     ch, ch
    cmp     cl, 1
    jz      short decode_literal_run
    cmp     cl, 3
    jz      short decode_repeated_run
    dec     cx
    lodsb
    rep     stosb
    sub     dx, 2
adjust_length:
    mov     ax, [bp-22h]
    sbb     ax, 0
    mov     [bp-22h], ax
    or      ax, dx
    jz      short return_length
    jmp     short check_source_wrap
return_length:
    ret
decode_literal_run:
    lodsb
    mov     cl, al
    lodsb
    rep     stosb
    sub     dx, 3
    jmp     short adjust_length
decode_repeated_run:
    lodsb
    mov     cl, al
    lodsb
    mov     ch, al
    lodsb
    rep     stosb
    sub     dx, 4
    jmp     short adjust_length
wrap_source:
    sub     si, 8000h
    mov     ax, ds
    add     ax, 800h
    mov     ds, ax
    jmp     short check_output_wrap
wrap_output:
    sub     di, 8000h
    mov     ax, es
    add     ax, 800h
    mov     es, ax
    jmp     short read_control
_file_decomp_rle_single endp
_TEXT ends
end
