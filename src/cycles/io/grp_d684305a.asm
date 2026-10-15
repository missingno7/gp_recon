_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_D684 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_D684
        PUBLIC  _grp_d684305a
        EXTRN   _G_CS_CURSOR:WORD
        EXTRN   _GRP_7F64E2F7:FAR
_grp_d684305a PROC FAR
        push    bp
        mov     bp,sp
        push    ds
        push    si
        push    di
        mov     es,word ptr [bp+8]
        mov     di,word ptr [bp+6]
        mov     ds,word ptr es:[di+2]
        mov     si,word ptr es:[di]
        mov     ax,word ptr [si+2]
        add     ax,0dh
        shl     ax,1
        mov     bx,word ptr cs:[_G_CS_CURSOR]
        sub     bx,ax
        mov     word ptr cs:[_G_CS_CURSOR],bx
        push    ds
        push    si
        mov     ds,word ptr [bp-2]
        call    FAR PTR _GRP_7F64E2F7
        add     sp,4
        pop     di
        pop     si
        pop     ds
        pop     bp
        retf
_grp_d684305a ENDP
_CSEG_D684 ENDS
        END
