_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        PUBLIC _grp_b22bb864
_G_05EF6 EQU 5EF6h
_G_00288 EQU 0288h
_G_01F4C EQU 1F4Ch
_G_05ECC EQU 5ECCh
_G_01F2C EQU 1F2Ch
_G_05EC6 EQU 5EC6h
_G_05EBA EQU 5EBAh
_G_05EC2 EQU 5EC2h
_G_05EC8 EQU 5EC8h
_G_05ECA EQU 5ECAh
_G_0006A EQU 006Ah
_G_012DC EQU 12DCh
_G_012D8 EQU 12D8h
_G_012DA EQU 12DAh
_G_01F2E EQU 1F2Eh
_G_012DE EQU 12DEh
_grp_b22bb864 PROC NEAR
        mov word ptr ds:[_G_05EF6],0ffffh
        mov bx,word ptr ds:[_G_00288]
        shl bx,1
        mov ax,word ptr ds:[bx+_G_01F4C]
        mov word ptr ds:[_G_05ECC],ax
        shl bx,1
        mov ax,word ptr ds:[bx+_G_01F2C]
        mov word ptr ds:[_G_05EC6],ax
        add ax,14h
        mov word ptr ds:[_G_05EBA],ax
        mov word ptr ds:[_G_05EC2],0
        mov ax,word ptr ds:[bx+_G_01F2E]
        mov word ptr ds:[_G_05EC8],ax
        sub ax,word ptr ds:[_G_05EC6]
        mov word ptr ds:[_G_05ECA],ax
        mov cx,4
        sub cx,word ptr ds:[_G_0006A]
        shl cx,1
        shl cx,1
        shl cx,1
        mov ax,word ptr ds:[bx+_G_012DC]
        add ax,cx
        mov word ptr ds:[_G_012D8],ax
        mov ax,word ptr ds:[bx+_G_012DE]
        shr cx,1
        shr cx,1
        shr cx,1
        add ax,cx
        mov word ptr ds:[_G_012DA],ax
        ret
_grp_b22bb864 ENDP
_TEXT ENDS
END
