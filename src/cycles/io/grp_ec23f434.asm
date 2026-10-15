_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_EC23 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_EC23
        ASSUME  DS:DGROUP
        PUBLIC  _grp_ec23f434
        EXTRN   _FN_CYCLES_CGA_06C2C:FAR
        EXTRN   _FN_CYCLES_CGA_06C78:FAR
        EXTRN   _FN_CYCLES_CGA_06B4B:FAR
        EXTRN   _FN_CYCLES_CGA_0646A:FAR
_grp_ec23f434 PROC FAR
        push    bp
        mov     bp,sp
        sub     sp,2
        mov     word ptr [bp-2],1
        push    word ptr [bp+6]
        call    FAR PTR _FN_CYCLES_CGA_06C2C
        add     sp,2
        or      dx,dx
        jne     done_ec23
        push    word ptr [bp-2]
        push    word ptr [bp+6]
        call    FAR PTR _FN_CYCLES_CGA_06C78
        add     sp,4
        or      ax,ax
        je      done_ec23
        push    ax
        push    word ptr [bp+6]
        call    FAR PTR _FN_CYCLES_CGA_06B4B
        add     sp,4
        push    word ptr [bp-2]
        push    dx
        push    ax
        push    word ptr [bp+6]
        call    FAR PTR _FN_CYCLES_CGA_0646A
        add     sp,8
done_ec23:
        mov     sp,bp
        pop     bp
        retf
_grp_ec23f434 ENDP
_CSEG_EC23 ENDS
        END
