.8086
RASTER_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:RASTER_TEXT
        EXTRN   _g_07c4:BYTE, _g_07da:BYTE
        PUBLIC  _grp_4f856910
_grp_4f856910 PROC NEAR
        push    bp
        push    si
        xor     ch,ch
        mov     dh,ch
        stosw
        dec     cx
        sub     bx,ax
        je      line_equal
        jle     line_negative
        mov     byte ptr cs:[_g_07c4],40h
        mov     byte ptr cs:[_g_07da],40h
        jmp     short line_loop_test
line_negative:
        neg     bx
        mov     byte ptr cs:[_g_07c4],48h
        mov     byte ptr cs:[_g_07da],48h
line_loop_test:
        cmp     bx,dx
        jbe     line_y_major
        mov     bp,bx
        xor     si,si
line_x_major:
        add     si,dx
        inc     ax
        cmp     si,bx
        jl      line_x_major
        sub     si,bp
        stosw
        loop    line_x_major
        jmp     short line_done
line_y_major:
        mov     bp,dx
        xor     si,si
line_y_loop:
        add     si,bx
        cmp     si,dx
        jl      line_y_step
        inc     ax
        sub     si,bp
line_y_step:
        stosw
        loop    line_y_loop
        jmp     short line_done
line_equal:
        stosw
        loop    line_equal
line_done:
        pop     si
        pop     bp
        ret
_grp_4f856910 ENDP
RASTER_TEXT ENDS
        END

