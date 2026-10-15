_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_OLD_VEC08_OFFSET:WORD, _G_OLD_VEC08_SEGMENT:WORD
        EXTRN   _G_OLD_VEC16_OFFSET:WORD, _G_OLD_VEC16_SEGMENT:WORD
        EXTRN   _G_VECTOR_STATE_BUFFER:BYTE
_DATA ENDS
DGROUP GROUP _DATA
        EXTRN   _K_VEC08_HANDLER_OFFSET:ABS, _K_VEC16_HANDLER_OFFSET:ABS
_CSEG_97E SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_97E
        ASSUME  DS:DGROUP
        PUBLIC  _grp_97e16ccf
_grp_97e16ccf PROC FAR
        push    di
        in      al,21h
        mov     ah,al
        or      al,3
        out     21h,al
        xor     bx,bx
        mov     es,bx
        mov     bx,word ptr es:[24h]
        cmp     bx,_K_VEC08_HANDLER_OFFSET
        je      vectors_done
        mov     word ptr [_G_OLD_VEC08_OFFSET],bx
        mov     bx,word ptr es:[26h]
        mov     word ptr [_G_OLD_VEC08_SEGMENT],bx
        mov     word ptr es:[24h],_K_VEC08_HANDLER_OFFSET
        mov     word ptr es:[26h],cs
        mov     bx,word ptr es:[58h]
        mov     word ptr [_G_OLD_VEC16_OFFSET],bx
        mov     bx,word ptr es:[5ah]
        mov     word ptr [_G_OLD_VEC16_SEGMENT],bx
        mov     word ptr es:[58h],_K_VEC16_HANDLER_OFFSET
        mov     word ptr es:[5ah],cs
vectors_done:
        mov     al,ah
        out     21h,al
        mov     ax,ds
        mov     es,ax
        mov     di,OFFSET DGROUP:_G_VECTOR_STATE_BUFFER
        mov     cx,5ah
        xor     ax,ax
        cld
        rep     stosb
        pop     di
        retf
_grp_97e16ccf ENDP
_CSEG_97E ENDS
        END
