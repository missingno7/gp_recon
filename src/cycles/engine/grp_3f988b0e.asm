        EXTRN   _FN_CYCLES_CGA_08BEA:FAR
_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_4568:WORD, _G_2108:WORD, _G_2162:WORD, _G_2078:WORD
        EXTRN   _G_207A:WORD, _G_4552:WORD, _G_2102:WORD, _G_216A:WORD
        EXTRN   _G_598C:WORD, _G_599C:WORD
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_3F9 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_3F9
        ASSUME  DS:DGROUP
        PUBLIC  _grp_3f988b0e
_grp_3f988b0e PROC NEAR
        cmp     byte ptr [_G_4568],0
        jne     mode_one
        mov     ax,word ptr [_G_2108]
        shl     ax,1
        mov     bx,word ptr [_G_2162]
        sub     ax,bx
        jmp     SHORT adjust_height
mode_one:
        mov     ax,word ptr [_G_2078]
        mov     word ptr [_G_207A],ax
        mov     ax,word ptr [_G_2108]
        shl     ax,1
        mov     bx,word ptr [_G_2162]
        sub     ax,bx
        neg     ax
        sar     ax,1
adjust_height:
        mov     bx,ax
        sar     ax,1
        sar     ax,1
        add     ax,bx
        neg     ax
        mov     al,ah
        cbw
        add     ax,word ptr [_G_4552]
        mov     word ptr [_G_2078],ax
        mov     bx,ax
        mov     di,OFFSET DGROUP:_G_598C
        mov     cx,140h
        mov     dx,0c0h
        mov     ax,word ptr [_G_2102]
        sub     ax,word ptr [_G_216A]
        cmp     byte ptr [_G_4568],0
        je      scale_y
        neg     ax
        add     ax,3d00h
        mov     di,OFFSET DGROUP:_G_599C
        mov     cx,60h
        mov     dx,0a0h
        shr     ax,1
scale_y:
        shr     ax,1
        shr     ax,1
        shr     ax,1
        shr     ax,1
        shr     ax,1
        shr     ax,1
        neg     ax
        push    bx
        push    ax
        push    word ptr [di+2]
        push    word ptr [di]
        add     ax,cx
        push    bx
        push    ax
        push    word ptr [di+6]
        push    word ptr [di+4]
        add     ax,dx
        push    bx
        push    ax
        push    word ptr [di+0ah]
        push    word ptr [di+8]
        add     ax,cx
        push    bx
        push    ax
        push    word ptr [di+0eh]
        push    word ptr [di+0ch]
        add     ax,dx
        push    bx
        push    ax
        push    word ptr [di+2]
        push    word ptr [di]
        call    FAR PTR _FN_CYCLES_CGA_08BEA
        add     sp,8
        call    FAR PTR _FN_CYCLES_CGA_08BEA
        add     sp,8
        call    FAR PTR _FN_CYCLES_CGA_08BEA
        add     sp,8
        call    FAR PTR _FN_CYCLES_CGA_08BEA
        add     sp,8
        call    FAR PTR _FN_CYCLES_CGA_08BEA
        add     sp,8
        ret
_grp_3f988b0e ENDP
_CSEG_3F9 ENDS
        END
