_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_455E:WORD, _G_4568:BYTE, _G_4558:WORD
        EXTRN   _G_202C:WORD, _G_202E:WORD, _G_3F16:WORD
_DATA ENDS
DGROUP GROUP _DATA
        EXTRN   _FN_CYCLES_CGA_08322:FAR
_CSEG_3D9 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_3D9
        ASSUME  DS:DGROUP
        ASSUME  SS:_CSEG_3D9
        PUBLIC  _grp_3d9f65a8
        EXTRN   _BPDISP_7F20:WORD, _BPDISP_83E0:WORD
_grp_3d9f65a8 PROC NEAR
        mov     word ptr [_G_455E],0ffffh
        mov     ax,word ptr [bp+_BPDISP_7F20]
        mov     cx,word ptr [bp+_BPDISP_83E0]
        mov     dx,word ptr [di+_G_3F16]
        cmp     byte ptr [_G_4568],0
        je      scale_ready
        shr     dx,1
scale_ready:
        mov     bx,si
        sub     bx,dx
        sar     dx,1
        sub     bx,dx
        sub     bx,dx
        mov     word ptr [_G_4558],bx
        inc     dx
        push    bx
        mov     word ptr [_G_202C],ax
        mov     word ptr [_G_202E],bx
        sub     cx,ax
        push    word ptr [_G_455E]
        push    dx
        push    cx
        push    bx
        push    ax
        call    FAR PTR _FN_CYCLES_CGA_08322
        add     sp,0ah
        pop     bx
        mov     ax,word ptr [bp+_BPDISP_7F20]
        mov     dx,si
        sub     dx,bx
        mov     cx,dx
        sar     cx,1
        sar     cx,1
        sar     cx,1
        add     cx,ax
        dec     ax
        push    bx
        push    dx
        sub     cx,ax
        push    word ptr [_G_455E]
        push    dx
        push    cx
        push    bx
        push    ax
        call    FAR PTR _FN_CYCLES_CGA_08322
        add     sp,0ah
        pop     dx
        pop     bx
        mov     cx,word ptr [bp+_BPDISP_83E0]
        mov     ax,dx
        sar     ax,1
        sar     ax,1
        sar     ax,1
        sub     ax,cx
        inc     cx
        neg     ax
        sub     cx,ax
        push    word ptr [_G_455E]
        push    dx
        push    cx
        push    bx
        push    ax
        call    FAR PTR _FN_CYCLES_CGA_08322
        add     sp,0ah
        ret
_grp_3d9f65a8 ENDP
_CSEG_3D9 ENDS
        END
