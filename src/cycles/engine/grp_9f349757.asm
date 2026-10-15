_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_45AE:WORD, _G_CGA_45A6:WORD, _G_459A:WORD, _G_459E:WORD
        EXTRN   _G_45B2:WORD, _G_24A4:WORD, _G_24B8:WORD, _G_4BB4:WORD
        EXTRN   _G_238A:WORD, _G_2376:WORD, _G_248E:WORD
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_9F3 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_9F3
        ASSUME  DS:DGROUP
        ASSUME  SS:_CSEG_9F3
        PUBLIC  _grp_9f349757
        EXTRN   _FN_CYCLES_CGA_0251A:NEAR
        EXTRN   _BPDISP_238A:WORD, _BPDISP_243E:WORD, _BPDISP_2452:WORD
        EXTRN   _BPDISP_2376:WORD, _BPDISP_2362:WORD, _BPDISP_2402:WORD
        EXTRN   _BPDISP_2416:WORD, _BPDISP_23DA:WORD, _BPDISP_23EE:WORD
        EXTRN   _BPDISP_2490:WORD, _BPDISP_2326:WORD, _BPDISP_23C6:WORD, _BPDISP_23B2:WORD
_grp_9f349757 PROC NEAR
        push    di
        push    bp
        mov     cx,0ah
        mov     di,0
        mov     bp,word ptr [di+OFFSET DGROUP:_G_4BB4]
        shl     bp,1
        mov     ax,64h
        cmp     word ptr [_G_45AE],0
        je      duration_ready
        mov     ax,word ptr [_G_CGA_45A6]
        add     ax,1ch
duration_ready:
        mov     bx,0
init_body:
        sub     ax,word ptr [di+OFFSET DGROUP:_G_24A4]
        mov     dx,word ptr [di+OFFSET DGROUP:_G_24B8]
        mov     word ptr [bp+_BPDISP_238A],ax
        mov     word ptr [bp+_BPDISP_243E],ax
        mov     word ptr [bp+_BPDISP_2452],bp
        mov     word ptr [bp+_BPDISP_2376],dx
        mov     word ptr [bp+_BPDISP_2362],0
        mov     word ptr [bp+_BPDISP_2402],bx
        mov     word ptr [bp+_BPDISP_2416],bx
        mov     word ptr [bp+_BPDISP_23DA],0
        mov     word ptr [bp+_BPDISP_23EE],dx
        mov     word ptr [bp+_BPDISP_2490],0
        mov     word ptr [bp+_BPDISP_2326],0
        mov     word ptr [bp+_BPDISP_23C6],0
        mov     word ptr [bp+_BPDISP_23B2],0
        inc     di
        inc     di
        mov     bp,word ptr [di+OFFSET DGROUP:_G_4BB4]
        shl     bp,1
        loop    init_body
        cmp     word ptr [_G_45AE],0
        jne     update_from_state
        mov     ax,word ptr [_G_CGA_45A6]
        add     ax,1ch
        mov     word ptr [_G_459A],ax
        jmp     SHORT finish_setup
update_from_state:
        mov     ax,word ptr [_G_238A]
        add     ax,1
        mov     word ptr [_G_459A],ax
        mov     word ptr [_G_238A],ax
        mov     word ptr [_G_459E],ax
        mov     ax,word ptr [_G_2376]
        mov     word ptr [_G_45B2],ax
finish_setup:
        mov     word ptr [_G_248E],0ffffh
        call    NEAR PTR _FN_CYCLES_CGA_0251A
        pop     bp
        pop     di
        ret
_grp_9f349757 ENDP
_CSEG_9F3 ENDS
        END
