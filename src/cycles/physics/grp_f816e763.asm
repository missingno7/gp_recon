; Second fixed-point accumulator uses two signed arithmetic shifts.
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_TEXT
_g_0eec EQU 0EECh
_g_0eea EQU 0EEAh
        PUBLIC  _grp_f816e763
_grp_f816e763 PROC NEAR
        mov     ah,byte ptr ds:[_g_0eea]
        xor     al,al
        sar     ax,1
        sar     ax,1
        add     ax,word ptr ds:[_g_0eec]
        cmp     ax,5a00h
        jl      short lower_done
        mov     ax,5a00h
lower_done:
        cmp     ax,0a600h
        jg      short upper_done
        mov     ax,0a600h
upper_done:
        mov     word ptr ds:[_g_0eec],ax
        ret
_grp_f816e763 ENDP
_TEXT ENDS
        END
