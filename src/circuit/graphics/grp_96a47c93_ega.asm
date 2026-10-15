_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_094D0:NEAR
        PUBLIC _grp_96a47c93
_G_05E3E EQU 5E3Eh
_G_05C9B EQU 5C9Bh
_G_00B28 EQU 0B28h
_G_05C34 EQU 5C34h
_G_00802 EQU 0802h
_grp_96a47c93 PROC NEAR
        cmp byte ptr ds:[_G_05E3E],0
        je short alternate
        mov si,word ptr ss:[bp+0A1Ah]
        mov ax,si
        sub al,byte ptr [si+_G_05C9B]
        cbw
        shl si,1
        mov di,word ptr [si+_G_00B28]
        shr si,1
        jmp short common
        nop
alternate:
        mov si,word ptr ss:[bp+742Ch]
        mov ax,si
        sub al,byte ptr [si+_G_05C34]
        cbw
        shl si,1
        mov di,word ptr [si+_G_00802]
        shr si,1
common:
        mov bx,ax
        mov ax,08888h
        mov cx,word ptr ss:[bp+7234h]
        mov dx,word ptr ss:[bp+7288h]
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
        call _FN_CIRCUIT_EGA_094D0
        add sp,0ah
        call _FN_CIRCUIT_EGA_094D0
        add sp,0ah
        call _FN_CIRCUIT_EGA_094D0
        add sp,0ah
        ret
_grp_96a47c93 ENDP
_TEXT ENDS
END
