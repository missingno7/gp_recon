_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _update_item_pair_44b2
_g_0070a EQU 070ah
_update_item_pair_44b2 PROC NEAR
        push ax
        mov di,word ptr ds:[_g_0070a]
        mov ax,word ptr [bx+2]
        mov bx,word ptr [bx]
        cmp ax,bx
        je short value_unchanged
        cmp ax,word ptr [di+0be6h]
        jne short value_unchanged
        mov bx,ax
value_unchanged:
        mov word ptr [di+0be6h],bx
        pop ax
        ret
_update_item_pair_44b2 ENDP
_TEXT ENDS
END
