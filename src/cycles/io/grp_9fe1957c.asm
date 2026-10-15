_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_TEXT
        ASSUME  DS:DGROUP
        ASSUME  SS:DGROUP
        PUBLIC  _grp_9fe1957c
        EXTRN   _G_TABLE:BYTE
        EXTRN   _G_ACTIVE:WORD
        EXTRN   _G_LIMIT:WORD
        EXTRN   _G_BPREAD:WORD
        EXTRN   _G_BPOUT:WORD
_grp_9fe1957c PROC NEAR
        push    es
        push    di
        push    ds
        pop     es
        mov     cx,72h
        mov     di,OFFSET DGROUP:_G_TABLE
        xor     ax,ax
        rep     stosw
        cmp     word ptr ds:[_G_ACTIVE],0
        je      cleanup_table
        mov     cx,9
        mov     bp,2
clear_related:
        mov     ax,word ptr ds:[_G_LIMIT]
        sub     ax,26h
        mov     bx,word ptr ss:[bp+OFFSET DGROUP:_G_BPREAD]
        sub     ax,bx
        jle     function_end
        mov     word ptr ss:[bp+OFFSET DGROUP:_G_BPOUT],0
        inc     bp
        inc     bp
        loop    clear_related
cleanup_table:
        pop     di
        pop     es
        ret
function_end:
_grp_9fe1957c ENDP
_TEXT ENDS
        END
