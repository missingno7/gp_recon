        EXTRN   _FN_CYCLES_CGA_0801E:FAR
        EXTRN   _FN_CYCLES_CGA_12A5A:FAR
        EXTRN   _FN_CYCLES_CGA_11858:FAR
        EXTRN   _FN_CYCLES_CGA_069FE:FAR
        EXTRN   _GRP_7037B130:FAR
        EXTRN   _FN_CYCLES_CGA_0563E:FAR
        EXTRN   _FN_CYCLES_CGA_10948:FAR
        EXTRN   _GRP_1C2275E7:FAR
        EXTRN   _GRP_52208650:FAR
_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_013E:WORD, _G_013A:WORD, _G_013C:WORD
        EXTRN   _G_0132:WORD, _G_0134:WORD, _G_0136:WORD
        EXTRN   _G_0138:WORD
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_BFCA SEGMENT WORD PUBLIC 'CODE'
        EXTRN   _GRP_5C8B15C8:NEAR, _GRP_EFEF7148:NEAR
        EXTRN   _GRP_BC055BB1:NEAR
        ASSUME  CS:_CSEG_BFCA
        ASSUME  DS:DGROUP
        PUBLIC  _grp_b945b1b8
_grp_b945b1b8 PROC FAR
        push    bp
        mov     bp,sp
        sub     sp,2
        sub     ax,ax
        push    ax
        call    FAR PTR _FN_CYCLES_CGA_0801E
        add     sp,2
        mov     ax,11ah
        push    ax
        call    FAR PTR _FN_CYCLES_CGA_12A5A
        add     sp,2
        mov     word ptr [_G_013A],ax
        mov     word ptr [_G_013C],dx
        mov     ax,123h
        push    ax
        call    FAR PTR _FN_CYCLES_CGA_12A5A
        add     sp,2
        mov     word ptr [_G_0132],ax
        mov     word ptr [_G_0134],dx
        mov     ax,word ptr [_G_013E]
        inc     word ptr [_G_013E]
        or      ax,ax
        jne     after_query
        call    FAR PTR _FN_CYCLES_CGA_11858
        or      ax,ax
        jne     after_query
        call    FAR PTR _FN_CYCLES_CGA_069FE
after_query:
        mov     ax,12ch
        push    ax
        call    FAR PTR _FN_CYCLES_CGA_12A5A
        add     sp,2
        mov     word ptr [_G_0136],ax
        mov     word ptr [_G_0138],dx
        sub     ax,ax
        push    ax
        call    FAR PTR _GRP_7037B130
        add     sp,2
        push    cs
        call    _GRP_5C8B15C8
        mov     word ptr [bp-2],ax
        or      ax,ax
        jne     first_done
        push    cs
        call    _GRP_EFEF7148
        mov     word ptr [bp-2],ax
first_done:
        cmp     word ptr [bp-2],0
        jne     second_done
        push    cs
        call    _GRP_BC055BB1
        mov     word ptr [bp-2],ax
second_done:
        cmp     word ptr [bp-2],0
        jne     third_done
        push    cs
        call    _GRP_EFEF7148
        mov     word ptr [bp-2],ax
third_done:
        cmp     word ptr [bp-2],0
        jne     setup_done
        mov     ax,10eh
        cwd
        push    dx
        push    ax
        call    FAR PTR _FN_CYCLES_CGA_0563E
        add     sp,4
        call    FAR PTR _FN_CYCLES_CGA_10948
        mov     word ptr [bp-2],ax
setup_done:
        call    FAR PTR _GRP_1C2275E7
        push    word ptr [_G_0138]
        push    word ptr [_G_0136]
        call    FAR PTR _GRP_52208650
        add     sp,4
        push    word ptr [_G_0134]
        push    word ptr [_G_0132]
        call    FAR PTR _GRP_52208650
        add     sp,4
        push    word ptr [_G_013C]
        push    word ptr [_G_013A]
        call    FAR PTR _GRP_52208650
        add     sp,4
        mov     ax,word ptr [bp-2]
        mov     sp,bp
        pop     bp
        retf
_grp_b945b1b8 ENDP
_CSEG_BFCA ENDS
        END
