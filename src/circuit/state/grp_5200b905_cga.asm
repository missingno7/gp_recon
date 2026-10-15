_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        PUBLIC _grp_5200b905
_grp_5200b905 PROC NEAR
        cmp word ptr ss:[bp+0CBEh],0
        je short return_here
        cmp word ptr ds:[di+0D10h],4
        jl short initialize
        cmp word ptr ds:[di+0D0Eh],4
        jl short initialize
        mov bx,word ptr ss:[bp+0CD2h]
        sub bx,word ptr ss:[bp+0C82h]
        je short clear_delta
        mov ax,bx
        jg short positive_delta
        neg ax
positive_delta:
        cmp ax,word ptr ss:[bp+0CBEh]
        jl short clear_delta
        or bx,bx
        jg short increase
        mov ax,word ptr ss:[bp+0CBEh]
        sub word ptr ss:[bp+0C82h],ax
        jmp short return_here
        nop
increase:
        mov ax,word ptr ss:[bp+0CBEh]
        add word ptr ss:[bp+0C82h],ax
return_here:
        ret
initialize:
        mov ax,1E0h
        cmp word ptr ss:[bp+0C82h],0
        jg short init_positive
        neg ax
        mov word ptr ss:[bp+0CD2h],ax
        mov word ptr ss:[bp+0CBEh],50h
        jmp short return_here
init_positive:
        mov word ptr ss:[bp+0CD2h],ax
        mov word ptr ss:[bp+0CBEh],50h
        mov ax,word ptr ss:[bp+0CFAh]
        sar ax,1
        sar ax,1
        sub word ptr ss:[bp+0CFAh],ax
        sub word ptr ss:[bp+0CE6h],ax
        jge short return_here
        mov word ptr ss:[bp+0CE6h],0
        jmp short return_here
clear_delta:
        mov word ptr ss:[bp+0CBEh],0
        jmp short return_here
_grp_5200b905 ENDP
_TEXT ENDS
END
