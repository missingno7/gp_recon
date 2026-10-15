_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_B212:WORD, _G_B216:WORD, _G_B218:WORD
        EXTRN   _G_B21C:WORD, _G_B224:WORD, _G_B22A:WORD
        EXTRN   _G_A722:BYTE, _G_A729:BYTE
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_4794 SEGMENT WORD PUBLIC 'CODE'
        EXTRN   _GRP_D774E047:NEAR, _GRP_925F0B41:NEAR
        ASSUME  CS:_CSEG_4794
        ASSUME  DS:DGROUP
        PUBLIC  _grp_095f99de
_grp_095f99de PROC FAR
        push    bp
        mov     bp,sp
        sub     sp,10h
        push    di
        push    si
        cmp     word ptr [bp+6],0
        je      choose_arg
        mov     si,1
        mov     ax,word ptr [_G_B218]
        mov     word ptr [bp-8],ax
        mov     word ptr [bp-6],ds
        add     word ptr [_G_B218],2
        jmp     scan_start
choose_arg:
        cmp     word ptr [_G_B212],10h
        jne     near_arg
        mov     bx,word ptr [_G_B218]
        mov     ax,word ptr [bx]
        mov     dx,word ptr [bx+2]
        mov     word ptr [bp-8],ax
        mov     word ptr [bp-6],dx
        add     word ptr [_G_B218],4
        jmp     SHORT set_arg_end
        nop
near_arg:
        mov     bx,word ptr [_G_B218]
        mov     ax,word ptr [bx]
        mov     word ptr [bp-4],ax
        mov     word ptr [bp-8],ax
        mov     word ptr [bp-6],ds
        add     word ptr [_G_B218],2
set_arg_end:
        cmp     word ptr [_G_B212],10h
        jne     test_near_null
        mov     ax,word ptr [bp-8]
        or      ax,word ptr [bp-6]
        jne     arg_ready
        mov     ax,OFFSET DGROUP:_G_A722
        jmp     SHORT set_default
 test_near_null:
        cmp     word ptr [bp-4],0
        jne     arg_ready
        mov     ax,OFFSET DGROUP:_G_A729
set_default:
        mov     word ptr [bp-8],ax
        mov     word ptr [bp-6],ds
arg_ready:
        mov     ax,word ptr [bp-8]
        mov     dx,word ptr [bp-6]
        mov     word ptr [bp-0eh],ax
        mov     word ptr [bp-0ch],dx
        sub     si,si
        cmp     word ptr [_G_B21C],si
        je      unbounded_check
        mov     cx,word ptr [_G_B224]
        jmp     SHORT bounded_check
        nop
bounded_scan:
        les     bx,dword ptr [bp-0eh]
        inc     word ptr [bp-0eh]
        cmp     byte ptr es:[bx],0
        je      scan_start
        inc     si
bounded_check:
        cmp     cx,si
        jle     scan_start
        jmp     SHORT bounded_scan
        nop
unbounded_scan:
        inc     si
unbounded_check:
        les     bx,dword ptr [bp-0eh]
        inc     word ptr [bp-0eh]
        cmp     byte ptr es:[bx],0
        jne     unbounded_scan
scan_start:
        mov     di,word ptr [_G_B22A]
        sub     di,si
        cmp     word ptr [_G_B216],0
        jne     skip_prefix
        push    di
        push    cs
        call    _GRP_D774E047
        add     sp,2
skip_prefix:
        push    si
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        push    cs
        call    _GRP_925F0B41
        add     sp,6
        cmp     word ptr [_G_B216],0
        je      finish
        push    di
        push    cs
        call    _GRP_D774E047
        add     sp,2
finish:
        pop     si
        pop     di
        mov     sp,bp
        pop     bp
        retf
_grp_095f99de ENDP
_CSEG_4794 ENDS
        END

