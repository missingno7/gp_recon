_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_95B7:BYTE, _G_959A:BYTE, _G_95C5:BYTE, _G_95C6:BYTE
        EXTRN   _G_95C7:BYTE, _G_95CB:BYTE, _G_95CF:BYTE, _G_95CE:BYTE
        EXTRN   _G_95CD:BYTE, _G_95C9:BYTE
_DATA ENDS
DGROUP GROUP _DATA
        EXTRN   _FN_CYCLES_CGA_0600E:FAR
_CSEG_3E7 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_3E7
        ASSUME  DS:DGROUP
        PUBLIC  _grp_3e7bebe2
_grp_3e7bebe2 PROC FAR
        xor     ax,ax
        cmp     byte ptr [_G_95B7],0
        je      flag_20
        or      al,10h
flag_20:
        cmp     byte ptr [_G_959A],0
        je      flag_09
        or      al,20h
flag_09:
        cmp     byte ptr [_G_95C5],0
        je      flag_01
        or      al,9
flag_01:
        cmp     byte ptr [_G_95C6],0
        je      flag_05
        or      al,1
flag_05:
        cmp     byte ptr [_G_95C7],0
        je      flag_04
        or      al,5
flag_04:
        cmp     byte ptr [_G_95CB],0
        je      flag_06
        or      al,4
flag_06:
        cmp     byte ptr [_G_95CF],0
        je      flag_02
        or      al,6
flag_02:
        cmp     byte ptr [_G_95CE],0
        je      flag_0a
        or      al,2
flag_0a:
        cmp     byte ptr [_G_95CD],0
        je      flag_08
        or      al,0ah
flag_08:
        cmp     byte ptr [_G_95C9],0
        je      finish_flags
        or      al,8
finish_flags:
        or      ax,ax
        jne     return_flags
        call    FAR PTR _FN_CYCLES_CGA_0600E
return_flags:
        retf
_grp_3e7bebe2 ENDP
_CSEG_3E7 ENDS
        END
