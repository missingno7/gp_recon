        EXTRN   _strlen:FAR
_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_B228:WORD, _G_B22E:WORD, _G_B21C:WORD
        EXTRN   _G_B20E:WORD, _G_B226:WORD, _G_B22A:WORD
        EXTRN   _G_B216:WORD, _G_B22C:WORD
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_4A48 SEGMENT WORD PUBLIC 'CODE'
        EXTRN   _GRP_8BFF9570:NEAR, _GRP_D774E047:NEAR
        EXTRN   _GRP_925F0B41:NEAR, _FN_CYCLES_CGA_04B34:NEAR
        EXTRN   _FN_CYCLES_CGA_04B4C:NEAR
        ASSUME  CS:_CSEG_4A48
        ASSUME  DS:DGROUP
        PUBLIC  _grp_fbf668d5
_grp_fbf668d5 PROC FAR
        push    bp
        mov     bp,sp
        sub     sp,0ah
        push    di
        push    si
        mov     si,word ptr [_G_B228]
        sub     ax,ax
        mov     word ptr [bp-4],ax
        mov     word ptr [bp-6],ax
        cmp     word ptr [_G_B22E],30h
        jne     format_ready
        cmp     word ptr [_G_B21C],ax
        je      format_ready
        cmp     word ptr [_G_B20E],ax
        je      format_word
        cmp     word ptr [_G_B226],ax
        jne     format_ready
format_word:
        mov     word ptr [_G_B22E],20h
format_ready:
        mov     di,word ptr [_G_B22A]
        push    si
        call    FAR PTR _strlen
        add     sp,2
        mov     word ptr [bp-8],ax
        sub     di,ax
        sub     di,word ptr [bp+6]
        cmp     word ptr [_G_B216],0
        jne     sign_done
        cmp     byte ptr [si],2dh
        jne     sign_done
        cmp     word ptr [_G_B22E],30h
        jne     sign_done
        lodsb
        cbw
        push    ax
        push    cs
        call    _GRP_8BFF9570
        add     sp,2
        dec     word ptr [bp-8]
sign_done:
        cmp     word ptr [_G_B22E],30h
        je      padding_done
        or      di,di
        jle     padding_done
        cmp     word ptr [_G_B216],0
        je      zero_pad
padding_done:
        cmp     word ptr [bp+6],0
        je      custom_pad_done
        inc     word ptr [bp-6]
        push    cs
        call    _FN_CYCLES_CGA_04B34
custom_pad_done:
        cmp     word ptr [_G_B22C],0
        je      zero_pad
        inc     word ptr [bp-4]
        push    cs
        call    _FN_CYCLES_CGA_04B4C
zero_pad:
        cmp     word ptr [_G_B216],0
        jne     format_emit
        push    di
        push    cs
        call    _GRP_D774E047
        add     sp,2
        cmp     word ptr [bp+6],0
        je      custom_after_emit
        cmp     word ptr [bp-6],0
        jne     custom_after_emit
        push    cs
        call    _FN_CYCLES_CGA_04B34
custom_after_emit:
        cmp     word ptr [_G_B22C],0
        je      format_emit
        cmp     word ptr [bp-4],0
        jne     format_emit
        push    cs
        call    _FN_CYCLES_CGA_04B4C
format_emit:
        push    word ptr [bp-8]
        push    ds
        push    si
        push    cs
        call    _GRP_925F0B41
        add     sp,6
        cmp     word ptr [_G_B216],0
        je      done
        mov     word ptr [_G_B22E],20h
        push    di
        push    cs
        call    _GRP_D774E047
        add     sp,2
done:
        pop     si
        pop     di
        mov     sp,bp
        pop     bp
        retf
_grp_fbf668d5 ENDP
_CSEG_4A48 ENDS
        END
