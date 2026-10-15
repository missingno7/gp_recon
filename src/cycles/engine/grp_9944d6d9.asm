_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_B218:WORD, _G_B21C:WORD, _G_B224:WORD, _G_B210:WORD
        EXTRN   _G_B228:WORD, _G_B20A:WORD, _G_B214:WORD, _G_B21A:WORD
        EXTRN   _G_B22C:WORD, _G_A754:WORD, _G_A758:WORD, _G_A760:WORD
        EXTRN   _G_A764:WORD
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_994 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_994
        ASSUME  DS:DGROUP
        ASSUME  SS:_CSEG_994
        PUBLIC  _grp_9944d6d9
        EXTRN   _FN_CYCLES_CGA_04A48:NEAR
_grp_9944d6d9 PROC FAR
        push    bp
        mov     bp,sp
        sub     sp,4
        mov     ax,word ptr [_G_B218]
        mov     word ptr [bp-2],ax
        cmp     word ptr [bp+6],67h
        je      selected_key
        cmp     word ptr [bp+6],47h
        jne     not_selected
selected_key:
        mov     al,1
        jmp     SHORT set_selected
not_selected:
        sub     al,al
set_selected:
        mov     byte ptr [bp-4],al
        cmp     word ptr [_G_B21C],0
        jne     screen_ready
        mov     word ptr [_G_B224],6
screen_ready:
        cmp     byte ptr [bp-4],0
        je      args_ready
        cmp     word ptr [_G_B224],0
        jne     args_ready
        mov     word ptr [_G_B224],1
args_ready:
        push    word ptr [_G_B210]
        push    word ptr [_G_B224]
        push    word ptr [bp+6]
        push    word ptr [_G_B228]
        push    word ptr [bp-2]
        call    DWORD PTR [_G_A754]
        add     sp,0ah
        cmp     byte ptr [bp-4],0
        je      first_callback_done
        cmp     word ptr [_G_B20A],0
        jne     first_callback_done
        push    word ptr [_G_B228]
        call    DWORD PTR [_G_A758]
        add     sp,2
first_callback_done:
        cmp     word ptr [_G_B20A],0
        je      second_callback_done
        cmp     word ptr [_G_B224],0
        jne     second_callback_done
        push    word ptr [_G_B228]
        call    DWORD PTR [_G_A760]
        add     sp,2
second_callback_done:
        add     word ptr [_G_B218],8
        mov     word ptr [_G_B22C],0
        mov     ax,word ptr [_G_B214]
        or      ax,word ptr [_G_B21A]
        je      no_result
        push    word ptr [bp-2]
        call    DWORD PTR [_G_A764]
        add     sp,2
        or      ax,ax
        je      no_result
        mov     ax,1
        jmp     SHORT have_result
no_result:
        sub     ax,ax
have_result:
        push    ax
        push    cs
        call    near ptr _FN_CYCLES_CGA_04A48
        mov     sp,bp
        pop     bp
        retf
_grp_9944d6d9 ENDP
_CSEG_994 ENDS
        END
