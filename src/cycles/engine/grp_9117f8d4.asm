_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
        EXTRN   _FN_CYCLES_CGA_07631:FAR, _GRP_4896BB94:FAR
_CSEG_911 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_911
        ASSUME  DS:DGROUP
        PUBLIC  _grp_9117f8d4
_grp_9117f8d4 PROC FAR
        push    bp
        mov     bp,sp
        sub     sp,4
        call    FAR PTR _FN_CYCLES_CGA_07631
        mov     word ptr [bp-2],ax
        mov     word ptr [bp-4],0
        jmp     SHORT poll_call
        nop
poll_test:
        cmp     word ptr [bp-4],2ee0h
        jge     poll_done
        inc     word ptr [bp-4]
poll_call:
        call    FAR PTR _FN_CYCLES_CGA_07631
        cmp     ax,word ptr [bp-2]
        je      poll_test
poll_done:
        cmp     word ptr [bp-4],400h
        jne     first_wait_check
        mov     bx,46ch
        mov     al,byte ptr [bx]
        cbw
        mov     word ptr [bp-4],ax
        jmp     SHORT first_wait_check
delay_call:
        mov     ax,64h
        push    ax
        call    FAR PTR _GRP_4896BB94
        add     sp,2
first_wait_check:
        mov     ax,word ptr [bp-4]
        dec     word ptr [bp-4]
        or      ax,ax
        jne     delay_call
        mov     byte ptr [bp-3],0
        jmp     SHORT second_wait_check
second_delay_call:
        mov     ax,64h
        push    ax
        call    FAR PTR _GRP_4896BB94
        add     sp,2
second_wait_check:
        mov     ax,word ptr [bp-4]
        dec     word ptr [bp-4]
        or      ax,ax
        jne     second_delay_call
        mov     sp,bp
        pop     bp
        retf
_grp_9117f8d4 ENDP
_CSEG_911 ENDS
        END
