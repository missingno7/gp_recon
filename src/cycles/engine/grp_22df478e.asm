_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_A606:WORD, _G_A610:WORD, _G_A618:WORD
        EXTRN   _G_A608:WORD, _G_A6A8:WORD
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_22D SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_22D
        ASSUME  DS:DGROUP
        PUBLIC  _grp_22df478e
        EXTRN   _K_B58C:ABS, _K_CD32:ABS
_grp_22df478e PROC FAR
        push    bp
        mov     bp,sp
        sub     sp,4
        push    si
        mov     si,word ptr [bp+6]
        inc     word ptr [_G_A606]
        cmp     si,OFFSET DGROUP:_G_A610
        jne     check_second
        mov     word ptr [bp-2],_K_B58C
        jmp     SHORT table_test
        nop
check_second:
        cmp     si,OFFSET DGROUP:_G_A618
        jne     return_zero
        mov     word ptr [bp-2],_K_CD32
table_test:
        test    byte ptr [si+6],0ch
        jne     return_zero
        mov     bx,si
        sub     bx,OFFSET DGROUP:_G_A608
        mov     cl,3
        sar     bx,cl
        mov     ax,bx
        shl     bx,1
        add     bx,ax
        shl     bx,1
        test    byte ptr [bx+OFFSET DGROUP:_G_A6A8],1
        je      slot_setup
return_zero:
        sub     ax,ax
        jmp     SHORT finish
slot_setup:
        mov     ax,si
        sub     ax,OFFSET DGROUP:_G_A608
        mov     cl,3
        sar     ax,cl
        mov     cx,ax
        shl     ax,1
        add     ax,cx
        shl     ax,1
        add     ax,OFFSET DGROUP:_G_A6A8
        mov     word ptr [bp-4],ax
        mov     ax,word ptr [bp-2]
        mov     word ptr [si+4],ax
        mov     word ptr [si],ax
        mov     bx,word ptr [bp-4]
        mov     ax,200h
        mov     word ptr [bx+2],ax
        mov     word ptr [si+2],ax
        mov     byte ptr [bx],1
        or      byte ptr [si+6],2
        mov     ax,1
finish:
        pop     si
        mov     sp,bp
        pop     bp
        retf
_grp_22df478e ENDP
_CSEG_22D ENDS
        END
