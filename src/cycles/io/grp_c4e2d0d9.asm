_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_C4 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_C4
        ASSUME  DS:DGROUP
        PUBLIC  _grp_c4e2d0d9
        EXTRN   _G_A2F0:WORD
        EXTRN   _G_A2EE:WORD
        EXTRN   _G_BLOCK_NOT_FOUND:BYTE
        EXTRN   _FN_CYCLES_CGA_0559E:FAR
_grp_c4e2d0d9 PROC FAR
        push    bp
        mov     bp,sp
        push    si
        mov     ax,word ptr [bp+8]
        mov     si,word ptr ds:[_G_A2F0]
find_slot:
        cmp     si,word ptr ds:[_G_A2EE]
        je      missing_slot
        cmp     ax,word ptr [si+0eh]
        je      update_slot
        sub     si,12h
        jmp     find_slot
missing_slot:
        push    word ptr [bp+8]
        mov     ax,OFFSET DGROUP:_G_BLOCK_NOT_FOUND
        push    ax
        call    FAR PTR _FN_CYCLES_CGA_0559E
update_slot:
        mov     ax,word ptr [bp+0ah]
        cmp     ax,word ptr [si+0ch]
        ja      keep_slot
        mov     word ptr [si+0ch],ax
keep_slot:
        pop     si
        pop     bp
        retf
_grp_c4e2d0d9 ENDP
_CSEG_C4 ENDS
        END
