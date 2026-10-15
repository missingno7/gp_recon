_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _g_4558:WORD, _g_2028:WORD, _g_201c:WORD, _g_880e:WORD, _g_3f16:WORD, _g_4568:BYTE
        EXTRN   _g_202a:WORD, _g_4554:WORD, _g_4556:WORD, _g_455e:WORD
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_346 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_346
        ASSUME  DS:DGROUP
        ASSUME  SS:_CSEG_346
        PUBLIC  _grp_34645688
        EXTRN   _bpdisp_7f20:WORD, _bpdisp_83e0:WORD
_grp_34645688 PROC NEAR
        push    si
        push    di
        push    bp
        mov     word ptr [_g_4558],0
        mov     bx,si
        sub     bx,dx
        mov     word ptr [_g_2028],bx
        mov     bx,word ptr [_g_201c]
        cmp     word ptr [_g_201c],-1
        jne     have_index
        mov     bx,0
have_index:
        mov     ax,word ptr [bx+_g_880e]
        sar     ax,1
        shl     bx,1
        shl     bx,1
        shl     bx,1
        mov     dx,word ptr [bx+_g_3f16]
        cmp     byte ptr [_g_4568],0
        je      value_ready
        shr     dx,1
value_ready:
        sub     ax,dx
        sub     ax,word ptr [_g_2028]
        neg     ax
        mov     word ptr [_g_202a],ax
        mov     ax,word ptr [_g_4554]
        mov     bx,word ptr [bp+_bpdisp_7f20]
        mov     cx,word ptr [bp+_bpdisp_83e0]
        mov     dx,word ptr [_g_4556]
        mov     word ptr [_g_455e],0
        call    NEAR PTR helper_after_function
        pop     bp
        pop     di
        pop     si
        ret
helper_after_function:
_grp_34645688 ENDP
_CSEG_346 ENDS
        END
