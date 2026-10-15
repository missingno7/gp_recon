        EXTRN   _GRP_DDBA65F3:FAR
        EXTRN   _GRP_420C3CF4:FAR
        EXTRN   _GRP_AA969348:FAR
_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_A2F2:WORD, _G_A2F4:WORD, _G_A2F0:WORD
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_77D SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_77D
        ASSUME  DS:DGROUP
        ASSUME  SS:_CSEG_77D
        PUBLIC  _grp_77d67394
        EXTRN   _GRP_FBF668D5:NEAR
_grp_77d67394 PROC FAR
        push    bp
        mov     bp,sp
        push    si
        push    di
        mov     si,word ptr [_G_A2F2]
        push    word ptr [bp+6]
        call    FAR PTR _GRP_DDBA65F3
        add     sp,2
        mov     di,ax
search_restart:
        xor     bx,bx
        cmp     word ptr [si+10h],0
        je      not_found
compare_entry:
        mov     al,byte ptr [bx+di]
        or      al,al
        je      check_delimiter
        cmp     byte ptr [bx+si],al
        jne     next_entry
        inc     bx
        cmp     bx,0ch
        jl      compare_entry
        jmp     SHORT found_entry
        nop
check_delimiter:
        cmp     byte ptr [bx+si],2eh
        je      found_entry
        cmp     byte ptr [bx+si],0
        je      found_entry
next_entry:
        add     si,12h
        cmp     si,word ptr [_G_A2F4]
        jb      search_restart
not_found:
        xor     dx,dx
return_ax_zero:
        xor     ax,ax
        pop     di
        pop     si
        pop     bp
        retf
found_entry:
        mov     di,word ptr [_G_A2F0]
        mov     dx,word ptr [di+0eh]
        add     dx,word ptr [di+0ch]
        add     di,12h
        mov     word ptr [_G_A2F0],di
        mov     ax,word ptr [si+0ch]
        push    ax
        push    dx
        push    word ptr [si+0eh]
        mov     word ptr [si+10h],0
        mov     word ptr [di+0eh],dx
        mov     word ptr [di+0ch],ax
        mov     word ptr [di+10h],2
        xor     bx,bx
        mov     cx,0ch
copy_entry:
        mov     al,byte ptr [bx+si]
        mov     byte ptr [bx+di],al
        inc     bx
        loop    copy_entry
        cmp     di,word ptr [_G_A2F2]
        jne     call_insert
        add     word ptr [_G_A2F2],12h
call_insert:
        call    FAR PTR _GRP_420C3CF4
        add     sp,6
        mov     si,word ptr [_G_A2F2]
        mov     di,word ptr [_G_A2F0]
check_sorted:
        mov     ax,word ptr [di+0eh]
        add     ax,word ptr [di+0ch]
compare_sorted:
        cmp     ax,word ptr [si+0eh]
        jbe     sorted_done
        mov     word ptr [si+10h],0
        add     si,12h
        mov     word ptr [_G_A2F2],si
        jmp     SHORT compare_sorted
sorted_done:
        call    FAR PTR _GRP_AA969348
        mov     dx,word ptr [di+0eh]
        jmp     SHORT return_ax_zero
_grp_77d67394 ENDP
_CSEG_77D ENDS
        END
