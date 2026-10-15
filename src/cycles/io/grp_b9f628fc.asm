_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_B9F SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_B9F
        ASSUME  DS:DGROUP
        PUBLIC  _grp_b9f628fc
        EXTRN   _FN_CYCLES_CGA_0432E:FAR, _GRP_63468620:FAR
_grp_b9f628fc PROC FAR
        push    bp
        mov     bp,sp
        sub     sp,0eh
        push    di
        push    si
        lea     ax,[bp-0ch]
        mov     di,ax
        lea     ax,[bp+0ah]
        mov     word ptr [bp-2],ax
        mov     byte ptr [di+6],42h
        mov     ax,word ptr [bp+6]
        mov     word ptr [di+4],ax
        mov     word ptr [di],ax
        mov     word ptr [di+2],7fffh
        lea     ax,[bp+0ah]
        push    ax
        push    word ptr [bp+8]
        push    di
        call    FAR PTR _FN_CYCLES_CGA_0432E
        add     sp,6
        mov     si,ax
        dec     word ptr [di+2]
        js      report_overflow
        sub     al,al
        mov     bx,word ptr [di]
        inc     word ptr [di]
        mov     byte ptr [bx],al
        jmp     return_result
report_overflow:
        push    di
        sub     ax,ax
        push    ax
        call    FAR PTR _GRP_63468620
        add     sp,4
return_result:
        mov     ax,si
        pop     si
        pop     di
        mov     sp,bp
        pop     bp
        retf
_grp_b9f628fc ENDP
_CSEG_B9F ENDS
        END
