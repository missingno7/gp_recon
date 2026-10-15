        EXTRN   _GRP_9A209221:FAR, _FN_CYCLES_CGA_04004:FAR
        EXTRN   _FN_CYCLES_CGA_03200:FAR, _GRP_74F8A274:FAR
        EXTRN   _GRP_CDDC44DB:FAR, _GRP_7674C7C4:FAR
        EXTRN   _FN_CYCLES_CGA_03B82:FAR
_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_A608:WORD, _G_A6AC:WORD
        EXTRN   _G_A5E2:WORD, _G_A5E4:WORD
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_2E8 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_2E8
        ASSUME  DS:DGROUP
        ASSUME  SS:_CSEG_2E8
        PUBLIC  _grp_2e800973
_grp_2e800973 PROC FAR
        push    bp
        mov     bp,sp
        sub     sp,10h
        push    di
        push    si
        mov     si,word ptr [bp+6]
        mov     di,0ffffh
        test    byte ptr [si+6],83h
        jne     flags_valid
        jmp     near ptr finish
flags_valid:
        test    byte ptr [si+6],40h
        je      open_entry
        jmp     near ptr finish
open_entry:
        push    si
        call    FAR PTR _GRP_9A209221
        add     sp,2
        mov     di,ax
        mov     bx,si
        sub     bx,OFFSET DGROUP:_G_A608
        mov     cl,3
        sar     bx,cl
        mov     ax,bx
        shl     bx,1
        add     bx,ax
        shl     bx,1
        mov     ax,word ptr [bx+OFFSET DGROUP:_G_A6AC]
        mov     word ptr [bp-4],ax
        push    si
        call    FAR PTR _FN_CYCLES_CGA_04004
        add     sp,2
        mov     al,byte ptr [si+7]
        cbw
        push    ax
        call    FAR PTR _FN_CYCLES_CGA_03200
        add     sp,2
        or      ax,ax
        jl      return_error
        cmp     word ptr [bp-4],0
        je      finish
        mov     ax,OFFSET DGROUP:_G_A5E2
        push    ax
        lea     ax,[bp-0eh]
        push    ax
        call    FAR PTR _GRP_74F8A274
        add     sp,4
        lea     ax,[bp-0ch]
        mov     word ptr [bp-2],ax
        mov     bx,ax
        cmp     byte ptr [bx-2],5ch
        je      path_ready
        mov     ax,OFFSET DGROUP:_G_A5E4
        push    ax
        lea     ax,[bp-0eh]
        push    ax
        call    FAR PTR _GRP_CDDC44DB
        add     sp,4
        jmp     SHORT path_terminate
path_ready:
        dec     word ptr [bp-2]
path_terminate:
        mov     ax,0ah
        push    ax
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        call    FAR PTR _GRP_7674C7C4
        add     sp,6
        lea     ax,[bp-0eh]
        push    ax
        call    FAR PTR _FN_CYCLES_CGA_03B82
        add     sp,2
        or      ax,ax
        je      finish
return_error:
        mov     di,0ffffh
finish:
        mov     byte ptr [si+6],0
        mov     ax,di
        pop     si
        pop     di
        mov     sp,bp
        pop     bp
        retf
_grp_2e800973 ENDP
_CSEG_2E8 ENDS
        END
