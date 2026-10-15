_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_094D0:NEAR
        PUBLIC _grp_7e46e62b
_G_007CA EQU 07CAh
_G_007CC EQU 07CCh
_G_007CE EQU 07CEh
_G_007D0 EQU 07D0h
_grp_7e46e62b PROC NEAR
        push    bp
        push    si
        shr     ax,1
        mov     word ptr ds:[_G_007D0],ax
        mov     si,word ptr ds:[_G_007CE]
        mov     al,ah
        shr     al,1
        xor     ah,ah
        mov     di,ax
        add     di,word ptr ds:[_G_007CA]
        mov     bp,word ptr ds:[_G_007CC]
point_loop:
        lodsw
        or      ax,ax
        jl      short done
        mov     cx,0
        push    cx
        mov     bx,word ptr ds:[_G_007D0]
        mul     bx
        mov     cx,dx
        add     cx,di
        lodsw
        mul     bx
        add     dx,bp
        push    dx
        push    cx
        lodsw
        mul     bx
        mov     cx,dx
        add     cx,di
        lodsw
        mul     bx
        add     dx,bp
        push    dx
        push    cx
        call    _FN_CIRCUIT_EGA_094D0
        add     sp,0ah
        jmp     short point_loop
done:
        pop     si
        pop     bp
        ret
_grp_7e46e62b ENDP
_TEXT ENDS
        END
