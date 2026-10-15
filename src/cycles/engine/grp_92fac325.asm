_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _g_2032:WORD, _g_2030:WORD, _g_2033:BYTE
        EXTRN   _g_202c:WORD, _g_202e:WORD
_DATA ENDS
DGROUP GROUP _DATA
        EXTRN   _GRP_9A69383F:FAR
_CSEG_92F SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_92F
        ASSUME  DS:DGROUP
        PUBLIC  _grp_92fac325
_grp_92fac325 PROC NEAR
        push    si
        push    di
        push    bp
        shr     ax,1
        shr     ax,1
        shr     ax,1
        shr     ax,1
        mov     word ptr [_g_2032],ax
        mov     si,word ptr [_g_2030]
        mov     al,ah
        shr     al,1
        xor     ah,ah
        mov     di,ax
        add     di,word ptr [_g_202c]
        mov     bp,word ptr [_g_202e]
loop_points:
        lodsw
        or      ax,ax
        jl      done_points
        mov     cl,byte ptr [_g_2033]
        xor     ch,ch
        shr     cx,1
        push    cx
        xor     cx,cx
        push    cx
        mov     bx,word ptr [_g_2032]
        mul     bx
        mov     cx,dx
        add     cx,di
        lodsw
        mul     bx
        add     dx,bp
        push    dx
        push    cx
        lodsw
        mul     bx
        mov     cx,dx
        add     cx,di
        lodsw
        mul     bx
        add     dx,bp
        push    dx
        push    cx
        call    FAR PTR _GRP_9A69383F
        add     sp,0ch
        jmp     loop_points
done_points:
        pop     bp
        pop     di
        pop     si
        ret
_grp_92fac325 ENDP
_CSEG_92F ENDS
        END
