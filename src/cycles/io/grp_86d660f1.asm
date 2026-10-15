_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_86D SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_86D
        ASSUME  DS:DGROUP
        PUBLIC  _grp_86d660f1
        EXTRN   _G_459E:WORD, _G_459C:WORD, _G_45A0:WORD
        EXTRN   _G_0EEE:WORD, _G_201C:WORD, _G_201E:WORD, _G_0F3A:WORD
        EXTRN   _G_21FA:WORD, _G_21FC:WORD, _G_21F8:WORD, _G_0EF6:WORD
        EXTRN   _FN_CYCLES_CGA_01DBA:NEAR
        EXTRN   _FN_CYCLES_CGA_01E24:NEAR
        EXTRN   _FN_CYCLES_CGA_01EF1:NEAR
        EXTRN   _FN_CYCLES_CGA_0067E:NEAR
_grp_86d660f1 PROC NEAR
        mov     ax,word ptr ds:[_G_459E]
        dec     ax
        dec     ax
        mov     word ptr ds:[_G_0EEE],ax
        push    ds
        pop     es
        mov     word ptr ds:[_G_201C],0ffffh
        mov     word ptr ds:[_G_201E],0ffffh
        push    word ptr ds:[_G_0F3A]
        mov     ax,word ptr ds:[_G_21FA]
        mov     word ptr ds:[_G_0F3A],ax
        call    NEAR PTR _FN_CYCLES_CGA_01DBA
        call    NEAR PTR _FN_CYCLES_CGA_01E24
        call    NEAR PTR _FN_CYCLES_CGA_01EF1
        mov     ax,word ptr ds:[_G_0F3A]
        mov     word ptr ds:[_G_21FA],ax
        pop     word ptr ds:[_G_0F3A]
        mov     si,13ch
        mov     cx,9fh
        sub     cx,word ptr ds:[_G_0EF6]
        jg      count_ready
        mov     cx,1
count_ready:
        call    NEAR PTR _FN_CYCLES_CGA_0067E
        inc     word ptr ds:[_G_0EF6]
        sar     word ptr ds:[_G_0EF6],1
        ret
_grp_86d660f1 ENDP
_CSEG_86D ENDS
        END
