_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_A608:WORD, _G_A6A8:WORD, _G_A610:WORD, _G_A618:WORD
_DATA ENDS
DGROUP GROUP _DATA
        EXTRN   _FN_CYCLES_CGA_04FD6:FAR, _GRP_9A209221:FAR
_CSEG_41A SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_41A
        ASSUME  DS:DGROUP
        PUBLIC  _grp_41a318f1
        EXTRN   _K_B58C:ABS, _K_CD32:ABS
_grp_41a318f1 PROC FAR
        push    bp
        mov     bp,sp
        sub     sp,2
        push    si
        cmp     word ptr [bp+6],0
        je      compare_stored_code
        cmp     word ptr [bp+8],OFFSET DGROUP:_G_A610
        je      eligible_record
        cmp     word ptr [bp+8],OFFSET DGROUP:_G_A618
        jne     finish
eligible_record:
        mov     bx,word ptr [bp+8]
        mov     al,byte ptr [bx+7]
        cbw
        push    ax
        call    FAR PTR _FN_CYCLES_CGA_04FD6
        add     sp,2
        or      ax,ax
        je      finish
        mov     ax,word ptr [bp+8]
        sub     ax,OFFSET DGROUP:_G_A608
        mov     cl,3
        sar     ax,cl
        mov     cx,ax
        shl     ax,1
        add     ax,cx
        shl     ax,1
        add     ax,OFFSET DGROUP:_G_A6A8
        mov     word ptr [bp-2],ax
        push    word ptr [bp+8]
        call    FAR PTR _GRP_9A209221
        add     sp,2
        mov     bx,word ptr [bp-2]
        mov     byte ptr [bx],0
        mov     word ptr [bx+2],0
        mov     bx,word ptr [bp+8]
        mov     si,bx
        sub     ax,ax
        mov     word ptr [si],ax
        mov     word ptr [bx+4],ax
        jmp     SHORT finish
        nop
compare_stored_code:
        mov     bx,word ptr [bp+8]
        cmp     word ptr [bx+4],_K_B58C
        je      eligible_code
        cmp     word ptr [bx+4],_K_CD32
        jne     finish
eligible_code:
        mov     al,byte ptr [bx+7]
        cbw
        push    ax
        call    FAR PTR _FN_CYCLES_CGA_04FD6
        add     sp,2
        or      ax,ax
        je      finish
        push    word ptr [bp+8]
        call    FAR PTR _GRP_9A209221
        add     sp,2
finish:
        pop     si
        mov     sp,bp
        pop     bp
        retf
_grp_41a318f1 ENDP
_CSEG_41A ENDS
        END
