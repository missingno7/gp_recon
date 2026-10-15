_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_7D3 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_7D3
        ASSUME  DS:DGROUP
        PUBLIC  _grp_7d3b9038
        EXTRN   _G_HEAD:WORD, _G_TAIL:WORD, _G_SENTINEL:WORD
        EXTRN   _G_MSG_NO_SPACE:BYTE, _G_MSG_FULL:BYTE
        EXTRN   _FN_CYCLES_CGA_06B1B:FAR, _FN_CYCLES_CGA_0559E:FAR
_grp_7d3b9038 PROC FAR
        push    bp
        mov     bp,sp
        push    si
        push    di
        mov     di,word ptr ds:[_G_HEAD]
        mov     si,word ptr ds:[_G_TAIL]
        mov     dx,word ptr [di+0eh]
        add     dx,word ptr [di+0ch]
        add     di,12h
        cmp     si,di
        jbe     tail_check
allocate_block:
        mov     word ptr ds:[_G_HEAD],di
        push    word ptr [bp+6]
        call    FAR PTR _FN_CYCLES_CGA_06B1B
        add     sp,2
        mov     si,ax
        xor     bx,bx
        mov     cx,0ch
copy_block:
        mov     al,byte ptr [bx+si]
        mov     byte ptr [bx+di],al
        inc     bx
        loop    copy_block
        mov     si,word ptr ds:[_G_TAIL]
        mov     ax,word ptr [bp+8]
        mov     word ptr [di+0eh],dx
        mov     word ptr [di+0ch],ax
        mov     word ptr [di+10h],2
        add     ax,dx
        cmp     ax,word ptr [si+0eh]
        ja      capacity_calc
return_zero:
        xor     ax,ax
        pop     di
        pop     si
        pop     bp
        retf
tail_check:
        cmp     si,word ptr ds:[_G_SENTINEL]
        je      no_space
        add     si,12h
        mov     word ptr ds:[_G_TAIL],si
        jmp     allocate_block
no_space:
        push    word ptr [bp+6]
        mov     ax,OFFSET DGROUP:_G_MSG_NO_SPACE
        push    ax
        call    FAR PTR _FN_CYCLES_CGA_0559E
capacity_calc:
        mov     si,word ptr ds:[_G_TAIL]
        mov     di,word ptr ds:[_G_HEAD]
        mov     ax,word ptr [di+0eh]
        add     ax,word ptr [di+0ch]
capacity_test:
        cmp     ax,word ptr [si+0eh]
        jbe     return_zero
        cmp     si,word ptr ds:[_G_SENTINEL]
        je      all_full
        mov     word ptr [si+10h],0
        add     si,12h
        mov     word ptr ds:[_G_TAIL],si
        jmp     capacity_test
all_full:
        push    word ptr [bp+6]
        mov     ax,OFFSET DGROUP:_G_MSG_FULL
        push    ax
        call    FAR PTR _FN_CYCLES_CGA_0559E
_grp_7d3b9038 ENDP
_CSEG_7D3 ENDS
        END
