_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_OUTPUT_BUFFER:WORD, _G_OUTPUT_ERROR_COUNT:WORD
        EXTRN   _G_OUTPUT_BYTES_TOTAL:WORD
_DATA ENDS
DGROUP GROUP _DATA
        EXTRN   _GRP_63468620:FAR
_CSEG_925 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_925
        ASSUME  DS:DGROUP
        PUBLIC  _grp_925f0b41
_grp_925f0b41 PROC FAR
        push    bp
        mov     bp,sp
        sub     sp,2
        push    di
        push    si
        mov     si,word ptr [bp+0ah]
        cmp     word ptr [_G_OUTPUT_ERROR_COUNT],0
        jne     write_done
        jmp     SHORT write_test
ensure_capacity:
        push    word ptr [_G_OUTPUT_BUFFER]
        les     bx,dword ptr [bp+6]
        mov     al,byte ptr es:[bx]
        cbw
        push    ax
        call    FAR PTR _GRP_63468620
        add     sp,4
result_check:
        inc     ax
        jne     advance_source
        inc     word ptr [_G_OUTPUT_ERROR_COUNT]
advance_source:
        inc     word ptr [bp+6]
write_test:
        mov     ax,si
        dec     si
        or      ax,ax
        je      count_complete
        mov     bx,word ptr [_G_OUTPUT_BUFFER]
        dec     word ptr [bx+2]
        js      ensure_capacity
        les     bx,dword ptr [bp+6]
        mov     al,byte ptr es:[bx]
        mov     bx,word ptr [_G_OUTPUT_BUFFER]
        mov     di,word ptr [bx]
        inc     word ptr [bx]
        mov     byte ptr [di],al
        sub     ah,ah
        jmp     result_check
count_complete:
        cmp     word ptr [_G_OUTPUT_ERROR_COUNT],0
        jne     write_done
        mov     ax,word ptr [bp+0ah]
        add     word ptr [_G_OUTPUT_BYTES_TOTAL],ax
write_done:
        pop     si
        pop     di
        mov     sp,bp
        pop     bp
        retf
_grp_925f0b41 ENDP
_CSEG_925 ENDS
        END
