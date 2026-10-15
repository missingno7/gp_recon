.8086
_TEXT segment word public 'CODE'
assume cs:_TEXT
public _mmgr_copy_paras, _copy_paras_reverse
_mmgr_copy_paras proc far
     s = byte ptr 0
     r = byte ptr 2
    arg_0 = word ptr 6
    arg_2 = word ptr 8
    arg_4 = word ptr 10

    push    bp
    mov     bp, sp
    push    ds
    push    si
    push    di
    cld
    mov     ds, [bp+arg_0]
    mov     es, [bp+arg_2]
    mov     bx, [bp+arg_4]
copy_fwd_loop_head_01:
    or      bx, bx
    jz      short copy_fwd_branch_path_02
    mov     cx, 8000h
    mov     ax, bx
    sub     bx, 1000h
    jnb     short copy_fwd_branch_path_01
    add     bx, 1000h
    shl     bx, 1
    shl     bx, 1
    shl     bx, 1
    mov     cx, bx
    xor     bx, bx
copy_fwd_branch_path_01:
    xor     si, si
    xor     di, di
    rep movsw
    mov     ax, ds
    add     ax, 1000h
    mov     ds, ax
    mov     ax, es
    add     ax, 1000h
    mov     es, ax
    jmp     short copy_fwd_loop_head_01
copy_fwd_branch_path_02:
    pop     di
    pop     si
    pop     ds
    pop     bp
    retf
_mmgr_copy_paras endp
; -----------------------------------------------------------------------------
; Purpose: Copy a paragraph block in reverse order to handle overlap.
; ABI: FAR entry; source return form: RETF mnemonic for FAR entry; stack arguments: arg_0 (word ptr 6); arg_2 (word ptr 8); arg_4 (word ptr 10).
; Register ABI: touches AX, BX, CX, SI, DI, BP, SP, DS, ES; balanced explicit saves/restores observed: DI, DS, SI; path-specific inputs and outputs follow the listed operands.
; Globals read: none identified.
; Globals written: none identified.
; -----------------------------------------------------------------------------
_copy_paras_reverse proc far
     s = byte ptr 0
     r = byte ptr 2
    arg_0 = word ptr 6
    arg_2 = word ptr 8
    arg_4 = word ptr 10

    push    bp
    mov     bp, sp
    push    ds
    push    si
    push    di
    std
    mov     bx, [bp+arg_4]
    mov     ax, [bp+arg_0]
    add     ax, bx
    mov     ds, ax
    mov     ax, [bp+arg_2]
    add     ax, bx
    mov     es, ax
copy_rev_loop_head_01:
    or      bx, bx
    jz      short copy_rev_branch_path_02
    mov     cx, 1000h
    sub     bx, 1000h
    jnb     short copy_rev_branch_path_01
    add     bx, 1000h
    mov     cx, bx
    xor     bx, bx
copy_rev_branch_path_01:
    mov     ax, ds
    sub     ax, cx
    mov     ds, ax
    mov     ax, es
    sub     ax, cx
    mov     es, ax
    shl     cx, 1
    shl     cx, 1
    shl     cx, 1
    mov     ax, cx
    shl     ax, 1
    dec     ax
    dec     ax
    mov     si, ax
    mov     di, ax
    rep movsw
    jmp     short copy_rev_loop_head_01
copy_rev_branch_path_02:
    cld
    pop     di
    pop     si
    pop     ds
    pop     bp
    retf
_copy_paras_reverse endp
_TEXT ends
end
