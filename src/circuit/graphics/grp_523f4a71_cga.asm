_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_04396:NEAR
        EXTRN _FN_CIRCUIT_CGA_06F94:NEAR
        EXTRN _FN_CIRCUIT_CGA_04416:NEAR
        PUBLIC _grp_523f4a71
_G_0066C EQU 066Ch
_G_0067A EQU 067Ah
_G_0067C EQU 067Ch
_G_05E2A EQU 5E26h
_G_05E2C EQU 5E28h
_G_05E34 EQU 5E30h
_grp_523f4a71 PROC NEAR
        push bp
        mov bp,word ptr ds:[_G_0066C]
        xor dh,dh
        mov bx,si
        sub bx,dx
        mov word ptr ds:[_G_0067A],bx
        sar dx,1
        sar dx,1
        mov word ptr ds:[_G_0067C],dx
        mov ax,word ptr ds:[_G_05E2A]
        mov bx,word ptr ss:[bp+720Ch]
        mov cx,word ptr ss:[bp+7260h]
        sub bx,di
        add cx,di
        mov dx,word ptr ds:[_G_05E2C]
        mov word ptr ds:[_G_05E34],6699h
        call _FN_CIRCUIT_CGA_04396
        mov ax,word ptr ds:[_G_0067A]
        mov bx,word ptr ds:[_G_0067C]
        sub ax,bx
        shr bx,1
        inc bx
        xor dx,dx
        mov cx,0ffffh
        push cx
        push bx
        push word ptr ds:[_G_05E2C]
        push ax
        push dx
        call _FN_CIRCUIT_CGA_06F94
        add sp,0ah
        call _FN_CIRCUIT_CGA_04416
        pop bp
        ret
_grp_523f4a71 ENDP
_TEXT ENDS
END
