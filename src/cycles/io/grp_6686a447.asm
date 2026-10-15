_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_668 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_668
        ASSUME  DS:DGROUP
        PUBLIC  _grp_6686a447
        EXTRN   _G_91D2:WORD, _G_91D4:WORD, _G_919A:WORD, _G_919C:WORD
        EXTRN   _K_VECTOR_OFFSET:ABS
_grp_6686a447 PROC FAR
        cli
        mov     word ptr ds:[_G_91D2],0
        mov     word ptr ds:[_G_91D4],0
        sti
        in      al,61h
        and     al,0fch
        out     61h,al
        mov     al,0b6h
        out     43h,al
        in      al,21h
        or      al,3
        out     21h,al
        xor     ax,ax
        mov     es,ax
        cli
        mov     ax,word ptr es:[20h]
        cmp     ax,_K_VECTOR_OFFSET
        je      old_offset_done
        mov     word ptr ds:[_G_919A],ax
old_offset_done:
        mov     ax,word ptr es:[22h]
        mov     bx,cs
        cmp     ax,bx
        je      old_segment_done
        mov     word ptr ds:[_G_919C],ax
        mov     word ptr es:[20h],_K_VECTOR_OFFSET
        mov     word ptr es:[22h],cs
old_segment_done:
        in      al,21h
        and     al,0fch
        out     21h,al
        sti
        mov     al,dl
        out     40h,al
        mov     al,dh
        out     40h,al
        pop     bp
        retf
_grp_6686a447 ENDP
_CSEG_668 ENDS
        END
