.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
PUBLIC _grp_fe15c5cd
_grp_fe15c5cd PROC NEAR
        push    bp
        mov     bp,sp
        push    di
        mov     ax,0A000h
        mov     es,ax
        mov     dx,03CEh
        mov     al,5
        out     dx,al
        inc     dx
        mov     al,2
        out     dx,al
        mov     dx,03C4h
        mov     al,2
        out     dx,al
        inc     dx
        mov     al,0Fh
        out     dx,al
        mov     ax,word ptr [bp+4]
        xor     di,di
        mov     cx,1F40h
        rep     stosb
        mov     dx,03CEh
        mov     al,5
        out     dx,al
        inc     dx
        mov     al,0
        out     dx,al
        pop     di
        pop     bp
        ret
_grp_fe15c5cd ENDP
_TEXT ENDS
END
