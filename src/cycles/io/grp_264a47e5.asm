_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_264A SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_264A
        ASSUME  DS:DGROUP
        PUBLIC  _grp_264a47e5
        EXTRN   _G_VEC09_OFF:WORD, _G_VEC09_SEG:WORD
        EXTRN   _G_VEC16_OFF:WORD, _G_VEC16_SEG:WORD
_grp_264a47e5 PROC FAR
        in      al,21h
        mov     ah,al
        or      al,3
        out     21h,al
        xor     bx,bx
        mov     es,bx
        mov     bx,word ptr ds:[_G_VEC09_OFF]
        or      bx,bx
        je      restore_mask
        mov     word ptr es:[24h],bx
        mov     bx,word ptr ds:[_G_VEC09_SEG]
        mov     word ptr es:[26h],bx
        mov     bx,word ptr ds:[_G_VEC16_OFF]
        mov     word ptr es:[58h],bx
        mov     bx,word ptr ds:[_G_VEC16_SEG]
        mov     word ptr es:[5ah],bx
        mov     al,byte ptr es:[417h]
        and     al,0f0h
        mov     byte ptr es:[417h],al
restore_mask:
        mov     al,ah
        out     21h,al
        retf
_grp_264a47e5 ENDP
_CSEG_264A ENDS
        END
