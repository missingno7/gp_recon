_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _GRP_D1938643:NEAR
        PUBLIC _grp_27e0affb
_G_00672 EQU 00672h
_G_00674 EQU 00674h
_G_00676 EQU 00676h
_G_00678 EQU 00678h
_G_0067A EQU 0067Ah
_G_0067C EQU 0067Ch
_G_05E26 EQU 05E22h
_G_05E34 EQU 05E30h
_CS_G_0C7CC EQU 0A84Ch
_grp_27e0affb PROC NEAR
        mov word ptr ds:[_G_00672],ax
        mov word ptr ds:[_G_00674],bx
        mov word ptr ds:[_G_00676],cx
        mov word ptr ds:[_G_00678],dx
        mov bx,word ptr ds:[_G_0067A]
        mov ax,word ptr ds:[_G_05E26]
        mov word ptr cs:[_CS_G_0C7CC],ax
        mov ax,word ptr ds:[_G_00672]
        mov cx,word ptr ds:[_G_00678]
        mov dx,word ptr ds:[_G_0067C]
        sub bx,dx
        sub cx,ax
        push word ptr ds:[_G_05E34]
        push dx
        push cx
        push bx
        push ax
        call _GRP_D1938643
        add sp,0ah
        mov bx,word ptr ds:[_G_0067A]
        mov dx,si
        sub dx,bx
        inc dx
        push dx
        mov ax,word ptr ds:[_G_00672]
        mov cx,word ptr ds:[_G_00674]
        sub cx,ax
        push word ptr ds:[_G_05E34]
        push dx
        push cx
        push bx
        push ax
        call _GRP_D1938643
        add sp,0ah
        pop dx
        mov bx,word ptr ds:[_G_0067A]
        mov ax,word ptr ds:[_G_00676]
        mov cx,word ptr ds:[_G_00678]
        sub cx,ax
        push word ptr ds:[_G_05E34]
        push dx
        push cx
        push bx
        push ax
        call _GRP_D1938643
        add sp,0ah
        ret
_grp_27e0affb ENDP
_TEXT ENDS
END
