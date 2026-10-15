        EXTRN   _FN_CYCLES_CGA_0074D:NEAR
_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_45A0:WORD, _G_459E:WORD, _G_0F3A:WORD
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_4B9 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_4B9
        ASSUME  DS:DGROUP
        PUBLIC  _grp_bc2ffb9f
_grp_bc2ffb9f PROC NEAR
        mov     bp,0
        mov     di,word ptr [_G_45A0]
        shr     di,1
        shr     di,1
        shr     di,1
        shr     di,1
        shr     di,1
        shl     di,1
        neg     di
        add     di,10h
loop_top:
        mov     dx,word ptr [di+1b78h]
        mov     bx,word ptr [bp+0e56h]
        shl     bx,1
        call    _FN_CYCLES_CGA_0074D
        add     ax,0c4h
        or      ax,ax
        jge     floor_ok
        xor     ax,ax
floor_ok:
        cmp     ax,2a4h
        jle     ceil_ok
        mov     ax,2a4h
ceil_ok:
        mov     word ptr [bp-77f2h],ax
        mov     dx,word ptr [di+1b78h]
        mov     bx,word ptr [bp+0dc2h]
        call    _FN_CYCLES_CGA_0074D
        add     ax,0a0h
        mov     word ptr [bp-7af0h],ax
        mov     dx,ax
        mov     cx,ax
        mov     bx,word ptr [di+16d8h]
        mov     word ptr [bp+1644h],bx
        mov     cx,bx
        sar     cx,1
        sar     cx,1
        sub     ax,bx
        mov     word ptr [bp-7fb0h],ax
        sub     ax,cx
        mov     word ptr [bp+7f20h],ax
        add     dx,bx
        mov     word ptr [bp-7e80h],dx
        add     dx,cx
        mov     word ptr [bp-7c20h],dx
        mov     al,byte ptr [bp-762eh]
        cmp     al,2
        je      special_case
loop_continue:
        inc     bp
        inc     bp
        add     di,10h
        cmp     bp,90h
        jge     done
        jmp     SHORT loop_top
done:
        ret
special_case:
        mov     ax,bx
        mov     bx,bp
        shr     bx,1
        add     bx,word ptr [_G_459E]
        sub     bx,word ptr [_G_0F3A]
        cmp     bx,40h
        jb      clamp_done
        cmp     bx,80h
        jb      clamp_mid
        sub     bx,80h
        neg     bx
        add     bx,3fh
        jge     clamp_done
        xor     bx,bx
        jmp     SHORT clamp_done
clamp_mid:
        mov     bx,3fh
clamp_done:
        mov     cl,byte ptr [bx+0efah]
        xor     ch,ch
        shl     cx,1
        mul     cx
        mov     al,ah
        mov     ah,dl
        mov     word ptr [bp-7d50h],ax
        jmp     SHORT loop_continue
_grp_bc2ffb9f ENDP
_CSEG_4B9 ENDS
        END
