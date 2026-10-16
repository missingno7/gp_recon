_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _render_phase_4401
_g_00670 EQU 00670h
_g_07188 EQU 07188h
_g_05e3e EQU 05e3eh
EXTRN _fn_circuit_ega_094d0:NEAR
EXTRN _fn_circuit_ega_0a672:NEAR
_render_phase_4401 PROC NEAR
        mov ax,word ptr ds:[_g_07188]
        sub ax,word ptr ds:[_g_00670]
        and al,7
        jne short phase_nonzero
        cmp byte ptr ds:[_g_05e3e],0
        je short phase_zero_alt
        mov si,word ptr [bp+0a1ah]
        mov ax,si
        sub al,byte ptr [si+5c9bh]
        cbw
        shl si,1
        mov di,word ptr [si+0b28h]
        shr si,1
        jmp short phase_zero_join
        nop
phase_zero_alt:
        mov si,word ptr [bp+742ch]
        mov ax,si
        sub al,byte ptr [si+5c34h]
        cbw
        shl si,1
        mov di,word ptr [si+0802h]
        shr si,1
phase_zero_join:
        mov bx,ax
        mov ax,8888h
        mov cx,word ptr [bp+7234h]
        mov dx,word ptr [bp+7288h]
        sub cx,di
        add dx,di
        push ax
        push si
        push cx
        push bx
        push cx
        push ax
        push bx
        push cx
        push bx
        push dx
        push ax
        push si
        push dx
        push bx
        push dx
        call _fn_circuit_ega_094d0
        add sp,0ah
        call _fn_circuit_ega_094d0
        add sp,0ah
        call _fn_circuit_ega_094d0
        add sp,0ah
        ret
phase_nonzero:
        add al,4
        and al,7
        jne short phase_nonzero_done
        cmp byte ptr ds:[_g_05e3e],0
        je short phase_nonzero_alt
        mov si,word ptr [bp+0a1ah]
        mov ax,si
        sub al,byte ptr [si+5c9bh]
        cbw
        mov di,word ptr [bp+5d0eh]
        jmp short phase_nonzero_join
        nop
phase_nonzero_alt:
        mov si,word ptr [bp+742ch]
        mov ax,si
        sub al,byte ptr [si+5c34h]
        cbw
        mov di,word ptr [bp+5cbah]
phase_nonzero_join:
        add di,6270h
        push ax
        push word ptr [bp+7384h]
        push word ptr [di+2]
        push word ptr [di]
        call _fn_circuit_ega_0a672
        add sp,8
phase_nonzero_done:
        ret
_render_phase_4401 ENDP
_TEXT ENDS
END
