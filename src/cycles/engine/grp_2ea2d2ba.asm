_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_2020:WORD, _G_2022:WORD, _G_2024:WORD, _G_2026:WORD
        EXTRN   _G_2028:WORD, _G_202A:WORD, _G_4550:WORD, _G_455E:WORD
_DATA ENDS
DGROUP GROUP _DATA
        EXTRN   _FN_CYCLES_CGA_08322:FAR
_CSEG_2EA SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_2EA
        ASSUME  DS:DGROUP
        ASSUME  ES:_CSEG_2EA
        PUBLIC  _grp_2ea2d2ba
        EXTRN   _ES_4812:WORD
_grp_2ea2d2ba PROC NEAR
        mov     word ptr [_G_2020],ax
        mov     word ptr [_G_2022],bx
        mov     word ptr [_G_2024],cx
        mov     word ptr [_G_2026],dx
        mov     bx,word ptr [_G_2028]
        mov     ax,SEG _FN_CYCLES_CGA_08322
        mov     es,ax
        mov     ax,word ptr [_G_4550]
        mov     word ptr es:[_ES_4812],ax
        mov     ax,word ptr [_G_2020]
        mov     cx,word ptr [_G_2026]
        mov     dx,word ptr [_G_202A]
        sub     bx,dx
        sub     cx,ax
        push    word ptr [_G_455E]
        push    dx
        push    cx
        push    bx
        push    ax
        call    FAR PTR _FN_CYCLES_CGA_08322
        add     sp,0ah
        mov     bx,word ptr [_G_2028]
        mov     dx,si
        sub     dx,bx
        inc     dx
        push    dx
        mov     ax,word ptr [_G_2020]
        mov     cx,word ptr [_G_2022]
        sub     cx,ax
        push    word ptr [_G_455E]
        push    dx
        push    cx
        push    bx
        push    ax
        call    FAR PTR _FN_CYCLES_CGA_08322
        add     sp,0ah
        pop     dx
        mov     bx,word ptr [_G_2028]
        mov     ax,word ptr [_G_2024]
        mov     cx,word ptr [_G_2026]
        sub     cx,ax
        push    word ptr [_G_455E]
        push    dx
        push    cx
        push    bx
        push    ax
        call    FAR PTR _FN_CYCLES_CGA_08322
        add     sp,0ah
        ret
_grp_2ea2d2ba ENDP
_CSEG_2EA ENDS
        END
