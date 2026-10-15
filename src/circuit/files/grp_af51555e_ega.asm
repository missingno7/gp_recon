_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _GRP_F2C75C55:NEAR
        PUBLIC _grp_af51555e
_grp_af51555e PROC NEAR
        push bp
        mov bp,sp
        sub sp,0ch
        push ds
        push si
        push di
        mov dx,word ptr ss:[bp+4]
        mov dx,word ptr ss:[bp+4]
        mov ah,3dh
        xor al,al
        int 21h
        jae short opened
        jmp short _GRP_F2C75C55+14h
opened:
        mov word ptr ss:[bp-2],ax
        mov bx,word ptr ss:[bp-2]
        lea dx,[bp-0ch]
        mov cx,9
        mov ah,3fh
        int 21h
        cmp ax,cx
        jne short read_error
        mov bx,word ptr ss:[bp-2]
        mov ah,3eh
        int 21h
        mov ax,word ptr ss:[bp-0ch]
        mov dx,word ptr ss:[bp-0ah]
        xor bx,bx
        test ax,0fh
        je short aligned
        mov bx,1
aligned:
        shr dx,1
        rcr ax,1
        shr dx,1
        rcr ax,1
        shr dx,1
        rcr ax,1
        shr dx,1
        rcr ax,1
        add ax,bx
        pop di
        pop si
        pop ds
        mov sp,bp
        pop bp
        ret
read_error:
        mov bx,word ptr ss:[bp-2]
        mov ah,3eh
        int 21h
        jmp _GRP_F2C75C55+14h
_grp_af51555e ENDP
_TEXT ENDS
END
