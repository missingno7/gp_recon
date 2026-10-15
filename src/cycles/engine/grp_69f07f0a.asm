        EXTRN   _FN_CYCLES_CGA_0074D:NEAR
_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_45A0:WORD, _G_459E:WORD, _G_0F3A:WORD
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_1E24 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_1E24
        ASSUME  DS:DGROUP
        PUBLIC  _grp_69f07f0a
_grp_69f07f0a PROC NEAR
        mov     bp,0
        mov     di,word ptr [_G_45A0]
        shr     di,1
        shr     di,1
        shr     di,1
        shr     di,1
        shr     di,1
        shl     di,1
loop_top:
        mov     dx,word ptr [di+1b78h]
        mov     bx,word ptr [bp+0e56h]
        shl     bx,1
        call    _FN_CYCLES_CGA_0074D
        sar     ax,1
        add     ax,62h
        or      ax,ax
        jge     floor_ok
        xor     ax,ax
floor_ok:
        cmp     ax,0a0h
        jle     ceil_ok
        mov     ax,0a0h
ceil_ok:
        mov     word ptr [bp-77f2h],ax
        mov     dx,word ptr [di+1b78h]
        mov     bx,word ptr [bp+0dc2h]
        call    _FN_CYCLES_CGA_0074D
        sar     ax,1
        add     ax,38h
        mov     word ptr [bp-7af0h],ax
        mov     dx,ax
        mov     cx,ax
        mov     bx,word ptr [di+16d8h]
        sar     bx,1
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
        cmp     bp,4ch
        jge     done
        jmp     SHORT loop_top
done:
        ret
special_case:
        mov     ax,bx
        mov     bx,bp
        shr     bx,1
        neg     bx
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
_grp_69f07f0a ENDP
_CSEG_1E24 ENDS
        END
