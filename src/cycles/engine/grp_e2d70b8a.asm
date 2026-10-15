        EXTRN   _GRP_5FCB87B2:FAR, _STRLEN:FAR
_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_B20A:WORD, _G_B210:WORD, _G_B212:WORD
        EXTRN   _G_B214:WORD, _G_B218:WORD, _G_B21A:WORD
        EXTRN   _G_B21C:WORD, _G_B21E:WORD, _G_B224:WORD
        EXTRN   _G_B228:WORD, _G_B22C:WORD
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_E2D SEGMENT WORD PUBLIC 'CODE'
        EXTRN   _GRP_FBF668D5:NEAR
        ASSUME  CS:_CSEG_E2D
        ASSUME  DS:DGROUP
        PUBLIC  _grp_e2d70b8a
_grp_e2d70b8a PROC FAR
        push    bp
        mov     bp,sp
        sub     sp,18h
        push    di
        push    si
        cmp     word ptr [bp+6],0ah
        je      no_increment
        inc     word ptr [_G_B21E]
no_increment:
        cmp     word ptr [_G_B212],2
        je      read_long
        cmp     word ptr [_G_B212],10h
        jne     check_count
read_long:
        mov     bx,word ptr [_G_B218]
        mov     ax,word ptr [bx]
        mov     dx,word ptr [bx+2]
        mov     word ptr [bp-4],ax
        mov     word ptr [bp-2],dx
        add     word ptr [_G_B218],4
        jmp     SHORT value_ready
check_count:
        cmp     word ptr [_G_B21E],0
        je      read_signed
        mov     bx,word ptr [_G_B218]
        mov     ax,word ptr [bx]
        mov     word ptr [bp-4],ax
        mov     word ptr [bp-2],0
        jmp     SHORT advance_word
        nop
read_signed:
        mov     bx,word ptr [_G_B218]
        mov     ax,word ptr [bx]
        cwd
        mov     word ptr [bp-4],ax
        mov     word ptr [bp-2],dx
advance_word:
        add     word ptr [_G_B218],2
value_ready:
        cmp     word ptr [_G_B20A],0
        je      zero_value
        mov     ax,word ptr [bp-4]
        or      ax,word ptr [bp-2]
        je      zero_value
        mov     ax,word ptr [bp+6]
        jmp     SHORT store_flag
zero_value:
        sub     ax,ax
store_flag:
        mov     word ptr [_G_B22C],ax
no_flag_store:
        mov     si,word ptr [_G_B228]
        cmp     word ptr [_G_B21E],0
        jne     positive_value
        cmp     word ptr [bp-2],0
        jge     positive_value
        cmp     word ptr [bp+6],0ah
        jne     set_negative
        mov     byte ptr [si],2dh
        inc     si
        mov     ax,word ptr [bp-4]
        mov     dx,word ptr [bp-2]
        neg     ax
        adc     dx,0
        neg     dx
        mov     word ptr [bp-4],ax
        mov     word ptr [bp-2],dx
set_negative:
        mov     word ptr [bp-8],1
        jmp     SHORT convert_value
positive_value:
        mov     word ptr [bp-8],0
convert_value:
        lea     ax,[bp-18h]
        mov     di,ax
        push    word ptr [bp+6]
        push    di
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        call    FAR PTR _GRP_5FCB87B2
        add     sp,8
        cmp     word ptr [_G_B21C],0
        je      copy_buffer
        push    di
        call    FAR PTR _STRLEN
        add     sp,2
        mov     cx,word ptr [_G_B224]
        sub     cx,ax
        mov     word ptr [bp-0ch],cx
        jmp     SHORT pad_check
        nop
pad_zeroes:
        mov     byte ptr [si],30h
        inc     si
pad_check:
        mov     ax,cx
        dec     cx
        or      ax,ax
        jg      pad_zeroes
        mov     word ptr [bp-0ch],cx
copy_buffer:
        mov     cx,word ptr [_G_B210]
copy_char:
        mov     al,byte ptr [di]
        mov     byte ptr [si],al
        or      cx,cx
        je      next_char
        cmp     al,61h
        jl      next_char
        sub     byte ptr [si],20h
next_char:
        inc     si
        inc     di
        cmp     byte ptr [di-1],0
        jne     copy_char
        cmp     word ptr [_G_B21E],0
        jne     return_status
        mov     ax,word ptr [_G_B214]
        or      ax,word ptr [_G_B21A]
        je      return_status
        cmp     word ptr [bp-8],0
        jne     return_status
        mov     ax,1
        jmp     SHORT status_done
return_status:
        sub     ax,ax
status_done:
        push    ax
        push    cs
        call    _GRP_FBF668D5
        add     sp,2
        pop     si
        pop     di
        mov     sp,bp
        pop     bp
        retf
_grp_e2d70b8a ENDP
_CSEG_E2D ENDS
        END



