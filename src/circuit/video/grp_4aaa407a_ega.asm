_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_TEXT
        PUBLIC _grp_4aaa407a
_G_00C4A EQU 0C4Ah
_G_00C5E EQU 0C5Eh
_G_05EBE EQU 5EBEh
_G_05EC0 EQU 5EC0h
_G_00708 EQU 0708h
_grp_4aaa407a PROC NEAR
        push    ax
        mov     ax,word ptr [di+_G_00C4A]
        sub     ax,word ptr ds:[_G_05EBE]
        mov     ah,al
        mov     al,byte ptr [di+_G_00C5E]
        sub     ax,word ptr ds:[_G_05EC0]
        shr     ax,1
        shr     ax,1
        shr     ax,1
        shr     ax,1
        shr     ax,1
        mov     bx,ax
        shl     bx,1
        shr     ax,1
        shr     ax,1
        and     ax,0feh
        add     ax,2
        jg      short low_limit_done
        mov     ax,2
low_limit_done:
        cmp     ax,50h
        jl      short high_limit_done
        mov     ax,4eh
high_limit_done:
        mov     word ptr ds:[_G_00708],ax
        add     bx,10h
        pop     ax
        ret
_grp_4aaa407a ENDP
_TEXT ENDS
        END
