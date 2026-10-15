_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_ABD SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_ABD
        ASSUME  DS:DGROUP
        PUBLIC  _grp_abd3e489
        EXTRN   _G_45FC:WORD, _G_45DC:WORD, _G_4568:BYTE
        EXTRN   _G_45B2:WORD, _G_45BE:WORD, _G_45C0:WORD
        EXTRN   _G_45BA:WORD, _G_45B4:WORD, _G_45B6:WORD, _G_45B8:WORD
        EXTRN   _G_C86C:WORD, _G_45C6:WORD, _G_45D6:BYTE, _G_4594:BYTE
        EXTRN   _G_B7AA:WORD, _G_455E:WORD, _G_F3A:WORD, _G_207D:WORD
        EXTRN   _FN_CYCLES_CGA_01D4D:NEAR, _GRP_4AEA24F8:NEAR
_grp_abd3e489 PROC NEAR
        xor     ax,ax
        mov     word ptr ds:[_G_45FC],ax
        mov     word ptr ds:[_G_45DC],ax
        mov     byte ptr ds:[_G_4568],al
        mov     word ptr ds:[_G_45B2],0
        mov     word ptr ds:[_G_45BE],320h
        mov     word ptr ds:[_G_45C0],320h
        mov     word ptr ds:[_G_45BA],ax
        mov     word ptr ds:[_G_45B4],ax
        mov     word ptr ds:[_G_45B6],ax
        mov     word ptr ds:[_G_45B8],ax
        mov     word ptr ds:[_G_C86C],0
        mov     word ptr ds:[_G_45C6],ax
        mov     byte ptr ds:[_G_45D6],al
        mov     byte ptr ds:[_G_4594],al
        call    NEAR PTR _FN_CYCLES_CGA_01D4D
        mov     word ptr ds:[_G_B7AA],0
        mov     word ptr ds:[_G_455E],0ffffh
        mov     word ptr ds:[_G_F3A],0
        mov     word ptr ds:[_G_207D],0
        call    NEAR PTR _GRP_4AEA24F8
        ret
_grp_abd3e489 ENDP
_CSEG_ABD ENDS
        END
