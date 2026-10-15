_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_A744:WORD, _G_A746:WORD, _G_A74A:WORD
_DATA ENDS
DGROUP GROUP _DATA
        EXTRN   _GRP_94D6A586:FAR
_CSEG_060 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_060
        ASSUME  DS:DGROUP
        PUBLIC  _grp_06026d94
_grp_06026d94 PROC NEAR
        mov     bx,0f0h
        cmp     word ptr [bp+6],bx
        jbe     size_ready
        mov     bx,word ptr [bp+6]
        inc     bx
        and     bx,0fffeh
size_ready:
        mov     word ptr [bp-2],bx
        xor     ax,ax
        push    ds
        push    ax
        push    ax
        lea     cx,[bx+0eh]
        push    cx
        mov     al,2
        push    ax
        call    FAR PTR _GRP_94D6A586
        add     sp,8
        cmp     dx,-1
        je      failed
        mov     ax,dx
        xchg    word ptr [_G_A744],dx
        mov     word ptr [_G_A746],ax
        cmp     ax,word ptr [_G_A74A]
        jbe     highwater_done
        mov     word ptr [_G_A74A],ax
highwater_done:
        or      dx,dx
        je      segment_ready
        mov     ds,dx
        mov     word ptr ds:[8],ax
segment_ready:
        mov     bx,word ptr [bp-2]
        mov     ds,ax
        xor     ax,ax
        mov     word ptr ds:[8],ax
        dec     ax
        dec     ax
        mov     word ptr [bx+0ch],ax
        mov     ax,0ah
        mov     word ptr ds:[0],ax
        mov     word ptr ds:[2],ax
        lea     ax,[bx+1]
        mov     word ptr ds:[0ah],ax
        add     ax,0dh
        mov     word ptr ds:[6],ax
        mov     ax,ds
failed:
        pop     ds
        ret
_grp_06026d94 ENDP
_CSEG_060 ENDS
        END
