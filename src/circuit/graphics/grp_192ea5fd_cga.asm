_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _GRP_27E0AFFB:NEAR
        PUBLIC _grp_192ea5fd
_G_0066C EQU 066Ch
_G_0067A EQU 067Ah
_G_0067C EQU 067Ch
_G_05E26 EQU 5E26h
_G_05E28 EQU 5E28h
_G_05E30 EQU 5E30h
_grp_192ea5fd PROC NEAR
        mov cx,di
        push bp
        cmp word ptr ds:[_G_0066C],26h
        je short epilogue
        mov si,word ptr ss:[bp+0A16h]
        mov dl,byte ptr ds:[si+5C97h]
        xor dh,dh
        mov bx,si
        sub bx,dx
        inc bx
        mov word ptr ds:[_G_0067A],bx
        mov di,word ptr ds:[_G_0066C]
        or di,di
        jg short positive
        xor di,di
        mov word ptr ds:[_G_0066C],2
        mov ax,word ptr ds:[_G_05E26]
_G_07236 EQU 720Eh
        mov word ptr ds:[_G_07236],ax
        mov ax,word ptr ds:[_G_05E28]
_G_0728A EQU 7262h
        mov word ptr ds:[_G_0728A],ax
        jmp short merge
        nop
positive:
        mov di,word ptr [di+0A16h]
        shl di,1
        mov ax,word ptr ds:[di+0B24h]
        shr di,1
        mov dl,byte ptr ds:[di+5C97h]
        xor dh,dh
        sub di,dx
merge:
        mov dx,bx
        sub dx,di
        mov word ptr ds:[_G_0067C],dx
        mov di,word ptr ds:[_G_0066C]
        mov dx,word ptr [di+7260h]
        add dx,ax
        neg ax
        add ax,word ptr [di+720Ch]
        mov bx,word ptr ss:[bp+720Ch]
        sub bx,cx
        add cx,word ptr ss:[bp+7260h]
        mov word ptr ds:[_G_05E30],0
        call _GRP_27E0AFFB
 epilogue:
        pop bp
        ret
_grp_192ea5fd ENDP
_TEXT ENDS
END
