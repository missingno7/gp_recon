_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_TEXT
        PUBLIC _grp_7c03a9a0
_grp_7c03a9a0 PROC NEAR
        push    ax
        push    bx
        push    cx
        mov     cx,di
        sub     cx,dx
        jcxz    short no_write
        mov     bx,word ptr [bp+6]
        mov     ah,40h
        int     21h
        jb      short common_tail
        add     word ptr [bp-2],ax
        or      ax,ax
        je      short common_tail
no_write:
        pop     cx
        pop     bx
        pop     ax
        mov     di,dx
        ret
common_tail:
_grp_7c03a9a0 ENDP
_TEXT ENDS
        END
