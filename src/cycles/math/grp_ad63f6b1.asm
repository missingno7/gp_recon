; Register-input signed table leaf observed in the Cycles engine.
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_TEXT
_g_0f3c EQU 0F3Ch
        PUBLIC  _grp_ad63f6b1
_grp_ad63f6b1 PROC NEAR
        push    bx
        or      ax,ax
        jg      positive
        neg     ax
        and     al,0c0h
        rol     ax,1
        rol     ax,1
        xchg    al,ah
        mov     bx,ax
        mov     al,byte ptr ds:[bx+_g_0f3c]
        xor     ah,ah
        neg     ax
        pop     bx
        ret
positive:
        and     al,0c0h
        rol     ax,1
        rol     ax,1
        xchg    al,ah
        mov     bx,ax
        mov     al,byte ptr ds:[bx+_g_0f3c]
        xor     ah,ah
        pop     bx
        ret
_grp_ad63f6b1 ENDP
_TEXT ENDS
        END
