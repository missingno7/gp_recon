.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
SEEK_FILE_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:SEEK_FILE_TEXT, DS:DGROUP
        EXTRN _G_A5B8:WORD, _G_A5BA:BYTE
        EXTRN _FN_CYCLES_EGA_04105:NEAR
        PUBLIC _grp_1a9a5e95
_grp_1a9a5e95 PROC NEAR
        push bp
        mov bp, sp
        sub sp, 4
        mov bx, word ptr [bp+06h]
        cmp bx, word ptr DGROUP:[_G_A5B8]
        jb short valid_handle
        mov ax, 900h
        jmp short set_carry
valid_handle:
        test word ptr [bp+0Ah], 8000h
        je short do_seek
        cmp word ptr [bp+0Ch], 0
        je short set_error_1600
        xor cx, cx
        mov dx, cx
        mov ax, 4201h
        int 21h
        jb short tail_jump
        test word ptr [bp+0Ch], 2
        jne short seek_end
        add ax, word ptr [bp+08h]
        adc dx, word ptr [bp+0Ah]
        jns short do_seek
set_error_1600:
        mov ax, 1600h
set_carry:
        stc
        jmp short tail_jump
seek_end:
        mov word ptr [bp-2], dx
        mov word ptr [bp-4], ax
        mov dx, cx
        mov ax, 4202h
        int 21h
        add ax, word ptr [bp+08h]
        adc dx, word ptr [bp+0Ah]
        jns short do_seek
        mov cx, word ptr [bp-2]
        mov dx, word ptr [bp-4]
        mov ax, 4200h
        int 21h
        jmp short set_error_1600
do_seek:
        mov dx, word ptr [bp+08h]
        mov cx, word ptr [bp+0Ah]
        mov al, byte ptr [bp+0Ch]
        mov ah, 42h
        int 21h
        jb short tail_jump
        and byte ptr DGROUP:[bx+_G_A5BA], 0FDh
tail_jump:
        jmp near ptr _FN_CYCLES_EGA_04105
_grp_1a9a5e95 ENDP
SEEK_FILE_TEXT ENDS
        END
