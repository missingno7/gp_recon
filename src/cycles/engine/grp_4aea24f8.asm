_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_4AEA SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_4AEA
        ASSUME  DS:DGROUP
        PUBLIC  _grp_4aea24f8
        EXTRN   _G_45CE:WORD, _G_45D0:WORD, _G_45D8:WORD, _G_C840:WORD
        EXTRN   _G_45DA:WORD, _G_45C8:BYTE, _G_45C4:WORD
        EXTRN   _G_2092:WORD, _G_2094:WORD, _G_2096:WORD
        EXTRN   _G_375A:WORD, _G_9298:WORD, _G_929C:WORD
        EXTRN   _G_929A:WORD, _G_2098:BYTE, _G_36C4:WORD, _G_209A:WORD
        EXTRN   _FN_CYCLES_CGA_018FF:NEAR
_grp_4aea24f8 PROC NEAR
        mov     word ptr ds:[_G_45CE],64h
        mov     word ptr ds:[_G_45D0],64h
        mov     word ptr ds:[_G_45D8],64h
        mov     word ptr ds:[_G_C840],0
        mov     word ptr ds:[_G_45DA],0ah
        mov     byte ptr ds:[_G_45C8],0
        xor     ax,ax
        mov     word ptr ds:[_G_45C4],ax
        mov     word ptr ds:[_G_2092],ax
        mov     word ptr ds:[_G_2094],ax
        mov     word ptr ds:[_G_2096],ax
        call    NEAR PTR _FN_CYCLES_CGA_018FF
        mov     ax,word ptr ds:[_G_375A]
        mov     word ptr ds:[_G_9298],ax
        mov     word ptr ds:[_G_929C],384h
        mov     word ptr ds:[_G_929A],0ffffh
        mov     byte ptr ds:[_G_2098],0
        mov     ax,word ptr ds:[_G_36C4]
        mov     word ptr ds:[_G_209A],ax
        ret
_grp_4aea24f8 ENDP
_CSEG_4AEA ENDS
        END
