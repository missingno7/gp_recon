_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_TEXT
        PUBLIC  _grp_ac9f7163
_grp_ac9f7163 PROC FAR
        push    bp
        mov     bp,sp
        push    di
        mov     di,word ptr [bp+6]
        push    ds
        pop     es
        mov     bx,di
        xor     ax,ax
        mov     cx,0ffffh
        repne   scasb
        inc     cx
        neg     cx
        mov     al,byte ptr [bp+8]
        mov     di,bx
        repne   scasb
        dec     di
        cmp     byte ptr [di],al
        je      found_char
        xor     di,di
found_char:
        mov     ax,di
        pop     di
        mov     sp,bp
        pop     bp
        retf
_grp_ac9f7163 ENDP
_TEXT ENDS
        END
