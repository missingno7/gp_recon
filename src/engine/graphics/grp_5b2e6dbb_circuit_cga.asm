.8086
OR_FILL_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:OR_FILL_TEXT
        EXTRN _G_480A:WORD, _G_4802:WORD, _G_A312:WORD
        PUBLIC _grp_5b2e6dbb
_grp_5b2e6dbb PROC NEAR
        push bp
        mov bp, sp
        push ds
        push si
        push di
        sub sp, 8
        mov ds, word ptr [bp+6]
        mov si, word ptr [bp+4]
        mov ax, word ptr [si+8]
        and ax, 0FFFCh
        mov word ptr [bp-8], ax
        mov ax, word ptr [si+0Ah]
        mov word ptr [bp-0Ah], ax
        mov bx, word ptr [bp-0Ah]
        shl bx, 1
        add bx, word ptr cs:[_G_480A]
        mov ax, word ptr [si]
        mov word ptr [bp-0Ch], ax
        mov es, word ptr cs:[_G_4802]
        cld
        mov ax, word ptr [bp-8]
        mov di, ax
        sar ax, 1
        sar ax, 1
        mov word ptr [bp-8], ax
        test di, 3
        jne short unaligned
aligned:
        mov dx, word ptr [si+2]
        add si, 10h
copy_row:
        mov di, word ptr cs:[bx]
        add di, word ptr [bp-8]
        mov cx, word ptr [bp-0Ch]
copy_byte:
        lodsb
        rep or byte ptr es:[di], al
        inc di
        loop short copy_byte
        inc bx
        inc bx
        dec dx
        jg short copy_row
        add sp, 8
        pop di
        pop si
        pop ds
        pop bp
        ret
unaligned:
        mov ax, word ptr [si+2]
        mov word ptr [bp-0Eh], ax
        add si, 10h
        and di, 3
        shl di, 1
        jmp word ptr cs:[di+_G_A312]
_grp_5b2e6dbb ENDP
OR_FILL_TEXT ENDS
        END
