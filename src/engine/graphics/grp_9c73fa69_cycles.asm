.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
CLIP3_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CLIP3_TEXT, DS:DGROUP
        EXTRN _G_4E96:WORD, _G_4E98:WORD, _G_4E9A:WORD, _G_4E9C:WORD
        EXTRN _grp_58166242:NEAR
        PUBLIC _grp_9c73fa69
_grp_9c73fa69 PROC NEAR
        push bp
        mov bp, sp
        push si
        push di
        sub sp, 8
        mov dx, word ptr cs:[_G_4E96]
        shl dx, 1
        shl dx, 1
        shl dx, 1
        mov ax, dx
        sub ax, word ptr [bp+06h]
        jle short clip_width
        mov word ptr [bp+06h], dx
        sub word ptr [bp+0Ah], ax
        jle short clip_error
clip_width:
        mov ax, word ptr [bp+06h]
        add ax, word ptr [bp+0Ah]
        mov bx, word ptr cs:[_G_4E98]
        shl bx, 1
        shl bx, 1
        shl bx, 1
        sub ax, bx
        jle short clip_height
        sub word ptr [bp+0Ah], ax
        jle short clip_error
clip_height:
        mov ax, word ptr cs:[_G_4E9A]
        sub ax, word ptr [bp+08h]
        jle short clip_yend
        mov bx, word ptr cs:[_G_4E9A]
        mov word ptr [bp+08h], bx
        sub word ptr [bp+0Ch], ax
        jle short clip_error
clip_yend:
        mov ax, word ptr [bp+08h]
        add ax, word ptr [bp+0Ch]
        sub ax, word ptr cs:[_G_4E9C]
        jle short _grp_58166242+8
        sub word ptr [bp+0Ch], ax
        jle short clip_error
        jmp short _grp_58166242+8
        nop
clip_error:
        jmp near ptr _grp_58166242+0A9h
_grp_9c73fa69 ENDP
CLIP3_TEXT ENDS
        END
