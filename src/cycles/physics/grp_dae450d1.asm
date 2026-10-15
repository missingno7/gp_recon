; Fixed-point accumulator clamp using the original high-byte arithmetic idiom.
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_TEXT
_g_0ef0 EQU 0EF0h
_g_0ef2 EQU 0EF2h
        PUBLIC  _grp_dae450d1
_grp_dae450d1 PROC NEAR
        mov     ah,byte ptr ds:[_g_0ef2]
        xor     al,al
        sar     ax,1
        add     ax,word ptr ds:[_g_0ef0]
        cmp     ax,5a00h
        jl      short lower_done
        mov     ax,5a00h
lower_done:
        cmp     ax,0a600h
        jg      short upper_done
        mov     ax,0a600h
upper_done:
        mov     word ptr ds:[_g_0ef0],ax
        ret
_grp_dae450d1 ENDP
_TEXT ENDS
        END
