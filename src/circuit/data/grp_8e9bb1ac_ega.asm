_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_TEXT
        PUBLIC _grp_8e9bb1ac
_G_00BFA EQU 0BFAh
_G_00C0E EQU 0C0Eh
_G_00C4A EQU 0C4Ah
_G_00C5E EQU 0C5Eh
_G_00C72 EQU 0C72h
_G_00C86 EQU 0C86h
_G_00C9A EQU 0C9Ah
_G_00CAE EQU 0CAEh
_G_05EBA EQU 5EBAh
_G_05EBC EQU 5EBCh
_G_05EFC EQU 5EFCh
_G_05EBE EQU 5EBEh
_G_05EC0 EQU 5EC0h
_G_05EFA EQU 5EFAh
_grp_8e9bb1ac PROC NEAR
        push    di
        push    si
        push    ds
        pop     es
        cld
        mov     cx,0ah
        mov     di,_G_00BFA
        mov     si,_G_00C72
        rep     movsw
        mov     cx,0ah
        mov     di,_G_00C0E
        mov     si,_G_00C86
        rep     movsw
        mov     cx,0ah
        mov     di,_G_00C4A
        mov     si,_G_00C9A
        rep     movsw
        mov     cx,0ah
        mov     di,_G_00C5E
        mov     si,_G_00CAE
        rep     movsw
        mov     ax,word ptr ds:[_G_05EBA]
        mov     word ptr ds:[_G_05EBE],ax
        mov     ax,word ptr ds:[_G_05EBC]
        mov     word ptr ds:[_G_05EC0],ax
        mov     ax,word ptr ds:[_G_05EFC]
        mov     word ptr ds:[_G_05EFA],ax
        pop     si
        pop     di
        ret
_grp_8e9bb1ac ENDP
_TEXT ENDS
        END
