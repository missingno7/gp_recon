_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
        EXTRN   _GRP_181F4D04:FAR
        EXTRN   _FN_CYCLES_CGA_0559E:FAR, _FN_CYCLES_CGA_059E2:FAR
        EXTRN   _FN_CYCLES_CGA_05ADA:FAR, _FN_CYCLES_CGA_10076:FAR
        EXTRN   _K_PARAM_OFFSET:ABS
_CSEG_E71 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_E71
        ASSUME  DS:DGROUP
        PUBLIC  _grp_e71337bb
_grp_e71337bb PROC FAR
        push    bp
        mov     bp,sp
        sub     sp,2
        push    word ptr [bp+6]
        call    FAR PTR _GRP_181F4D04
        add     sp,2
        mov     word ptr [bp-2],ax
        or      ax,ax
        je      status_zero
        cmp     ax,2
        jne     check_one
        mov     ax,0ceh
        jmp     SHORT call_resource
check_one:
        cmp     word ptr [bp-2],1
        jne     check_three
        mov     ax,0d9h
        jmp     SHORT call_resource
        nop
check_three:
        cmp     word ptr [bp-2],3
        jne     use_default
        mov     ax,0eah
        jmp     SHORT call_resource
        nop
use_default:
        mov     ax,102h
call_resource:
        push    ax
        call    FAR PTR _FN_CYCLES_CGA_0559E
        add     sp,2
status_zero:
        call    FAR PTR _FN_CYCLES_CGA_059E2
        mov     ax,_K_PARAM_OFFSET
        mov     dx,SEG _FN_CYCLES_CGA_10076
        push    dx
        push    ax
        call    FAR PTR _FN_CYCLES_CGA_05ADA
        add     sp,4
        call    FAR PTR _FN_CYCLES_CGA_10076
        sub     ax,ax
        mov     sp,bp
        pop     bp
        retf
_grp_e71337bb ENDP
_CSEG_E71 ENDS
        END
