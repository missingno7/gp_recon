_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _update_display_item_4553
_g_07188 EQU 07188h
_g_00670 EQU 00670h
_g_0070a EQU 0070ah
_g_00708 EQU 00708h
_g_007ce EQU 007ceh
_g_05ed4 EQU 05ed4h
_g_05ed6 EQU 05ed6h
_g_05e34 EQU 05e34h
_CS_G_0C7CC EQU 0c7cch
EXTRN _GRP_4AAA407A:NEAR
EXTRN _FN_CIRCUIT_EGA_0560E:NEAR
EXTRN _FN_CIRCUIT_EGA_044B2:NEAR
EXTRN _GRP_42D943B6:NEAR
EXTRN _FN_CIRCUIT_EGA_08CF6:NEAR
EXTRN _FN_CIRCUIT_EGA_0BB7A:NEAR
EXTRN _FN_CIRCUIT_EGA_0D2A4:NEAR
_update_display_item_4553 PROC NEAR
redraw_item:
        mov al,byte ptr [bp+0b8eh]
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
        mov si,word ptr [si+742ch]
        cmp word ptr ds:[_g_00708],10h
        jg short item_large_index
        mov si,word ptr [bx+070ch]
item_large_index:
        shl si,1
        mov dx,word ptr [si+0560h]
        mov bx,word ptr [di+0c0eh]
        neg bx
        call _FN_CIRCUIT_EGA_0560E
        mov bx,word ptr ds:[_g_00708]
        mov di,si
        cmp di,00deh
        jl short item_small_offset
        mov di,word ptr [bx+742ch]
        shl di,1
        sub di,2
item_small_offset:
        add ax,word ptr [di+6fbch]
        shr si,1
        add bx,5cbah
        call _FN_CIRCUIT_EGA_044B2
        mov cx,bx
        add cx,6a2ch
        call _GRP_42D943B6
        add bx,di
        mov dx,bx
        add bx,675ch
        add dx,67dch
        mov di,word ptr ds:[_g_0070a]
        add dx,word ptr [di+670ch]
        add cx,word ptr [di+6734h]
        cmp word ptr ds:[_g_05ed4],di
        jne short item_positions_ready
        mov bx,word ptr ds:[_g_05ed6]
        mov dx,bx
        add bx,67bch
        add dx,67dch
        add dx,word ptr [di+6748h]
        mov cx,6a2ch
item_positions_ready:
        mov word ptr cs:[_CS_G_0C7CC],6fh
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
        call _FN_CIRCUIT_EGA_08CF6
        add sp,8
        call _FN_CIRCUIT_EGA_0BB7A
        add sp,8
        call _FN_CIRCUIT_EGA_0D2A4
        add sp,8
item_next_state:
        mov al,byte ptr [bp+0b8fh]
        or al,al
        je short item_finish
        xor ah,ah
        mov word ptr [bp+0b8eh],ax
        jmp near ptr item_active
item_finish:
        mov si,word ptr [bp+742ch]
        jmp near ptr $-040eh
_update_display_item_4553 ENDP
_TEXT ENDS
END
