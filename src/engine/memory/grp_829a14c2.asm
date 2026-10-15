.8086
EDATA SEGMENT PARA PUBLIC 'DATA'
EDATA ENDS
ASSUME  ES:EDATA
EXTRN   _g_a748:WORD
EXTRN   _grp_3f31fed1:NEAR
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME  CS:_TEXT
PUBLIC  _grp_829a14c2
_grp_829a14c2 PROC NEAR
        push    cx
        mov     ax, word ptr [di-2]
        test    al,1
        je      short size_even
        sub     cx,ax
        dec     cx
size_even:
        inc     cx
        inc     cx
        mov     dx,7FFFh
size_probe:
        cmp     dx,word ptr es:[_g_a748]
        jbe     short size_ready
        shr     dx,1
        jne     short size_probe
size_ready:
        mov     ax,cx
        add     ax,si
        jb      short size_zero
        add     ax,dx
        jb      short size_halve
        not     dx
        and     ax,dx
        sub     ax,si
        call    near ptr _grp_3f31fed1
        jne     short size_restore
        not     dx
size_halve:
        shr     dx,1
        jne     short size_ready
size_zero:
        xor     ax,ax
size_restore:
        pop     cx
        ret
_grp_829a14c2 ENDP
_TEXT ENDS
END
