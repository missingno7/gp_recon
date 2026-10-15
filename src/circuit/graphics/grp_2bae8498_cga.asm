_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        PUBLIC _grp_2bae8498
_G_09BD6 EQU 9BA6h
_G_00B66 EQU 0B62h
_G_05EBE EQU 5EA2h
_G_05EC0 EQU 5EA4h
_G_00BE6 EQU 0BE2h
_grp_2bae8498 PROC NEAR
        push es
        push di
        push ds
        pop es
        mov cx,3dh
        mov di,_G_00B66
        xor ax,ax
        rep stosw
        cmp word ptr ds:[_G_09BD6],0
        je short finish
        mov cx,9
        mov bp,2
adjust_loop:
        mov ax,word ptr ds:[_G_05EBE]
        sub ax,14h
        mov bx,word ptr ss:[bp+0C46h]
        sub ax,bx
        jle short tail
advance:
        inc bp
        inc bp
        loop short adjust_loop
finish:
        pop di
        pop es
        ret
tail:
        neg ax
        cmp ax,3dh
        jg short clear_limit
        mov bl,byte ptr ss:[bp+0C5Ah]
        sub bl,byte ptr ds:[_G_05EC0]
        jl short decrement
update:
        mov bx,ax
        shl bx,1
        mov ax,bp
        mov ah,byte ptr ds:[bx+_G_00B66]
        mov word ptr ds:[bx+_G_00B66],ax
        jmp short advance
decrement:
        dec ax
        jg short update
clear_limit:
        mov word ptr ds:[_G_00BE6],0
        jmp short advance
_grp_2bae8498 ENDP
_TEXT ENDS
END
