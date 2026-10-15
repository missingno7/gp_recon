.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
CLIP_ADJUST_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CLIP_ADJUST_TEXT, DS:DGROUP
        EXTRN _G_480C:WORD, _G_480E:WORD, _G_4810:WORD, _G_4812:WORD
        EXTRN _grp_ff77c76f:NEAR, _FN_CYCLES_CGA_85BB:NEAR
        PUBLIC _grp_d1938643
_grp_d1938643 PROC NEAR
        push bp
        mov bp, sp
        push si
        push di
        sub sp, 0Ch
        mov dx, word ptr cs:[_G_480C]
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
        mov bx, word ptr cs:[_G_480E]
        shl bx, 1
        shl bx, 1
        sub ax, bx
        jle short clip_height
        sub word ptr [bp+0Ah], ax
        jle short clip_error
clip_height:
        mov ax, word ptr cs:[_G_4810]
        sub ax, word ptr [bp+08h]
        jle short clip_yend
        mov bx, word ptr cs:[_G_4810]
        mov word ptr [bp+08h], bx
        sub word ptr [bp+0Ch], ax
        jle short clip_error
clip_yend:
        mov ax, word ptr [bp+08h]
        add ax, word ptr [bp+0Ch]
        sub ax, word ptr cs:[_G_4812]
        jle short _grp_ff77c76f+8
        sub word ptr [bp+0Ch], ax
        jle short clip_error
clip_tail:
        jmp short _grp_ff77c76f+8
        nop
clip_error:
        jmp near ptr _FN_CYCLES_CGA_85BB
_grp_d1938643 ENDP
CLIP_ADJUST_TEXT ENDS
        END
