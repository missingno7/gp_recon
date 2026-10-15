_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_04764:NEAR
        EXTRN _FN_CIRCUIT_EGA_0471B:NEAR
        EXTRN _FN_CIRCUIT_EGA_0463D:NEAR
        EXTRN _FN_CIRCUIT_EGA_046CD:NEAR
        EXTRN _FN_CIRCUIT_EGA_04401:NEAR
        EXTRN _FN_CIRCUIT_EGA_0423B:NEAR
        EXTRN _FN_CIRCUIT_EGA_04292:NEAR
        EXTRN _FN_CIRCUIT_EGA_04553:NEAR
        PUBLIC _grp_93d4ba6d
_grp_93d4ba6d PROC NEAR
        call _FN_CIRCUIT_EGA_04764
        cmp word ptr ds:[066Ah], 0
        je short init_row
        mov word ptr ds:[066Eh], 4Eh
init_row:
        mov bp, 4Eh
        mov ax, word ptr ds:[5EBEh]
        add ax, 28h
        mov word ptr ds:[7188h], ax
loop_start:
        or bp, bp
        jg short process_row
        mov si, 6Fh
        jmp _FN_CIRCUIT_EGA_04553
process_row:
        mov si, word ptr [bp+742Ch]
        mov word ptr cs:[0C7CCh], si
        mov al, byte ptr [bp+747Ch]
        test al, 8
        je short after_flag
        xor dh, dh
        mov dl, byte ptr [bp+5C28h]
        mov di, word ptr [bp+5CBAh]
        shl di, 1
        add di, 61B0h
        call _FN_CIRCUIT_EGA_0471B
after_flag:
        mov al, byte ptr [bp+747Ch]
        cmp al, 4
        jne short after_mode4
        call _FN_CIRCUIT_EGA_0463D
        mov ax, 754Ah
        mov word ptr ds:[07CEh], ax
        mov si, word ptr [bp+742Ch]
        shl si, 1
        mov ah, byte ptr [si+04C0h]
        xor al, al
        call _FN_CIRCUIT_EGA_046CD
after_mode4:
        mov al, byte ptr [bp+74D2h]
        cmp al, 4Dh
        jl short dispatch_done
        cmp bp, word ptr ds:[066Eh]
        je short mode_bp_limit
        cmp al, 4Eh
        je short mode_4e
        jg short mode_bp_limit
        call _FN_CIRCUIT_EGA_04401
        jmp short dispatch_done
        nop
mode_4e:
        mov si, word ptr [bp+742Ch]
        mov dl, byte ptr [si+5C34h]
        shl si, 1
        mov di, word ptr [si+0802h]
        shr si, 1
        call _FN_CIRCUIT_EGA_0423B
        jmp short dispatch_done
        nop
mode_bp_limit:
        shl si, 1
        mov di, word ptr [si+0802h]
        shr si, 1
        call _FN_CIRCUIT_EGA_04292
dispatch_done:
        jmp _FN_CIRCUIT_EGA_04553
        dec word ptr ds:[7188h]
        dec bp
        dec bp
        cmp bp, -4
        jl short return_now
        jmp loop_start
return_now:
        ret
_grp_93d4ba6d ENDP
_TEXT ENDS
END
