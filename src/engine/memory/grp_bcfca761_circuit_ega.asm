.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
MEMSIZE_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:MEMSIZE_TEXT, DS:DGROUP
        EXTRN _G_A540:WORD, _G_A53A:WORD, _G_A5B1:WORD
        EXTRN _fn_circuit_ega_e0ba:NEAR
        PUBLIC _grp_bcfca761
_grp_bcfca761 PROC NEAR
        mov dx,ax
        add ax,word ptr ds:[_G_A540]
        jb short fail_tail
        cmp word ptr ds:[_G_A53A],ax
        jae short return_path
        add ax,0Fh
        push ax
        rcr ax,1
        mov cl,3
        shr ax,cl
        mov cx,ds
        mov bx,word ptr ds:[_G_A5B1]
        sub cx,bx
        add ax,cx
        mov es,bx
        mov bx,ax
        mov ah,4Ah
        int 21h
        pop ax
        jb short fail_tail
        and al,0F0h
        dec ax
        mov word ptr ds:[_G_A53A],ax
return_path:
        xchg bp,ax
        mov bp,word ptr ds:[_G_A540]
        add word ptr ds:[_G_A540],dx
        ret
fail_tail:
        mov ax,di
        jmp _fn_circuit_ega_e0ba
_grp_bcfca761 ENDP
MEMSIZE_TEXT ENDS
        END
