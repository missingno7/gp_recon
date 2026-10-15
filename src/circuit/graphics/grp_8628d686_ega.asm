_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _GRP_27E0AFFB:NEAR
        PUBLIC _grp_8628d686
_G_0066C EQU 066Ch
_G_0067A EQU 067Ah
_G_0067C EQU 067Ch
_G_05E2A EQU 5E2Ah
_G_05E2C EQU 5E2Ch
_G_05E34 EQU 5E34h
        _G_07236 EQU 7236h
        _G_0728A EQU 728Ah
_grp_8628d686 PROC NEAR
        push bp
        mov cx,di
        cmp word ptr ds:[_G_0066C],4Eh
        je short epilogue
        mov si,word ptr ss:[bp+742Ch]
        mov dl,byte ptr ds:[si+5C34h]
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
        mov ax,word ptr ds:[_G_05E2A]
        mov word ptr ds:[_G_07236],ax
        mov ax,word ptr ds:[_G_05E2C]
        mov word ptr ds:[_G_0728A],ax
        jmp short merge
        nop
positive:
        mov di,word ptr ds:[di+742Ch]
        shl di,1
        mov ax,word ptr ds:[di+802h]
        shr di,1
        mov dl,byte ptr ds:[di+5C34h]
        xor dh,dh
        sub di,dx
merge:
        mov dx,bx
        sub dx,di
        mov word ptr ds:[_G_0067C],dx
        mov di,word ptr ds:[_G_0066C]
        mov dx,word ptr ds:[di+7288h]
        add dx,ax
        neg ax
        add ax,word ptr ds:[di+7234h]
        mov bx,word ptr ss:[bp+7234h]
        sub bx,cx
        add cx,word ptr ss:[bp+7288h]
        mov word ptr ds:[_G_05E34],0
        call _GRP_27E0AFFB
 epilogue:
        pop bp
        ret
_grp_8628d686 ENDP
_TEXT ENDS
END
