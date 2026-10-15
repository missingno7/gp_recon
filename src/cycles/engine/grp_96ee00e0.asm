_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_215A:WORD, _G_45B2:WORD, _G_0DC2:WORD
        EXTRN   _G_0EF4:WORD, _G_0E56:WORD, _G_2162:WORD
        EXTRN   _G_0EF0:WORD, _G_216A:WORD, _G_0EEC:WORD, _G_0EEE:WORD
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_96E SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_96E
        ASSUME  DS:DGROUP
        ASSUME  SS:_CSEG_96E
        PUBLIC  _grp_96ee00e0
        EXTRN   _GRP_AD63F6B1:NEAR, _GRP_F816E763:NEAR, _GRP_DAE450D1:NEAR
        EXTRN   _FN_CYCLES_CGA_006AD:NEAR
_grp_96ee00e0 PROC NEAR
        mov     ax,word ptr [_G_215A]
        call    NEAR PTR _GRP_AD63F6B1
        shl     ax,1
        add     ax,word ptr [_G_45B2]
        mov     word ptr [_G_0DC2],ax
        mov     ax,word ptr [_G_0EF4]
        mov     word ptr [_G_0E56],ax
        mov     ax,word ptr [_G_2162]
        mov     word ptr [_G_0EF0],ax
        mov     ax,word ptr [_G_216A]
        mov     word ptr [_G_0EEC],ax
        xor     bp,bp
        mov     bx,word ptr [_G_0EEE]
        call    NEAR PTR _FN_CYCLES_CGA_006AD
        mov     bp,2
        inc     word ptr [_G_0EEE]
loop_update:
        mov     bx,word ptr [_G_0EEE]
        call    NEAR PTR _FN_CYCLES_CGA_006AD
        call    NEAR PTR _GRP_F816E763
        call    NEAR PTR _GRP_AD63F6B1
        add     ax,word ptr [bp+0dc0h]
        mov     word ptr [bp+0dc2h],ax
        call    NEAR PTR _GRP_DAE450D1
        call    NEAR PTR _GRP_AD63F6B1
        sar     ax,1
        sar     ax,1
        add     ax,word ptr [bp+0e54h]
        mov     word ptr [bp+0e56h],ax
        inc     bp
        inc     bp
        inc     word ptr [_G_0EEE]
        cmp     bp,90h
        jl      loop_update
        ret
_grp_96ee00e0 ENDP
_CSEG_96E ENDS
        END
