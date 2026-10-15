        EXTRN   _GRP_07DC1757:FAR
_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_A608:WORD, _G_A6A8:WORD
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_E99 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_E99
        ASSUME  DS:DGROUP
        ASSUME  SS:_CSEG_E99
        PUBLIC  _grp_e99c915a
        EXTRN   _GRP_3DE068C9:NEAR
_grp_e99c915a PROC FAR
        push    bp
        mov     bp,sp
        sub     sp,2
        push    si
        mov     si,word ptr [bp+6]
        mov     ax,si
        sub     ax,OFFSET DGROUP:_G_A608
        mov     cl,3
        sar     ax,cl
        mov     cx,ax
        shl     ax,1
        add     ax,cx
        shl     ax,1
        add     ax,OFFSET DGROUP:_G_A6A8
        mov     word ptr [bp-2],ax
        test    byte ptr [si+6],83h
        je      return_minus_one
        test    byte ptr [si+6],40h
        je      check_flag_two
return_minus_one:
        mov     ax,0ffffh
        jmp     near ptr cleanup
        nop
check_flag_two:
        test    byte ptr [si+6],2
        je      set_flag_one
        or      byte ptr [si+6],20h
        jmp     near ptr return_minus_one
set_flag_one:
        or      byte ptr [si+6],1
        mov     bx,word ptr [bp-2]
        and     byte ptr [bx],0fbh
        test    byte ptr [si+6],0ch
        jne     update_duration
        mov     bx,si
        sub     bx,OFFSET DGROUP:_G_A608
        mov     cl,3
        sar     bx,cl
        mov     ax,bx
        shl     bx,1
        add     bx,ax
        shl     bx,1
        test    byte ptr [bx+OFFSET DGROUP:_G_A6A8],1
        jne     update_duration
        push    si
        call    near ptr _GRP_3DE068C9
        add     sp,2
        jmp     SHORT duration_ready
update_duration:
        mov     ax,word ptr [si+4]
        mov     word ptr [si],ax
duration_ready:
        mov     bx,word ptr [bp-2]
        push    word ptr [bx+2]
        push    word ptr [si+4]
        mov     al,byte ptr [si+7]
        cbw
        push    ax
        call    FAR PTR _GRP_07DC1757
        add     sp,6
        mov     word ptr [si+2],ax
        or      ax,ax
        je      status_result
        cmp     ax,0ffffh
        jne     decrement_count
status_result:
        cmp     word ptr [si+2],0
        je      set_error_flag
        mov     al,20h
        jmp     SHORT merge_error
        nop
set_error_flag:
        mov     al,10h
merge_error:
        or      byte ptr [si+6],al
        mov     word ptr [si+2],0
        jmp     near ptr return_minus_one
        nop
decrement_count:
        dec     word ptr [si+2]
        mov     bx,word ptr [si]
        inc     word ptr [si]
        mov     al,byte ptr [bx]
        sub     ah,ah
cleanup:
        pop     si
        mov     sp,bp
        pop     bp
        retf
_grp_e99c915a ENDP
_CSEG_E99 ENDS
        END
