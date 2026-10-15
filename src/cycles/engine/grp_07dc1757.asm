_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_A5B8:WORD, _G_A5BA:BYTE
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_33C4 SEGMENT WORD PUBLIC 'CODE'
        EXTRN   _FN_CYCLES_CGA_03FC3:NEAR
        ASSUME  CS:_CSEG_33C4
        ASSUME  DS:DGROUP
        PUBLIC  _grp_07dc1757
_grp_07dc1757 PROC FAR
        push    bp
        mov     bp,sp
        sub     sp,2
        mov     bx,word ptr [bp+6]
        cmp     bx,word ptr [_G_A5B8]
        jb      handle_ok
        stc
        mov     ax,900h
        jmp     SHORT exit_tail
handle_ok:
        xor     ax,ax
        mov     cx,word ptr [bp+0ah]
        jcxz    exit_tail
        test    byte ptr [bx+_G_A5BA],2
        jne     exit_tail
        mov     cx,word ptr [bp+0ah]
        mov     dx,word ptr [bp+8]
        mov     ah,3fh
        int     21h
        jae     read_ok
        mov     ah,9
        jmp     SHORT exit_tail
read_ok:
        test    byte ptr [bx+_G_A5BA],80h
        je      exit_tail
        and     byte ptr [bx+_G_A5BA],0fbh
        push    si
        push    di
        cld
        mov     si,dx
        mov     di,dx
        mov     cx,ax
        jcxz    copy_pop
copy_loop:
        mov     ah,0dh
        cmp     byte ptr [si],0ah
        jne     copy_char
        or      byte ptr [bx+_G_A5BA],4
copy_char:
        lodsb
        cmp     al,ah
        je      end_check
        cmp     al,1ah
        jne     store_char
        or      byte ptr [bx+_G_A5BA],2
        jmp     SHORT copy_count
store_char:
        mov     byte ptr [di],al
        inc     di
loop_again:
        loop    copy_char
copy_count:
        mov     ax,di
        sub     ax,dx
copy_pop:
        pop     di
        pop     si
exit_tail:
        jmp     _FN_CYCLES_CGA_03FC3
end_check:
        cmp     cx,1
        je      read_line
        cmp     byte ptr [si],0ah
        je      loop_again
        jmp     SHORT store_char
read_line:
        test    byte ptr [bx+_G_A5BA],40h
        je      return_cr
        mov     ax,4400h
        int     21h
        test    dx,20h
        jne     emit_lf
        lea     dx,[bp-1]
        mov     ah,3fh
        int     21h
        jb      copy_pop
emit_lf:
        mov     al,0ah
        jmp     SHORT write_char
return_cr:
        mov     byte ptr [bp-1],0
        lea     dx,[bp-1]
        mov     ah,3fh
        int     21h
        jb      copy_pop
        or      ax,ax
        je      emit_cr
        cmp     word ptr [bp+0ah],1
        je      check_lf
seek_prev:
        mov     cx,0ffffh
        mov     dx,cx
        mov     ax,4201h
        int     21h
        mov     cx,1
        cmp     byte ptr [bp-1],0ah
        je      emit_lf_done
emit_cr:
        mov     al,0dh
write_char:
        mov     dx,word ptr [bp+8]
        jmp     SHORT store_char
emit_lf_done:
        mov     dx,word ptr [bp+8]
        jmp     SHORT loop_again
check_lf:
        cmp     byte ptr [bp-1],0ah
        jne     seek_prev
        jmp     SHORT emit_lf
_grp_07dc1757 ENDP
_CSEG_33C4 ENDS
        END

