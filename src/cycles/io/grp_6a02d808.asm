_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_6A SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_6A
        ASSUME  DS:DGROUP
        PUBLIC  _grp_6a02d808
        EXTRN   _G_INIT_STATUS:WORD
        EXTRN   _GRP_06026D94:NEAR
        EXTRN   _FN_CYCLES_CGA_0368E:NEAR
        EXTRN   _FN_CYCLES_CGA_04CF8:FAR
_grp_6a02d808 PROC FAR
        push    bp
        mov     bp,sp
        sub     sp,2
        push    si
        push    di
        mov     ax,word ptr [bp+6]
        cmp     ax,0fff1h
        jae     report_error
        cmp     word ptr ds:[_G_INIT_STATUS],0
        jne     poll_state
        call    _GRP_06026D94
        je      report_error
        mov     word ptr ds:[_G_INIT_STATUS],ax
poll_state:
        call    _FN_CYCLES_CGA_0368E
        jne     restore_state
        call    _GRP_06026D94
        je      report_error
        call    _FN_CYCLES_CGA_0368E
        jne     restore_state
report_error:
        push    word ptr [bp+6]
        call    FAR PTR _FN_CYCLES_CGA_04CF8
        add     sp,2
restore_state:
        pop     di
        pop     si
        mov     sp,bp
        pop     bp
        retf
_grp_6a02d808 ENDP
_CSEG_6A ENDS
        END
