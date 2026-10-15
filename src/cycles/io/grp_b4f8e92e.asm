_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_TEXT
        ASSUME  DS:DGROUP
        PUBLIC  _grp_b4f8e92e
        EXTRN   _G_DST0:BYTE, _G_SRC0:BYTE
        EXTRN   _G_DST1:BYTE, _G_SRC1:BYTE
        EXTRN   _G_DST2:BYTE, _G_SRC2:BYTE
        EXTRN   _G_OLD0:WORD, _G_NEW0:WORD
        EXTRN   _G_OLD1:WORD, _G_NEW1:WORD
        EXTRN   _G_PAIR0:WORD, _G_PAIR1:WORD
_grp_b4f8e92e PROC NEAR
        push    di
        push    si
        push    ds
        pop     es
        cld
        mov     cx,10
        mov     di,OFFSET DGROUP:_G_DST0
        mov     si,OFFSET DGROUP:_G_SRC0
        rep     movsw
        mov     cx,10
        mov     di,OFFSET DGROUP:_G_DST1
        mov     si,OFFSET DGROUP:_G_SRC1
        rep     movsw
        mov     cx,10
        mov     di,OFFSET DGROUP:_G_DST2
        mov     si,OFFSET DGROUP:_G_SRC2
        rep     movsw
        mov     ax,word ptr ds:[_G_OLD0]
        mov     word ptr ds:[_G_NEW0],ax
        mov     ax,word ptr ds:[_G_OLD1]
        mov     word ptr ds:[_G_NEW1],ax
        mov     ax,word ptr ds:[_G_PAIR0]
        mov     word ptr ds:[_G_PAIR1],ax
        pop     si
        pop     di
        ret
_grp_b4f8e92e ENDP
_TEXT ENDS
        END
