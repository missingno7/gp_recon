_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_242C:WORD, _G_242A:WORD
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_596 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_596
        ASSUME  DS:DGROUP
        ASSUME  SS:_CSEG_596
        EXTRN   _BPDISP_23DA:WORD, _BPDISP_242C:WORD, _BPDISP_242A:WORD
        EXTRN   _BPDISP_23EE:WORD, _BPDISP_2376:WORD, _BPDISP_23C6:WORD
        EXTRN   _BPDISP_2416:WORD, _BPDISP_2402:WORD
        PUBLIC  _grp_596644d5
_grp_596644d5 PROC NEAR
        cmp     word ptr [bp+_BPDISP_23DA],0
        je      done
        cmp     word ptr [di+_G_242C],1
        jl      clear_acceleration
        cmp     word ptr [di+_G_242A],1
        jl      clear_acceleration
        mov     bx,word ptr [bp+_BPDISP_23EE]
        sub     bx,word ptr [bp+_BPDISP_2376]
        je      restore_position
        mov     ax,bx
        or      ax,ax
        jge     magnitude_ready
        neg     ax
magnitude_ready:
        cmp     ax,word ptr [bp+_BPDISP_23DA]
        jl      restore_position
        or      bx,bx
        jg      adjust_positive
        mov     ax,word ptr [bp+_BPDISP_23DA]
        sub     word ptr [bp+_BPDISP_2376],ax
        jmp     SHORT done
adjust_positive:
        mov     ax,word ptr [bp+_BPDISP_23DA]
        add     word ptr [bp+_BPDISP_2376],ax
done:
        ret
clear_acceleration:
        mov     word ptr [bp+_BPDISP_23DA],0
        cmp     word ptr [bp+_BPDISP_23C6],0
        je      done
        mov     ax,word ptr [bp+_BPDISP_2416]
        sar     ax,1
        sar     ax,1
        sar     ax,1
        sar     ax,1
        sub     word ptr [bp+_BPDISP_2416],ax
        sub     word ptr [bp+_BPDISP_2402],ax
        jge     done
        mov     word ptr [bp+_BPDISP_2402],0
        jmp     SHORT done
restore_position:
        mov     ax,word ptr [bp+_BPDISP_23EE]
        mov     word ptr [bp+_BPDISP_2376],ax
        mov     word ptr [bp+_BPDISP_23DA],0
        jmp     SHORT done
_grp_596644d5 ENDP
_CSEG_596 ENDS
        END
