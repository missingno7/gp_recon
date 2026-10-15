_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        PUBLIC _grp_5200b905
_grp_5200b905 PROC NEAR
        cmp word ptr ss:[bp+0CC2h],0
        je short return_here
        cmp word ptr ds:[di+0D14h],4
        jl short initialize
        cmp word ptr ds:[di+0D12h],4
        jl short initialize
        mov bx,word ptr ss:[bp+0CD6h]
        sub bx,word ptr ss:[bp+0C86h]
        je short clear_delta
        mov ax,bx
        jg short positive_delta
        neg ax
positive_delta:
        cmp ax,word ptr ss:[bp+0CC2h]
        jl short clear_delta
        or bx,bx
        jg short increase
        mov ax,word ptr ss:[bp+0CC2h]
        sub word ptr ss:[bp+0C86h],ax
        jmp short return_here
        nop
increase:
        mov ax,word ptr ss:[bp+0CC2h]
        add word ptr ss:[bp+0C86h],ax
return_here:
        ret
initialize:
        mov ax,1E0h
        cmp word ptr ss:[bp+0C86h],0
        jg short init_positive
        neg ax
        mov word ptr ss:[bp+0CD6h],ax
        mov word ptr ss:[bp+0CC2h],50h
        jmp short return_here
init_positive:
        mov word ptr ss:[bp+0CD6h],ax
        mov word ptr ss:[bp+0CC2h],50h
        mov ax,word ptr ss:[bp+0CFEh]
        sar ax,1
        sar ax,1
        sub word ptr ss:[bp+0CFEh],ax
        sub word ptr ss:[bp+0CEAh],ax
        jge short return_here
        mov word ptr ss:[bp+0CEAh],0
        jmp short return_here
clear_delta:
        mov word ptr ss:[bp+0CC2h],0
        jmp short return_here
_grp_5200b905 ENDP
_TEXT ENDS
END
