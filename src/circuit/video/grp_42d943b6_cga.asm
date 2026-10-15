_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_TEXT
        PUBLIC _grp_42d943b6
_FIELD_73D8 EQU 73B0h
_G_00708 EQU 0708h
_G_006C2 EQU 06C2h
_grp_42d943b6 PROC NEAR
        push    ax
        push    bx
        push    cx
        sub     ax,0a0h
        sar     ax,1
        sar     ax,1
        sar     ax,1
        sar     ax,1
        neg     ax
        mov     bx,ax
        mov     di,word ptr ds:[_G_00708]
        mov     ax,word ptr [di+_FIELD_73D8]
        mov     al,ah
        cbw
        sar     ax,1
        sar     ax,1
        add     bx,ax
        shl     bx,1
        cmp     bx,20h
        jg      short upper_limit
        cmp     bx,-20h
        jl      short lower_limit
        mov     di,word ptr [bx+_G_006C2]
        pop     cx
        pop     bx
        pop     ax
        ret
upper_limit:
        mov     di,40h
        pop     cx
        pop     bx
        pop     ax
        ret
lower_limit:
        mov     di,0
        pop     cx
        pop     bx
        pop     ax
        ret
_grp_42d943b6 ENDP
_TEXT ENDS
        END
