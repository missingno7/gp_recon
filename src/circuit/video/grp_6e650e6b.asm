_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_TEXT

        PUBLIC  _grp_6e650e6b
_grp_6e650e6b PROC NEAR
        push    bp
        mov     bp,sp
        mov     dx,03d8h
        mov     ax,7
        cmp     word ptr [bp+4],0
        je      short mode_done
        mov     ax,0eh
mode_done:
        out     dx,al
        pop     bp
        ret
_grp_6e650e6b ENDP

_TEXT ENDS
        END
