_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_08CF6:NEAR
        EXTRN _FN_CIRCUIT_EGA_0BB7A:NEAR
        PUBLIC _grp_d4bed92b
_G_05E3E EQU 5E3Eh
_CS_G_0C7CC EQU 0C7CCh
_BP_FIELD_71E0 EQU 71E0h
_BP_FIELD_7330 EQU 7330h
_grp_d4bed92b PROC NEAR
        mov     cx,si
        sub     cx,dx
        mov     dx,word ptr [bp+_BP_FIELD_71E0]
        test    al,4
        jne     short value_ready
        mov     dx,word ptr [bp+_BP_FIELD_7330]
value_ready:
        cmp     byte ptr ds:[_G_05E3E],0
        jne     short value_shifted
        and     ax,3
        shl     ax,1
        shl     ax,1
        shl     ax,1
        shl     ax,1
        shl     ax,1
        shl     ax,1
        add     di,ax
value_shifted:
        mov     word ptr cs:[_CS_G_0C7CC],si
        push    cx
        push    dx
        push    word ptr [di+6]
        push    word ptr [di+4]
        push    cx
        push    dx
        push    word ptr [di+2]
        push    word ptr [di]
        call    _FN_CIRCUIT_EGA_08CF6
        add     sp,8
        call    _FN_CIRCUIT_EGA_0BB7A
        add     sp,8
        ret
_grp_d4bed92b ENDP
_TEXT ENDS
        END
