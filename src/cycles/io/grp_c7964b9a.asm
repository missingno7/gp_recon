_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_C796 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_C796
        ASSUME  DS:DGROUP
        PUBLIC  _grp_c7964b9a
        EXTRN   _G_A610:BYTE
        EXTRN   _GRP_22DF478E:FAR
        EXTRN   _FN_CYCLES_CGA_0432E:FAR
        EXTRN   _GRP_41A318F1:FAR
_grp_c7964b9a PROC FAR
        push    bp
        mov     bp,sp
        sub     sp,8
        push    di
        push    si
        mov     si,OFFSET DGROUP:_G_A610
        lea     ax,[bp+8]
        mov     word ptr [bp-4],ax
        push    si
        call    FAR PTR _GRP_22DF478E
        add     sp,2
        mov     di,ax
        lea     ax,[bp+8]
        push    ax
        push    word ptr [bp+6]
        push    si
        call    FAR PTR _FN_CYCLES_CGA_0432E
        add     sp,6
        mov     word ptr [bp-8],ax
        push    si
        push    di
        call    FAR PTR _GRP_41A318F1
        add     sp,4
        mov     ax,word ptr [bp-8]
        pop     si
        pop     di
        mov     sp,bp
        pop     bp
        retf
_grp_c7964b9a ENDP
_CSEG_C796 ENDS
        END
