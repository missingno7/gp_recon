_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_A608:WORD, _G_A6A8:WORD
_DATA ENDS
DGROUP GROUP _DATA
        EXTRN   _GRP_09C6B296:FAR
_CSEG_9A2 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_9A2
        ASSUME  DS:DGROUP
        PUBLIC  _grp_9a209221
_grp_9a209221 PROC FAR
        push    bp
        mov     bp,sp
        sub     sp,4
        push    di
        push    si
        mov     si,word ptr [bp+6]
        sub     di,di
        mov     al,byte ptr [si+6]
        and     al,3
        cmp     al,2
        jne     finish
        test    byte ptr [si+6],8
        jne     perform_update
        mov     bx,si
        sub     bx,OFFSET DGROUP:_G_A608
        mov     cl,3
        sar     bx,cl
        mov     ax,bx
        shl     bx,1
        add     bx,ax
        shl     bx,1
        test    byte ptr [bx+OFFSET DGROUP:_G_A6A8],1
        je      finish
perform_update:
        mov     ax,word ptr [si]
        sub     ax,word ptr [si+4]
        mov     word ptr [bp-4],ax
        or      ax,ax
        jle     finish
        push    ax
        push    word ptr [si+4]
        mov     al,byte ptr [si+7]
        cbw
        push    ax
        call    FAR PTR _GRP_09C6B296
        add     sp,6
        cmp     ax,word ptr [bp-4]
        je      finish
        or      byte ptr [si+6],20h
        mov     di,0ffffh
finish:
        mov     ax,word ptr [si+4]
        mov     word ptr [si],ax
        mov     word ptr [si+2],0
        mov     ax,di
        pop     si
        pop     di
        mov     sp,bp
        pop     bp
        retf
_grp_9a209221 ENDP
_CSEG_9A2 ENDS
        END
