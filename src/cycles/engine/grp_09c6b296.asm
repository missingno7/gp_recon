        EXTRN   _FN_CYCLES_CGA_04CD2:FAR
_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_A5B8:WORD, _G_A5BA:WORD
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_09C SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_09C
        ASSUME  DS:DGROUP
        ASSUME  SS:_CSEG_09C
        PUBLIC  _grp_09c6b296
        EXTRN   _FN_CYCLES_CGA_03FC3:NEAR
        EXTRN   _FN_CYCLES_CGA_029FB:NEAR
_grp_09c6b296 PROC NEAR
        push    bp
        mov     bp,sp
        sub     sp,8
        mov     bx,word ptr [bp+6]
        cmp     bx,word ptr [_G_A5B8]
        jb      handle_valid
        mov     ax,900h
        stc
seek_error:
        jmp     near ptr _FN_CYCLES_CGA_03FC3
handle_valid:
        test    byte ptr [bx+OFFSET DGROUP:_G_A5BA],20h
        je      seek_done
        mov     ax,4202h
        xor     cx,cx
        mov     dx,cx
        int     21h
        jc      seek_error
seek_done:
        test    byte ptr [bx+OFFSET DGROUP:_G_A5BA],80h
        je      direct_write_veneer
        mov     dx,word ptr [bp+8]
        push    ds
        pop     es
        xor     ax,ax
        mov     word ptr [bp-2],ax
        mov     word ptr [bp-4],ax
        cld
        push    di
        push    si
        mov     di,dx
        mov     si,dx
        mov     word ptr [bp-8],sp
        mov     cx,word ptr [bp+0ah]
        jcxz    empty_input
        mov     al,0ah
        repne   scasb
        jne     no_lf
        call    far ptr _FN_CYCLES_CGA_04CD2
        cmp     ax,0a8h
        jbe     error_zero
        sub     sp,2
        mov     bx,sp
        mov     dx,200h
        cmp     ax,228h
        jae     buffer_size
        mov     dx,80h
buffer_size:
        sub     sp,dx
        mov     dx,sp
        mov     di,dx
        push    ss
        pop     es
        mov     cx,word ptr [bp+0ah]
copy_loop:
        lodsb
        cmp     al,0ah
        je      newline_seen
copy_compare:
        cmp     di,bx
        je      buffer_full
copy_emit:
        stosb
        loop    copy_loop
        call    flush_buffer
        jmp     SHORT write_done
newline_seen:
        mov     al,0dh
        cmp     di,bx
        jne     emit_cr
        call    flush_buffer
emit_cr:
        stosb
        mov     al,0ah
        inc     word ptr [bp-4]
        jmp     SHORT copy_compare
buffer_full:
        call    flush_buffer
        jmp     SHORT copy_emit
no_lf:
        pop     si
        pop     di
direct_write_veneer:
        jmp     SHORT direct_write
empty_input:
        jmp     SHORT write_done
error_zero:
        xor     ax,ax
        jmp     near ptr _FN_CYCLES_CGA_029FB
flush_buffer:
        push    ax
        push    bx
        push    cx
        mov     cx,di
        sub     cx,dx
        jcxz    flush_ok
        mov     bx,word ptr [bp+6]
        mov     ah,40h
        int     21h
        jc      flush_error
        add     word ptr [bp-2],ax
        or      ax,ax
        je      flush_error
flush_ok:
        pop     cx
        pop     bx
        pop     ax
        mov     di,dx
        ret
flush_error:
        add     sp,8
        jae     flush_test_flags
        mov     ah,9
        jmp     SHORT error_tail
flush_test_flags:
        test    byte ptr [bx+OFFSET DGROUP:_G_A5BA],40h
        je      flush_non_eof
        mov     bx,word ptr [bp+8]
        cmp     byte ptr [bx],1ah
        jne     flush_non_eof
        clc
        jmp     SHORT error_tail
flush_non_eof:
        stc
        mov     ax,1c00h
        jmp     SHORT error_tail
write_done:
        mov     ax,word ptr [bp-2]
        sub     ax,word ptr [bp-4]
error_tail:
        mov     sp,word ptr [bp-8]
        pop     si
        pop     di
error_return:
        jmp     near ptr _FN_CYCLES_CGA_03FC3
direct_write:
        mov     cx,word ptr [bp+0ah]
        or      cx,cx
        jne     write_nonempty
        mov     ax,cx
        jmp     near ptr _FN_CYCLES_CGA_03FC3
write_nonempty:
        mov     dx,word ptr [bp+8]
        mov     ah,40h
        int     21h
        jae     write_ok
        mov     ah,9
        jmp     SHORT error_return
write_ok:
        or      ax,ax
        jne     error_return
        test    byte ptr [bx+OFFSET DGROUP:_G_A5BA],40h
        je      write_failed
        mov     bx,dx
        cmp     byte ptr [bx],1ah
        jne     write_failed
        clc
        jmp     SHORT error_return
write_failed:
        stc
        mov     ax,1c00h
        jmp     SHORT error_return
_grp_09c6b296 ENDP
_CSEG_09C ENDS
        END
