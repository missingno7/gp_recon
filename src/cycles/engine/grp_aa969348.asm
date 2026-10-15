_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_A2F4:WORD, _G_A2F2:WORD
_DATA ENDS
DGROUP GROUP _DATA
        EXTRN   _GRP_C9818520:FAR
_CSEG_AA9 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_AA9
        ASSUME  DS:DGROUP
        PUBLIC  _grp_aa969348
_grp_aa969348 PROC FAR
        push    si
        push    di
        push    dx
        mov     si,word ptr [_G_A2F4]
        mov     di,si
        xor     dx,dx
scan_item:
        test    word ptr [si+10h],1
        jne     flagged
        add     dx,word ptr [si+0ch]
        jmp     SHORT advance_item
        nop
flagged:
        or      dx,dx
        jne     process_flagged
shift_di:
        sub     di,12h
advance_item:
        sub     si,12h
        cmp     si,word ptr [_G_A2F2]
        jae     scan_item
        add     di,12h
        mov     word ptr [_G_A2F2],di
        pop     dx
        pop     di
        pop     si
        retf
process_flagged:
        mov     bx,word ptr [si+0ch]
        push    bx
        add     di,12h
        mov     ax,word ptr [di+0eh]
        sub     ax,bx
        push    ax
        push    word ptr [si+0eh]
        sub     di,12h
        mov     word ptr [di+0ch],bx
        mov     word ptr [di+0eh],ax
        mov     cx,word ptr [si+10h]
        mov     word ptr [si+10h],0
        mov     word ptr [di+10h],cx
        xor     bx,bx
        mov     cx,0ch
copy_byte:
        mov     al,byte ptr [bx+si]
        mov     byte ptr [bx+di],al
        inc     bx
        loop    copy_byte
        call    FAR PTR _GRP_C9818520
        add     sp,6
        jmp     SHORT shift_di
_grp_aa969348 ENDP
_CSEG_AA9 ENDS
        END
