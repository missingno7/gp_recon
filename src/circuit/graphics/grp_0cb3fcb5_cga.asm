_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_054F7:NEAR
        EXTRN _GRP_9D44A3BF:NEAR
        EXTRN _FN_CIRCUIT_CGA_0B418:NEAR
        EXTRN _FN_CIRCUIT_CGA_09A42:NEAR
        EXTRN _FN_CIRCUIT_CGA_06666:NEAR
        EXTRN _FN_CIRCUIT_CGA_0A018:NEAR
        PUBLIC _grp_0cb3fcb5
_G_05E7E EQU 5E7Ah
_G_05E7F EQU 5E7Bh
_G_05EE6 EQU 5ECAh
_G_09BBC EQU 9B8Ch
_G_05EEA EQU 5ECEh
_G_05E72 EQU 5E6Eh
_G_06B8C EQU 6B70h
_G_06B6C EQU 6B6Ch
_G_06B6A EQU 6B6Ah
_G_06B8A EQU 6B6Eh
_G_05F42 EQU 5F26h
_G_05E7C EQU 5E78h
_G_05F40 EQU 5F24h
_G_05E7A EQU 5E76h
_G_06B94 EQU 6B78h
_G_06B92 EQU 6B76h
_G_06B90 EQU 6B74h
_G_06B8E EQU 6B72h
_G_05E78 EQU 5E74h
_G_05E76 EQU 5E72h
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
        call _FN_CIRCUIT_CGA_054F7
        push word ptr ds:[_G_06B6C]
        push word ptr ds:[_G_06B6A]
        call _GRP_9D44A3BF
        add sp,4
        ret
draw_gate:
        cmp byte ptr ds:[_G_05EEA],1
        jne short ret_early
draw_setup:
        mov byte ptr ds:[_G_05EEA],0
        push cs
        push word ptr ds:[_G_05E72]
        call _FN_CIRCUIT_CGA_0B418
        add sp,4
        xor ax,ax
        push ax
        push ax
        push word ptr ds:[_G_06B8C]
        push word ptr ds:[_G_06B8A]
        call _FN_CIRCUIT_CGA_09A42
        add sp,8
        mov ax,word ptr ds:[_G_05F42]
        sub ax,word ptr ds:[_G_05E7C]
        push ax
        mov ax,word ptr ds:[_G_05F40]
        sub ax,word ptr ds:[_G_05E7A]
        push ax
        push word ptr ds:[_G_06B94]
        push word ptr ds:[_G_06B92]
        call _FN_CIRCUIT_CGA_06666
        add sp,4
        push word ptr ds:[_G_06B90]
        push word ptr ds:[_G_06B8E]
        call _FN_CIRCUIT_CGA_0A018
        add sp,8
        call _FN_CIRCUIT_CGA_054F7
        push word ptr ds:[_G_05E7C]
        push word ptr ds:[_G_05E7A]
        push word ptr ds:[_G_05E78]
        push word ptr ds:[_G_05E76]
        call _FN_CIRCUIT_CGA_09A42
        add sp,8
        ret
_grp_0cb3fcb5 ENDP
_TEXT ENDS
END
