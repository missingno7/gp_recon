_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_05641:NEAR
        EXTRN _FN_CIRCUIT_EGA_0B1B6:NEAR
        EXTRN _FN_CIRCUIT_EGA_08CD8:NEAR
        EXTRN _FN_CIRCUIT_EGA_0B184:NEAR
        EXTRN _FN_CIRCUIT_EGA_08CF6:NEAR
        EXTRN _FN_CIRCUIT_EGA_0BB7A:NEAR
        PUBLIC _grp_0cb3fcb5
_G_05E7E EQU 5E7Eh
_G_05E7F EQU 5E7Fh
_G_05EE6 EQU 5EE6h
_G_09BBC EQU 9BBCh
_G_05EEA EQU 5EEAh
_G_05E72 EQU 5E72h
_G_06B8C EQU 6B8Ch
_G_06B88 EQU 6B88h
_G_06B86 EQU 6B86h
_G_06B8A EQU 6B8Ah
_G_05F42 EQU 5F42h
_G_05E7C EQU 5E7Ch
_G_05F40 EQU 5F40h
_G_05E7A EQU 5E7Ah
_G_06B94 EQU 6B94h
_G_06B92 EQU 6B92h
_G_06B90 EQU 6B90h
_G_06B8E EQU 6B8Eh
_G_05E78 EQU 5E78h
_G_05E76 EQU 5E76h
_grp_0cb3fcb5 PROC NEAR
        mov al,byte ptr ds:[_G_05E7E]
        xor al,byte ptr ds:[_G_05E7F]
        je short state_matches
        mov al,byte ptr ds:[_G_05E7E]
        mov byte ptr ds:[_G_05E7F],al
        cmp al,1
        je short draw_setup
        jmp short call_refresh
        nop
state_matches:
        cmp byte ptr ds:[_G_05E7E],1
        je short draw_gate
        cmp word ptr ds:[_G_05EE6],0
        jne short decrement_remaining
ret_early:
        ret
decrement_remaining:
        mov ax,word ptr ds:[_G_09BBC]
        sub word ptr ds:[_G_05EE6],ax
        jg short draw_gate
        mov word ptr ds:[_G_05EE6],0
call_refresh:
        call _FN_CIRCUIT_EGA_05641
        push word ptr ds:[_G_06B88]
        push word ptr ds:[_G_06B86]
        call _FN_CIRCUIT_EGA_0B1B6
        add sp,4
        ret
draw_gate:
        cmp byte ptr ds:[_G_05EEA],1
        jne short ret_early
draw_setup:
        mov byte ptr ds:[_G_05EEA],0
        push cs
        push word ptr ds:[_G_05E72]
        call _FN_CIRCUIT_EGA_08CD8
        add sp,4
        xor ax,ax
        push ax
        push ax
        push word ptr ds:[_G_06B8C]
        push word ptr ds:[_G_06B8A]
        call _FN_CIRCUIT_EGA_0B184
        add sp,8
        mov ax,word ptr ds:[_G_05F42]
        sub ax,word ptr ds:[_G_05E7C]
        push ax
        mov ax,word ptr ds:[_G_05F40]
        sub ax,word ptr ds:[_G_05E7A]
        push ax
        push word ptr ds:[_G_06B94]
        push word ptr ds:[_G_06B92]
        call _FN_CIRCUIT_EGA_08CF6
        add sp,4
        push word ptr ds:[_G_06B90]
        push word ptr ds:[_G_06B8E]
        call _FN_CIRCUIT_EGA_0BB7A
        add sp,8
        call _FN_CIRCUIT_EGA_05641
        push word ptr ds:[_G_05E7C]
        push word ptr ds:[_G_05E7A]
        push word ptr ds:[_G_05E78]
        push word ptr ds:[_G_05E76]
        call _FN_CIRCUIT_EGA_0B184
        add sp,8
        ret
_grp_0cb3fcb5 ENDP
_TEXT ENDS
END
