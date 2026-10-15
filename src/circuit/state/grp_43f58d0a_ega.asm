_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_05A15:NEAR
        PUBLIC _grp_43f58d0a
_G_05EFA EQU 5EFAh
_G_05EFC EQU 5EFCh
_G_05F04 EQU 5F04h
_G_09BBC EQU 9BBCh
_G_05F06 EQU 5F06h
_G_05EF2 EQU 5EF2h
_G_05EEE EQU 5EEEh
_G_05FD4 EQU 5FD4h
_G_09CF6 EQU 9CF6h
_G_05FE0 EQU 5FE0h
_G_05FDA EQU 5FDAh
_G_05FD6 EQU 5FD6h
_G_05A7A EQU 5A7Ah
_G_080F4 EQU 80F4h
_G_080F8 EQU 80F8h
_G_080F6 EQU 80F6h
_G_0006C EQU 006Ch
_G_05F3B EQU 5F3Bh
_G_05724 EQU 5724h
_G_05EDE EQU 5EDEh
_G_057AA EQU 57AAh
_G_05F40 EQU 5F40h
_G_057AC EQU 57ACh
_G_05F42 EQU 5F42h
_G_057A6 EQU 57A6h
_G_057A8 EQU 57A8h
_G_05F44 EQU 5F44h
_G_05F46 EQU 5F46h
_G_05EE6 EQU 5EE6h
_G_05EEA EQU 5EEAh
_G_05EE8 EQU 5EE8h
_grp_43f58d0a PROC NEAR
        mov word ptr ds:[_G_05EFA],64h
        mov word ptr ds:[_G_05EFC],64h
        mov word ptr ds:[_G_05F04],64h
        mov word ptr ds:[_G_09BBC],0
        mov word ptr ds:[_G_05F06],0
        mov byte ptr ds:[_G_05EF2],0
        xor ax,ax
        mov word ptr ds:[_G_05EEE],ax
        call _FN_CIRCUIT_EGA_05A15
        xor ax,ax
        mov word ptr ds:[_G_05FD4],ax
        mov word ptr ds:[_G_09CF6],ax
        mov word ptr ds:[_G_05FE0],ax
        mov word ptr ds:[_G_05FDA],ax
        mov word ptr ds:[_G_05FD6],ax
        mov ax,word ptr ds:[_G_05A7A]
        mov word ptr ds:[_G_080F4],ax
        mov word ptr ds:[_G_080F8],384h
        mov word ptr ds:[_G_080F6],0FFFFh
        cmp byte ptr ds:[_G_0006C],0
        je short clear_values
        mov byte ptr ds:[_G_05F3B],1
        mov ax,word ptr ds:[_G_05724]
        mov word ptr ds:[_G_05EDE],ax
        mov ax,word ptr ds:[_G_057AA]
        mov word ptr ds:[_G_05F40],ax
        mov ax,word ptr ds:[_G_057AC]
        mov word ptr ds:[_G_05F42],ax
        jmp short merge_values
        nop
clear_values:
        mov byte ptr ds:[_G_05F3B],0
        mov ax,word ptr ds:[_G_057A6]
        mov word ptr ds:[_G_05F40],ax
        mov ax,word ptr ds:[_G_057A8]
        mov word ptr ds:[_G_05F42],ax
merge_values:
        mov ax,word ptr ds:[_G_05F40]
        mov word ptr ds:[_G_05F44],ax
        mov ax,word ptr ds:[_G_05F42]
        mov word ptr ds:[_G_05F46],ax
        mov word ptr ds:[_G_05EE6],190h
        mov al,1
        mov byte ptr ds:[_G_05EEA],al
        mov byte ptr ds:[_G_05EE8],al
        ret
_grp_43f58d0a ENDP
_TEXT ENDS
END
