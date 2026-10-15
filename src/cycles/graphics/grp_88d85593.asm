_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_88D SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_88D
        ASSUME  DS:DGROUP
        PUBLIC  _grp_88d85593
_grp_88d85593 PROC FAR
        push    bp
        mov     bp,sp
        mov     dx,3ceh
        mov     al,5
        out     dx,al
        mov     dx,3cfh
        mov     al,0
        out     dx,al
        mov     dx,3ceh
        mov     al,8
        out     dx,al
        mov     dx,3cfh
        mov     al,0ffh
        out     dx,al
        push    es
        push    ds
        push    si
        push    di
        mov     ax,word ptr [bp+8]
        mov     ds,ax
        mov     ax,word ptr [bp+0ch]
        mov     es,ax
        mov     si,word ptr [bp+6]
        mov     di,word ptr [bp+0ah]
        mov     bx,word ptr [bp+10h]
        or      bx,bx
        jle     transfer_done
        mov     dx,14h
        cld
transfer_line:
        mov     dx,3c4h
        mov     al,2
        out     dx,al
        inc     dx
        mov     al,1
        out     dx,al
        mov     cx,14h
        rep     movsw
        mov     dx,3c4h
        mov     al,2
        out     dx,al
        inc     dx
        mov     al,2
        out     dx,al
        mov     di,word ptr [bp+0ah]
        mov     si,word ptr [bp+6]
        add     si,word ptr [bp+0eh]
        mov     cx,14h
        rep     movsw
        dec     bx
        jg      transfer_line
transfer_done:
        pop     di
        pop     si
        pop     ds
        pop     es
        pop     bp
        retf
_grp_88d85593 ENDP
_CSEG_88D ENDS
        END
