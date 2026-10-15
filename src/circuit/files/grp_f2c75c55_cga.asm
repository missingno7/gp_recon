_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _G_07ED2:BYTE
        EXTRN _FN_CIRCUIT_cga_0B7B6:NEAR
        PUBLIC _grp_f2c75c55
_grp_f2c75c55 PROC NEAR
        push bp
        mov bp,sp
        sub sp,4
        push ds
        push si
        push di
        mov dx,word ptr ss:[bp+4]
        mov ah,3dh
        xor al,al
        int 21h
        jae short opened
        mov ax,8430h
        mov bx,SEG _G_07ED2
        mov ds,bx
        push word ptr ss:[bp+4]
        push ax
        call _FN_CIRCUIT_cga_0B7B6
opened:
        mov word ptr ss:[bp-2],ax
        mov bx,ax
        sub cx,cx
        sub dx,dx
        mov ax,4202h
        int 21h
        push dx
        push ax
        sub dx,dx
        mov ax,4200h
        int 21h
        pop ax
        pop dx
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
        mov word ptr ss:[bp-4],ax
        mov bx,word ptr ss:[bp-2]
        mov ah,3eh
        int 21h
        mov ax,word ptr ss:[bp-4]
        pop di
        pop si
        pop ds
        mov sp,bp
        pop bp
        ret
_grp_f2c75c55 ENDP
_TEXT ENDS
END
