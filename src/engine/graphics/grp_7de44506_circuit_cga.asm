.8086
_VIDEO_DATA SEGMENT WORD PUBLIC 'DATA'
_VIDEO_DATA ENDS
CIRCUIT_VIDEO_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CIRCUIT_VIDEO_TEXT
        EXTRN _G_A83C:WORD, _G_A844:WORD, _G_7286:BYTE, _G_7292:BYTE
        PUBLIC _grp_7de44506
_grp_7de44506 PROC NEAR
        push bp
        mov bp, sp
        push ds
        push si
        push di
        sub sp, 12h
        mov ds, word ptr [bp+06h]
        mov si, word ptr [bp+04h]
        mov es, word ptr cs:[_G_A83C]
        mov ax, word ptr [si+8]
        sar ax, 1
        sar ax, 1
        mov word ptr [bp-14h], ax
        mov ax, word ptr [si]
        mov word ptr [bp-16h], ax
        mov bx, 0Bh
        mul bl
        mov word ptr [bp-0Ah], ax
        mov ax, word ptr [si+0Ah]
        shl ax, 1
        add ax, word ptr cs:[_G_A844]
        mov word ptr [bp-0Eh], ax
        add ax, word ptr [si+2]
        add ax, word ptr [si+2]
        mov word ptr [bp-10h], ax
        add si, 10h
        mov word ptr [bp-12h], si
        mov bx, word ptr [bp+08h]
        mov word ptr [bp-18h], 0Bh
circuit_cga_column_loop:
        mov di, word ptr [bp-18h]
        mov dl, byte ptr cs:[di+_G_7286]
        xor dh, dh
        mov ax, word ptr [bp-16h]
        mul dl
        mov word ptr [bp-8], ax
        shl dx, 1
        add dx, word ptr [bp-0Eh]
        mov word ptr [bp-0Ch], dx
circuit_cga_row_loop:
        mov si, word ptr [bp-12h]
        add si, word ptr [bp-8]
circuit_cga_row_process:
        mov di, word ptr [bp-0Ch]
        cmp di, word ptr [bp-10h]
        jae short circuit_cga_end_column
        mov di, word ptr cs:[di]
        add di, word ptr [bp-14h]
        mov cx, word ptr [bp-16h]
        and bx, 3
        mov ah, byte ptr cs:[bx+_G_7292]
circuit_cga_pixel_loop:
        lodsb
        and al, ah
        not ah
        mov dl, byte ptr es:[di]
        and dl, ah
        or al, dl
        mov byte ptr es:[di], al
        stosb
        not ah
        ror ah, 1
        loop short circuit_cga_pixel_loop
        inc bx
        add word ptr [bp-0Ch], 18h
        add si, word ptr [bp-0Ah]
        jmp short circuit_cga_row_process
circuit_cga_end_column:
        dec word ptr [bp-18h]
        jge short circuit_cga_column_loop
        add sp, 12h
        pop di
        pop si
        pop ds
        pop bp
        ret
_grp_7de44506 ENDP
CIRCUIT_VIDEO_TEXT ENDS
        END
