_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_OUTPUT_BUFFER:WORD, _G_OUTPUT_ERROR_COUNT:WORD
        EXTRN   _G_OUTPUT_BYTES_TOTAL:WORD, _G_OUTPUT_BYTE:BYTE
_DATA ENDS
DGROUP GROUP _DATA
        EXTRN   _GRP_63468620:FAR
_CSEG_D77 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_D77
        ASSUME  DS:DGROUP
        PUBLIC  _grp_d774e047
_grp_d774e047 PROC FAR
        push    bp
        mov     bp,sp
        sub     sp,2
        push    di
        push    si
        cmp     word ptr [_G_OUTPUT_ERROR_COUNT],0
        jne     output_done
        mov     si,word ptr [bp+6]
        or      si,si
        jle     output_done
        jmp     SHORT output_test
ensure_capacity:
        push    word ptr [_G_OUTPUT_BUFFER]
        push    word ptr [_G_OUTPUT_BYTE]
        call    FAR PTR _GRP_63468620
        add     sp,4
output_check:
        inc     ax
        jne     output_test
        inc     word ptr [_G_OUTPUT_ERROR_COUNT]
output_test:
        mov     ax,si
        dec     si
        or      ax,ax
        jle     output_counted
        mov     bx,word ptr [_G_OUTPUT_BUFFER]
        dec     word ptr [bx+2]
        js      ensure_capacity
        mov     al,byte ptr [_G_OUTPUT_BYTE]
        mov     di,word ptr [bx]
        inc     word ptr [bx]
        mov     byte ptr [di],al
        sub     ah,ah
        jmp     SHORT output_check
output_counted:
        cmp     word ptr [_G_OUTPUT_ERROR_COUNT],0
        jne     output_done
        mov     ax,word ptr [bp+6]
        add     word ptr [_G_OUTPUT_BYTES_TOTAL],ax
output_done:
        pop     si
        pop     di
        mov     sp,bp
        pop     bp
        retf
_grp_d774e047 ENDP
_CSEG_D77 ENDS
        END
