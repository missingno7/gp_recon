_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_TEXT
        EXTRN _GRP_C4F9F805:NEAR
        EXTRN _FN_CIRCUIT_CGA_09B70:NEAR
        PUBLIC _grp_622c4ed2
_G_09404 EQU 93dch
_G_0C7D2 EQU 0a852h
_grp_622c4ed2 PROC NEAR
        push    bp
        mov     bp,sp
        sub     sp,2
        push    word ptr [bp+4]
        call    _GRP_C4F9F805
        add     sp,2
        shl     ax,1
        shl     ax,1
        mov     es,word ptr ds:[_G_09404]
        mov     cx,ax
        mov     ax,word ptr es:[_G_0C7D2]
        cwd
        sub     ax,dx
        sar     ax,1
        sub     ax,cx
        mov     word ptr [bp-2],ax
        push    word ptr [bp+6]
        push    ax
        push    word ptr [bp+4]
        call    _FN_CIRCUIT_CGA_09B70
        mov     sp,bp
        pop     bp
        ret
_grp_622c4ed2 ENDP
_TEXT ENDS
        END
