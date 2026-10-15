_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _GRP_D1938643:NEAR
        PUBLIC _grp_487bd94e
_G_05E34 EQU 5E30h
_G_05E3E EQU 5E3Ah
_G_07CA EQU 07CAh
_G_07CC EQU 07CCh
_grp_487bd94e PROC NEAR
        mov word ptr ds:[_G_05E34],0FFFFh
        mov di,si
        shl di,1
        mov ax,word ptr ds:[di+6C1Ch]
        mov cx,word ptr ds:[di+7072h]
        mov dl,byte ptr ds:[si+5C30h]
        cmp byte ptr ds:[_G_05E3E],0
        je short skip_y
        mov dl,byte ptr ds:[si+5C97h]
skip_y:
        xor dh,dh
        mov bx,si
        sub bx,dx
        sar dx,1
        sub bx,dx
        sub bx,dx
        inc dx
        push bx
        mov word ptr ds:[_G_07CA],ax
        mov word ptr ds:[_G_07CC],bx
        sub cx,ax
        push word ptr ds:[_G_05E34]
        push dx
        push cx
        push bx
        push ax
        call _GRP_D1938643
        add sp,0Ah
        pop bx
        mov ax,word ptr ds:[di+6C1Ch]
        mov dx,si
        sub dx,bx
        mov cx,dx
        sar cx,1
        sar cx,1
        sar cx,1
        add cx,ax
        dec ax
        push bx
        push dx
        sub cx,ax
        push word ptr ds:[_G_05E34]
        push dx
        push cx
        push bx
        push ax
        call _GRP_D1938643
        add sp,0Ah
        pop dx
        pop bx
        mov cx,word ptr ds:[di+7072h]
        mov ax,dx
        sar ax,1
        sar ax,1
        sar ax,1
        sub ax,cx
        inc cx
        neg ax
        sub cx,ax
        push word ptr ds:[_G_05E34]
        push dx
        push cx
        push bx
        push ax
        call _GRP_D1938643
        add sp,0Ah
        ret
_grp_487bd94e ENDP
_TEXT ENDS
END
