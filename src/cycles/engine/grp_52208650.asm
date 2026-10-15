_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_A2F0:WORD, _G_A2EE:WORD, _G_A2F2:WORD
_DATA ENDS
DGROUP GROUP _DATA
        EXTRN   _FN_CYCLES_CGA_0559E:FAR, _GRP_C9818520:FAR
_CSEG_522 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_522
        ASSUME  DS:DGROUP
        PUBLIC  _grp_52208650
        EXTRN   _K_9885:ABS
_grp_52208650 PROC FAR
        push    bp
        mov     bp,sp
        push    si
        push    di
        mov     ax,word ptr [bp+8]
        mov     si,word ptr [_G_A2F0]
scan_entries:
        cmp     si,word ptr [_G_A2EE]
        je      report_missing
        cmp     ax,word ptr [si+0eh]
        je      found_entry
        sub     si,12h
        jmp     SHORT scan_entries
report_missing:
        push    word ptr [bp+8]
        mov     ax,_K_9885
        push    ax
        call    FAR PTR _FN_CYCLES_CGA_0559E
found_entry:
        mov     word ptr [bp+8],0
        mov     word ptr [si+10h],0
        cmp     si,word ptr [_G_A2F0]
        je      tail_check
        mov     bx,word ptr [_G_A2F0]
        mov     di,word ptr [_G_A2F2]
        mov     ax,word ptr [di+0eh]
        sub     ax,word ptr [bx+0eh]
        sub     ax,word ptr [bx+0ch]
        cmp     ax,word ptr [si+0ch]
        jb      move_entry
tail_check:
        mov     bx,word ptr [si+0ch]
        push    bx
        mov     di,word ptr [_G_A2F2]
        mov     ax,word ptr [di+0eh]
        sub     ax,bx
        push    ax
        mov     word ptr [bp+8],ax
        push    word ptr [si+0eh]
        sub     di,12h
        mov     word ptr [_G_A2F2],di
        mov     word ptr [di+0eh],ax
        mov     word ptr [di+0ch],bx
        mov     word ptr [di+10h],1
        mov     cx,0ch
        xor     bx,bx
copy_record:
        mov     al,byte ptr [bx+si]
        mov     byte ptr [bx+di],al
        inc     bx
        loop    copy_record
        call    FAR PTR _GRP_C9818520
        add     sp,6
move_entry:
        cmp     si,word ptr [_G_A2F0]
        jne     return_values
remove_empty_head:
        sub     si,12h
        cmp     word ptr [si+10h],0
        je      remove_empty_head
        mov     word ptr [_G_A2F0],si
return_values:
        mov     ax,word ptr [bp+6]
        mov     dx,word ptr [bp+8]
        pop     di
        pop     si
        pop     bp
        retf
_grp_52208650 ENDP
_CSEG_522 ENDS
        END
