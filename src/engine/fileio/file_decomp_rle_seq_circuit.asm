.8086
_TEXT segment word public 'CODE'
assume cs:_TEXT
public _file_decomp_rle_seq
_file_decomp_rle_seq proc near
    cmp     byte ptr [bp-18h], 1; _file_decomp_rle::var_esclen
    jnz     short has_codes
    retn
has_codes:
    mov     ds, word ptr [bp-8]; _file_decomp_rle::arg_srcseg
    mov     si, [bp-0Ah]      ; _file_decomp_rle::arg_srcoff
    mov     es, word ptr [bp-0Ch]; _file_decomp_rle::var_dstoff
    xor     di, di
    mov     bx, [bp-1Ch]
    mov     ax, [bp-1Ah]
    mov     [bp-22h], ax
    mov     ah, [bp-16h]
check_sequence_input_wrap:
    cmp     si, 8000h
    ja      short wrap_sequence_input
check_sequence_output_wrap:
    cmp     di, 8000h
    ja      short wrap_sequence_output
read_rle_sequence_byte:
    lodsb
    cmp     al, ah
    jz      short read_next_sequence_byte
    stosb
    dec     bx
    jnz     short check_sequence_input_wrap
    cmp     word ptr [bp-22h], 0
    jz      short advance_output_segment_2
    dec     word ptr [bp-22h]
    jmp     short check_sequence_input_wrap
wrap_sequence_input:
    sub     si, 8000h
    mov     dx, ds
    add     dx, 800h
    mov     ds, dx
    jmp     short check_sequence_output_wrap
wrap_sequence_output:
    sub     di, 8000h
    mov     dx, es
    add     dx, 800h
    mov     es, dx
    jmp     short read_rle_sequence_byte
advance_output_segment_2:
    mov     dx, es
    sub     dx, [bp-0Ch]
    mov     ax, 10h
    mul     dx
    add     ax, di
    adc     dx, 0
    retn
read_next_sequence_byte:
    mov     dx, di
compare_sequence_control_byte:
    lodsb
    cmp     al, ah
    jz      short read_sequence_repeat_count
    stosb
    dec     bx
    jnz     short compare_sequence_control_byte
    dec     word ptr [bp-22h]
    jmp     short compare_sequence_control_byte
read_sequence_repeat_count:
    lodsb
    push    si
    push    ds
    mov     cx, es
    mov     ds, cx
    mov     si, dx
    mov     cx, di
    sub     cx, dx
    mov     dl, al
    dec     dl
copy_sequence_repeat_run:
    push    cx
    push    si
    push    ds
    rep movsb
    pop     ds
    pop     si
    pop     cx
    dec     dl
    jnz     short copy_sequence_repeat_run
    pop     ds
    pop     si
    sub     bx, 3
    sbb     word ptr [bp-22h], 0
    mov     dx, [bp-22h]
    or      dx, bx
    jz      short advance_output_segment_2
    jmp     check_sequence_input_wrap

_file_decomp_rle_seq endp
_TEXT ends
end
