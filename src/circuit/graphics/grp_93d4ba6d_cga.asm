_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_0476E:NEAR
        EXTRN _FN_CIRCUIT_CGA_04725:NEAR
        EXTRN _FN_CIRCUIT_CGA_04647:NEAR
        EXTRN _FN_CIRCUIT_CGA_046D7:NEAR
        EXTRN _FN_CIRCUIT_CGA_0440B:NEAR
        EXTRN _FN_CIRCUIT_CGA_04245:NEAR
        EXTRN _FN_CIRCUIT_CGA_0429C:NEAR
        EXTRN _FN_CIRCUIT_CGA_0455D:NEAR
        PUBLIC _grp_93d4ba6d
_grp_93d4ba6d PROC NEAR
        call _FN_CIRCUIT_CGA_0476E
        cmp word ptr ds:[066Ah], 0
        je short init_row
        mov word ptr ds:[066Eh], 4Eh
init_row:
        mov bp, 4Eh
        mov ax, word ptr ds:[5EA2h]
        add ax, 28h
        mov word ptr ds:[7160h], ax
loop_start:
        or bp, bp
        jg short process_row
        mov si, 6Fh
        jmp _FN_CIRCUIT_CGA_0455D
process_row:
        mov si, word ptr [bp+7404h]
        mov word ptr cs:[0A84Ch], si
        mov al, byte ptr [bp+7454h]
        test al, 8
        je short after_flag
        xor dh, dh
        mov dl, byte ptr [bp+5C24h]
        mov di, word ptr [bp+5CB6h]
        shl di, 1
        add di, 6194h
        call _FN_CIRCUIT_CGA_04725
after_flag:
        mov al, byte ptr [bp+7454h]
        cmp al, 4
        jne short after_mode4
        call _FN_CIRCUIT_CGA_04647
        mov ax, 7522h
        mov word ptr ds:[07CEh], ax
        mov si, word ptr [bp+7404h]
        shl si, 1
        mov ah, byte ptr [si+04C0h]
        xor al, al
        call _FN_CIRCUIT_CGA_046D7
after_mode4:
        mov al, byte ptr [bp+74AAh]
        cmp al, 4Dh
        jl short dispatch_done
        cmp bp, word ptr ds:[066Eh]
        je short mode_bp_limit
        cmp al, 4Eh
        je short mode_4e
        jg short mode_bp_limit
        call _FN_CIRCUIT_CGA_0440B
        jmp short dispatch_done
        nop
mode_4e:
        mov si, word ptr [bp+7404h]
        mov dl, byte ptr [si+5C30h]
        shl si, 1
        mov di, word ptr [si+0802h]
        shr si, 1
        call _FN_CIRCUIT_CGA_04245
        jmp short dispatch_done
        nop
mode_bp_limit:
        shl si, 1
        mov di, word ptr [si+0802h]
        shr si, 1
        call _FN_CIRCUIT_CGA_0429C
dispatch_done:
        jmp _FN_CIRCUIT_CGA_0455D
        dec word ptr ds:[7160h]
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
