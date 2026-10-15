_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_097CC:NEAR
        PUBLIC _grp_1f63ab13
_G_008EA EQU 08E6h
_G_00906 EQU 0902h
_G_05FDA EQU 5FBEh
_G_008E6 EQU 08E2h
_G_06312 EQU 62F6h
_G_06310 EQU 62F4h
_grp_1f63ab13 PROC NEAR
        mov     ax,word ptr ds:[_G_008EA]
        add     ax,0bb8h
        add     ax,word ptr ds:[_G_00906]
        sub     ax,word ptr ds:[_G_05FDA]
        shr     ax,1
        shr     ax,1
        shr     ax,1
        shr     ax,1
        shr     ax,1
        shr     ax,1
        and     ax,01ffh
        neg     ax
        add     ax,016ah
        push    word ptr ds:[_G_008E6]
        push    ax
        push    word ptr ds:[_G_06312]
        push    word ptr ds:[_G_06310]
        call    _FN_CIRCUIT_CGA_097CC
        add     sp,8
        ret
_grp_1f63ab13 ENDP
_TEXT ENDS
        END
