_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _update_display_item_4553
_g_00670 EQU 00670h
_g_0070a EQU 0070ah
_g_00708 EQU 00708h
_g_05eb8 EQU 05eb8h
_g_05eba EQU 05ebah
_g_05e30 EQU 05e30h
_CS_G_0C7BC EQU 0a84ch
EXTRN _GRP_4AAA407A:NEAR
EXTRN _FN_CIRCUIT_CGA_054C4:NEAR
EXTRN _FN_CIRCUIT_CGA_044BC:NEAR
EXTRN _GRP_42D943B6:NEAR
EXTRN _FN_CIRCUIT_CGA_06666:NEAR
EXTRN _FN_CIRCUIT_CGA_0A018:NEAR
EXTRN _FN_CIRCUIT_CGA_0B436:NEAR
_update_display_item_4553 PROC NEAR
redraw_item:
        mov al,byte ptr [bp+0b8ah]
        or al,al
        jne short item_active
        jmp near ptr item_finish
item_active:
        xor ah,ah
        mov word ptr ds:[_g_0070a],ax
        mov bx,ax
        mov di,ax
        call _GRP_4AAA407A
        cmp bx,0400h
        jle short item_index_ok
        jmp near ptr item_next_state
item_index_ok:
        mov si,word ptr ds:[_g_00708]
        mov si,word ptr [si+7404h]
        cmp word ptr ds:[_g_00708],10h
        jg short item_large_index
        mov si,word ptr [bx+070ch]
item_large_index:
        shl si,1
        mov dx,word ptr [si+0560h]
        mov bx,word ptr [di+0c0ah]
        neg bx
        call _FN_CIRCUIT_CGA_054C4
        mov bx,word ptr ds:[_g_00708]
        mov di,si
        cmp di,00deh
        jl short item_small_offset
        mov di,word ptr [bx+7404h]
        shl di,1
        sub di,2
item_small_offset:
        add ax,word ptr [di+6f94h]
        shr si,1
        add bx,5cb6h
        call _FN_CIRCUIT_CGA_044BC
        mov cx,bx
        add cx,6a10h
        call _GRP_42D943B6
        add bx,di
        mov dx,bx
        add bx,6740h
        add dx,67c0h
        mov di,word ptr ds:[_g_0070a]
        add dx,word ptr [di+66f0h]
        add cx,word ptr [di+6718h]
        cmp word ptr ds:[_g_05eb8],di
        jne short item_positions_ready
        mov bx,word ptr ds:[_g_05eba]
        mov dx,bx
        add bx,67a0h
        add dx,67c0h
        add dx,word ptr [di+672ch]
        mov cx,6a10h
item_positions_ready:
        mov word ptr cs:[_CS_G_0C7BC],6fh
        mov di,cx
        push si
        push ax
        push word ptr [di+2]
        push word ptr [di]
        mov di,dx
        push si
        push ax
        push word ptr [di+2]
        push word ptr [di]
        push si
        push ax
        push word ptr [bx+2]
        push word ptr [bx]
        call _FN_CIRCUIT_CGA_06666
        add sp,8
        call _FN_CIRCUIT_CGA_0A018
        add sp,8
        call _FN_CIRCUIT_CGA_0B436
        add sp,8
item_next_state:
        mov al,byte ptr [bp+0b8bh]
        or al,al
        je short item_finish
        xor ah,ah
        mov word ptr [bp+0b8ah],ax
        jmp near ptr item_active
item_finish:
        mov si,word ptr [bp+7404h]
        jmp near ptr $-040eh
_update_display_item_4553 ENDP
_TEXT ENDS
END
