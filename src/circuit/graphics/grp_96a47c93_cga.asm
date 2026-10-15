_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_06BEE:NEAR
        PUBLIC _grp_96a47c93
_G_05E3E EQU 5E3Ah
_G_05C9B EQU 5C97h
_G_00B28 EQU 0B24h
_G_05C34 EQU 5C30h
_G_00802 EQU 0802h
_grp_96a47c93 PROC NEAR
        cmp byte ptr ds:[_G_05E3E],0
        je short alternate
        mov si,word ptr ss:[bp+0A16h]
        mov ax,si
        sub al,byte ptr [si+_G_05C9B]
        cbw
        shl si,1
        mov di,word ptr [si+_G_00B28]
        shr si,1
        jmp short common
        nop
alternate:
        mov si,word ptr ss:[bp+7404h]
        mov ax,si
        sub al,byte ptr [si+_G_05C34]
        cbw
        shl si,1
        mov di,word ptr [si+_G_00802]
        shr si,1
common:
        mov bx,ax
        mov ax,05555h
        mov cx,word ptr ss:[bp+720Ch]
        mov dx,word ptr ss:[bp+7260h]
        sub cx,di
        add dx,di
        push ax
        push si
        push cx
        push bx
        push cx
        push ax
        push bx
        push cx
        push bx
        push dx
        push ax
        push si
        push dx
        push bx
        push dx
        call _FN_CIRCUIT_CGA_06BEE
        add sp,0ah
        call _FN_CIRCUIT_CGA_06BEE
        add sp,0ah
        call _FN_CIRCUIT_CGA_06BEE
        add sp,0ah
        ret
_grp_96a47c93 ENDP
_TEXT ENDS
END
