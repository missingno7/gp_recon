_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_A2E SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_A2E
        ASSUME  DS:DGROUP
        PUBLIC  _grp_a2e49123
_grp_a2e49123 PROC FAR
        push    bp
        mov     bp,sp
        push    bx
        push    di
        xor     di,di
        mov     ax,word ptr [bp+8]
        or      ax,ax
        jge     numerator_ready
        inc     di
        mov     dx,word ptr [bp+6]
        neg     ax
        neg     dx
        sbb     ax,0
        mov     word ptr [bp+8],ax
        mov     word ptr [bp+6],dx
numerator_ready:
        mov     ax,word ptr [bp+0ch]
        or      ax,ax
        jge     divisor_ready
        mov     dx,word ptr [bp+0ah]
        neg     ax
        neg     dx
        sbb     ax,0
        mov     word ptr [bp+0ch],ax
        mov     word ptr [bp+0ah],dx
divisor_ready:
        or      ax,ax
        jne     wide_divide
        mov     cx,word ptr [bp+0ah]
        mov     ax,word ptr [bp+8]
        xor     dx,dx
        div     cx
        mov     ax,word ptr [bp+6]
        div     cx
        mov     ax,dx
        xor     dx,dx
        dec     di
        jns     sign_result
        jmp     SHORT finish
wide_divide:
        mov     bx,ax
        mov     cx,word ptr [bp+0ah]
        mov     dx,word ptr [bp+8]
        mov     ax,word ptr [bp+6]
normalize:
        shr     bx,1
        rcr     cx,1
        shr     dx,1
        rcr     ax,1
        or      bx,bx
        jne     normalize
        div     cx
        mov     cx,ax
        mul     word ptr [bp+0ch]
        xchg    cx,ax
        mul     word ptr [bp+0ah]
        add     dx,cx
        jb      correct_division
        cmp     dx,word ptr [bp+8]
        ja      correct_division
        jb      remainder_ready
        cmp     ax,word ptr [bp+6]
        jbe     remainder_ready
correct_division:
        sub     ax,word ptr [bp+0ah]
        sbb     dx,word ptr [bp+0ch]
remainder_ready:
        sub     ax,word ptr [bp+6]
        sbb     dx,word ptr [bp+8]
        dec     di
        jns     finish
sign_result:
        neg     dx
        neg     ax
        sbb     dx,0
finish:
        pop     di
        pop     bx
        mov     sp,bp
        pop     bp
        retf    8
_grp_a2e49123 ENDP
_CSEG_A2E ENDS
        END
