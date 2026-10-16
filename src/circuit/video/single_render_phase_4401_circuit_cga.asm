_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _render_phase_4401
_g_00670 EQU 00670h
_g_07160 EQU 07160h
_g_05e3a EQU 05e3ah
EXTRN _fn_circuit_cga_06bee:NEAR
EXTRN _fn_circuit_cga_097cc:NEAR
_render_phase_4401 PROC NEAR
        mov ax,word ptr ds:[_g_07160]
        sub ax,word ptr ds:[_g_00670]
        and al,7
        jne short phase_nonzero
        cmp byte ptr ds:[_g_05e3a],0
        je short phase_zero_alt
        mov si,word ptr [bp+0a16h]
        mov ax,si
        sub al,byte ptr [si+5c97h]
        cbw
        shl si,1
        mov di,word ptr [si+0b24h]
        shr si,1
        jmp short phase_zero_join
        nop
phase_zero_alt:
        mov si,word ptr [bp+7404h]
        mov ax,si
        sub al,byte ptr [si+5c30h]
        cbw
        shl si,1
        mov di,word ptr [si+0802h]
        shr si,1
phase_zero_join:
        mov bx,ax
        mov ax,5555h
        mov cx,word ptr [bp+720ch]
        mov dx,word ptr [bp+7260h]
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
        call _fn_circuit_cga_06bee
        add sp,0ah
        call _fn_circuit_cga_06bee
        add sp,0ah
        call _fn_circuit_cga_06bee
        add sp,0ah
        ret
phase_nonzero:
        add al,4
        and al,7
        jne short phase_nonzero_done
        cmp byte ptr ds:[_g_05e3a],0
        je short phase_nonzero_alt
        mov si,word ptr [bp+0a16h]
        mov ax,si
        sub al,byte ptr [si+5c97h]
        cbw
        mov di,word ptr [bp+5d0ah]
        jmp short phase_nonzero_join
        nop
phase_nonzero_alt:
        mov si,word ptr [bp+7404h]
        mov ax,si
        sub al,byte ptr [si+5c30h]
        cbw
        mov di,word ptr [bp+5cb6h]
phase_nonzero_join:
        add di,6254h
        push ax
        push word ptr [bp+735ch]
        push word ptr [di+2]
        push word ptr [di]
        call _fn_circuit_cga_097cc
        add sp,8
phase_nonzero_done:
        ret
_render_phase_4401 ENDP
_TEXT ENDS
END
