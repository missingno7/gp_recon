        EXTRN   _FN_CYCLES_CGA_0559E:FAR
_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_97FA:WORD
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_7A6 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_7A6
        ASSUME  DS:DGROUP
        ASSUME  SS:_CSEG_7A6
        PUBLIC  _grp_7a614cef
_grp_7a614cef PROC FAR
        push    bp
        mov     bp,sp
        push    ds
        push    si
        push    di
        mov     dx,1
        cld
        mov     ds,word ptr [bp+8]
        mov     si,word ptr [bp+6]
        mov     ax,DGROUP
        mov     es,ax
        mov     di,word ptr [bp+0ah]
        mov     cx,4
        mov     bx,0
check_slot:
        cmp     byte ptr es:[bx+di],0
        je      fill_slot
        inc     bx
        loop    check_slot
calculate:
        mov     ax,word ptr [si+4]
        add     si,6
        mov     bx,si
search_slot:
        mov     si,bx
        mov     di,word ptr [bp+0ah]
        mov     cx,4
compare_chars:
        cmpsb
        jne     mismatch
        loop    compare_chars
        jmp     SHORT found_match
        nop
mismatch:
        cmp     byte ptr [si-1],0
        jne     next_slot
        cmp     byte ptr es:[di-1],20h
        je      found_match
next_slot:
        add     bx,4
        dec     ax
        jge     search_slot
        or      dx,dx
        je      return_zero
        mov     ax,DGROUP
        mov     ds,ax
        push    word ptr [bp+0ah]
        mov     ax,OFFSET DGROUP:_G_97FA
        push    ax
        call    FAR PTR _FN_CYCLES_CGA_0559E
        int     20h
return_zero:
        xor     ax,ax
        jmp     SHORT cleanup
        nop
fill_slot:
        mov     byte ptr es:[bx+di],20h
        inc     bx
        loop    fill_slot
        jmp     SHORT calculate
found_match:
        mov     si,word ptr [bp+6]
        mov     ax,word ptr [si+4]
        shl     ax,1
        shl     ax,1
        add     bx,ax
        shl     ax,1
        add     ax,6
        mov     cx,ds
        xor     dx,dx
        shl     cx,1
        rcl     dx,1
        shl     cx,1
        rcl     dx,1
        shl     cx,1
        rcl     dx,1
        shl     cx,1
        rcl     dx,1
        add     ax,cx
        adc     dx,0
        add     ax,word ptr [bx]
        adc     dx,word ptr [bx+2]
        mov     bx,ax
        and     bx,0fh
        shr     dx,1
        rcr     ax,1
        shr     dx,1
        rcr     ax,1
        shr     dx,1
        rcr     ax,1
        shr     dx,1
        rcr     ax,1
        mov     dx,ax
        mov     ax,bx
cleanup:
        pop     di
        pop     si
        pop     ds
        pop     bp
        retf
_grp_7a614cef ENDP
_CSEG_7A6 ENDS
        END
