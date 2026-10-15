_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _GRP_D687851F:NEAR
        EXTRN _FN_CIRCUIT_CGA_029EC:NEAR
        EXTRN _FN_CIRCUIT_CGA_02F80:NEAR
        EXTRN _GRP_E76F1CA2:NEAR
        EXTRN _FN_CIRCUIT_CGA_0AB24:NEAR
        EXTRN _GRP_622C4ED2:NEAR
        EXTRN _GRP_921AA84F:NEAR
        EXTRN _FN_CIRCUIT_CGA_020BC:NEAR
        EXTRN _GRP_FADCAB13:NEAR
        PUBLIC _grp_90f6614b
_G_00160 EQU 0160h
_G_002A8 EQU 02A8h
_G_0028A EQU 028Ah
_G_096E4 EQU 96B4h
_G_09BD6 EQU 9BA6h
_G_09050 EQU 9028h
_grp_90f6614b PROC NEAR
        push bp
        mov bp,sp
        sub sp,4
        push si
        mov word ptr ss:[bp-4],0
loop_init:
        mov ax,1Ch
        imul word ptr ss:[bp-4]
        mov si,ax
        mov word ptr ds:[si+_G_00160],0
        mov word ptr ds:[si+_G_00160+2],0
        inc word ptr ss:[bp-4]
        cmp word ptr ss:[bp-4],0Ah
        jl short loop_init
        call _GRP_D687851F
        mov word ptr ss:[bp-2],ax
        cmp ax,1Bh
        jne short check_result
return_result:
        mov ax,word ptr ss:[bp-2]
        pop si
        mov sp,bp
        pop bp
        ret
check_result:
        cmp word ptr ss:[bp-2],0
        je short initialize
        mov byte ptr ds:[_G_002A8],0
error_calls:
        call _FN_CIRCUIT_CGA_029EC
        call _FN_CIRCUIT_CGA_02F80
        jmp short return_result
        nop
initialize:
        mov byte ptr ds:[_G_002A8],1
        mov ax,word ptr ds:[_G_0028A]
        mov word ptr ds:[_G_096E4],ax
        mov word ptr ds:[_G_09BD6],1
        sub ax,ax
        push ax
        call _GRP_E76F1CA2
        add sp,2
        sub ax,ax
        push ax
        mov ax,3
        push ax
        call _FN_CIRCUIT_CGA_0AB24
        add sp,4
        mov ax,58h
        push ax
        mov ax,_G_09050
        push ax
        call _GRP_622C4ED2
        add sp,4
        mov ax,78h
        cwd
        push dx
        push ax
        call _GRP_921AA84F
        add sp,4
        call _FN_CIRCUIT_CGA_020BC
        mov word ptr ss:[bp-2],ax
        cmp ax,1Bh
        jne short error_calls
        call _GRP_FADCAB13
        mov ax,18h
        pop si
        mov sp,bp
        pop bp
        ret
_grp_90f6614b ENDP
_TEXT ENDS
END
