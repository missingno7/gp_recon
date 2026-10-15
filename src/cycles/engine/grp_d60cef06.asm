_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_A78C:WORD, _G_A78E:WORD
_DATA ENDS
DGROUP GROUP _DATA
        EXTRN   _GRP_43FF7E15:FAR, _GRP_DE0DF4B9:FAR
_CSEG_D60 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_D60
        ASSUME  DS:DGROUP
        ASSUME  SS:_CSEG_D60
        PUBLIC  _grp_d60cef06
        EXTRN   _CS_JT:WORD, _SS_INDIRECT:WORD
_grp_d60cef06 PROC FAR
        push    bp
        mov     bp,sp
        sub     sp,4
        mov     ax,word ptr [bp+6]
        cmp     ax,2
        jne     compare_eight
        clc
        int     23h
        jae     return_zero
        mov     ah,4ch
        int     21h
compare_eight:
        cmp     ax,8
        jne     dispatch_call
        mov     bx,word ptr [_G_A78C]
        or      bx,word ptr [_G_A78E]
        je      return_error
dispatch_call:
        call    FAR PTR _GRP_43FF7E15
        jb      return_error
        mov     ax,word ptr [bx]
        mov     dx,word ptr [bx+2]
        or      dx,dx
        jne     have_descriptor
        cmp     ax,1
        ja      have_descriptor
        or      ax,ax
        jne     return_zero
        mov     bx,cx
        shl     bx,1
        jmp     word ptr cs:[bx+_CS_JT]
have_descriptor:
        mov     word ptr [bp-4],ax
        mov     word ptr [bp-2],dx
        push    es
        push    bp
        push    di
        push    si
        mov     cx,word ptr [bp+6]
        cmp     cx,8
        je      do_io
        xor     ax,ax
        mov     word ptr [bx],ax
        mov     word ptr [bx+2],ax
do_io:
        mov     ax,8ch
        push    ax
        push    cx
        cld
        call    DWORD PTR [bp-4]
        add     sp,4
        pop     si
        pop     di
        pop     bp
        pop     es
        jmp     SHORT return_zero
        nop
return_error_call:
        mov     ax,8ch
        call    DWORD PTR SS:[_SS_INDIRECT]
        mov     ax,3
        push    ax
        call    FAR PTR _GRP_DE0DF4B9
return_error:
        mov     ax,0ffffh
        jmp     SHORT finish
        nop
return_zero:
        xor     ax,ax
finish:
        mov     sp,bp
        pop     bp
        retf
_grp_d60cef06 ENDP
_CSEG_D60 ENDS
        END
