_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        PUBLIC _grp_389c6fa6
        EXTRN _FN_CIRCUIT_EGA_0A672:NEAR
_G_00906 EQU 0906h
_G_05FDA EQU 5FDAh
_G_05E3E EQU 5E3Eh
_G_05E28 EQU 5E28h
_G_06BD4 EQU 6BD4h
_G_06BE4 EQU 6BE4h
_grp_389c6fa6 PROC NEAR
        mov di,_G_06BD4
        mov cx,140h
        mov dx,0C0h
        mov ax,word ptr ds:[_G_00906]
        sub ax,word ptr ds:[_G_05FDA]
        cmp byte ptr ds:[_G_05E3E],0
        je short common_shifts
        neg ax
        add ax,3D00h
        mov di,_G_06BE4
        mov cx,60h
        mov dx,0A0h
        shr ax,1
common_shifts:
        shr ax,1
        shr ax,1
        shr ax,1
        shr ax,1
        shr ax,1
        shr ax,1
        neg ax
        mov bx,word ptr ds:[_G_05E28]
        push bx
        push ax
        push word ptr ds:[di+2]
        push word ptr ds:[di]
        add ax,cx
        push bx
        push ax
        push word ptr ds:[di+6]
        push word ptr ds:[di+4]
        add ax,dx
        push bx
        push ax
        push word ptr ds:[di+0Ah]
        push word ptr ds:[di+8]
        add ax,cx
        push bx
        push ax
        push word ptr ds:[di+0Eh]
        push word ptr ds:[di+0Ch]
        add ax,dx
        push bx
        push ax
        push word ptr ds:[di+2]
        push word ptr ds:[di]
        call _FN_CIRCUIT_EGA_0A672
        add sp,8
        call _FN_CIRCUIT_EGA_0A672
        add sp,8
        call _FN_CIRCUIT_EGA_0A672
        add sp,8
        call _FN_CIRCUIT_EGA_0A672
        add sp,8
        call _FN_CIRCUIT_EGA_0A672
        add sp,8
        ret
_grp_389c6fa6 ENDP
_TEXT ENDS
END
