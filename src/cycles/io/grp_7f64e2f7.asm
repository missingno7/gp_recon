_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_7F64 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_7F64
        ASSUME  DS:DGROUP
        PUBLIC  _grp_7f64e2f7
        EXTRN   _G_A2F0:WORD, _G_A2EE:WORD
        EXTRN   _G_BLOCK_NOT_FOUND:BYTE
        EXTRN   _FN_CYCLES_CGA_0559E:FAR
_grp_7f64e2f7 PROC FAR
        push    bp
        mov     bp,sp
        push    si
        push    di
        mov     ax,word ptr [bp+8]
        mov     si,word ptr ds:[_G_A2F0]
find_score:
        cmp     si,word ptr ds:[_G_A2EE]
        je      missing_score
        cmp     ax,word ptr [si+0eh]
        je      clear_score
        sub     si,12h
        jmp     find_score
missing_score:
        push    word ptr [bp+8]
        mov     ax,OFFSET DGROUP:_G_BLOCK_NOT_FOUND
        push    ax
        call    FAR PTR _FN_CYCLES_CGA_0559E
clear_score:
        mov     word ptr [si+10h],0
        cmp     si,word ptr ds:[_G_A2F0]
        jne     done_score
rewind_head:
        sub     si,12h
        cmp     word ptr [si+10h],0
        je      rewind_head
        mov     word ptr ds:[_G_A2F0],si
done_score:
        pop     di
        pop     si
        pop     bp
        retf
_grp_7f64e2f7 ENDP
_CSEG_7F64 ENDS
        END
