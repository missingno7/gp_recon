.8086
PAINT_CLIP_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:PAINT_CLIP_TEXT
        EXTRN _G_480C:WORD, _G_480E:WORD, _G_4810:WORD, _G_4812:WORD, _G_4802:WORD
        EXTRN _G_2EB4:WORD
        ORG 2E35h
fail_tail:
        ORG 2E38h
        PUBLIC _grp_ff77c76f
_grp_ff77c76f PROC FAR
        push bp
        mov bp, sp
        push si
        push di
        sub sp, 0Ch
        cld
        cmp word ptr [bp+0Ah], 0
        jle short fail_tail
        cmp word ptr [bp+0Ch], 0
        jle short fail_tail
        mov es, word ptr cs:[_G_4802]
        xor cx, cx
        mov dx, word ptr [bp+6]
        mov bx, dx
        sar dx, 1
        sar dx, 1
        mov word ptr [bp-10h], dx
        and bx, 3
        je short left_aligned
        or cx, 8
        mov ax, word ptr [bp+0Eh]
        mov dl, byte ptr [bx-634Eh]
        and al, dl
        and ah, dl
        not dl
        mov byte ptr [bp-5], dl
        mov word ptr [bp-8], ax
left_aligned:
        mov dx, word ptr [bp+6]
        add dx, word ptr [bp+0Ah]
        mov bx, dx
        sar dx, 1
        sar dx, 1
        sub dx, word ptr [bp-10h]
        je short bottom_aligned
        or cx, 4
        mov word ptr [bp-0Ch], dx
bottom_aligned:
        and bx, 3
        je short right_aligned
        or cx, 2
        mov dl, byte ptr [bx-634Ah]
        mov ax, word ptr [bp+0Eh]
        and al, dl
        and ah, dl
        not dl
        mov byte ptr [bp-6], dl
        mov word ptr [bp-0Ah], ax
right_aligned:
        mov bx, cx
        jmp word ptr cs:[bx+_G_2EB4]
_grp_ff77c76f ENDP
PAINT_CLIP_TEXT ENDS
        END
