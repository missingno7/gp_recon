; Cycles video control leaf. The C source boundary is not established;
; the maintained candidate uses explicit 8086 instructions for port I/O.
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_TEXT
        PUBLIC  _grp_4d5be4d1
_grp_4d5be4d1 PROC FAR
        push    bp
        mov     bp,sp
        mov     dx,03d8h
        mov     ax,7
        cmp     word ptr [bp+6],0
        je      short set_mode
        mov     ax,0eh
set_mode:
        out     dx,al
        pop     bp
        retf
_grp_4d5be4d1 ENDP
_TEXT ENDS
        END
