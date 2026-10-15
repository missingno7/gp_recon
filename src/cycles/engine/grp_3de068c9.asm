_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_A608:WORD, _G_A6A8:WORD
_DATA ENDS
DGROUP GROUP _DATA
        EXTRN   _GRP_69AC66A9:FAR
_CSEG_3DE SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_3DE
        ASSUME  DS:DGROUP
        PUBLIC  _grp_3de068c9
_grp_3de068c9 PROC NEAR
        push    bp
        mov     bp,sp
        sub     sp,2
        push    si
        mov     ax,word ptr [bp+4]
        sub     ax,OFFSET DGROUP:_G_A608
        mov     cl,3
        sar     ax,cl
        mov     cx,ax
        shl     ax,1
        add     ax,cx
        shl     ax,1
        add     ax,OFFSET DGROUP:_G_A6A8
        mov     word ptr [bp-2],ax
        mov     ax,200h
        push    ax
        call    FAR PTR _GRP_69AC66A9
        add     sp,2
        mov     bx,word ptr [bp+4]
        mov     word ptr [bx+4],ax
        or      ax,ax
        je      no_slot
        or      byte ptr [bx+6],8
        mov     bx,word ptr [bp-2]
        mov     word ptr [bx+2],200h
        jmp     SHORT state_ready
        nop
no_slot:
        mov     bx,word ptr [bp+4]
        or      byte ptr [bx+6],4
        mov     ax,word ptr [bp-2]
        inc     ax
        mov     word ptr [bx+4],ax
        mov     bx,word ptr [bp-2]
        mov     word ptr [bx+2],1
state_ready:
        mov     bx,word ptr [bp+4]
        mov     si,bx
        mov     ax,word ptr [si+4]
        mov     word ptr [bx],ax
        mov     word ptr [bx+2],0
        pop     si
        mov     sp,bp
        pop     bp
        ret
_grp_3de068c9 ENDP
_CSEG_3DE ENDS
        END
