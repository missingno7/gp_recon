.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
ROW_COPY_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:ROW_COPY_TEXT, DS:DGROUP
        EXTRN _G_4802:WORD, _G_480A:WORD, _G_39A4:WORD
        PUBLIC _grp_9d44a3bf
_grp_9d44a3bf PROC FAR
        push bp
        mov bp, sp
        push ds
        push si
        push di
        sub sp, 8
        mov ds, word ptr [bp+08h]
        mov si, word ptr [bp+06h]
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
        jne short odd_alignment
        mov dx, word ptr [si+2]
        add si, 10h
copy_rows:
        mov di, word ptr cs:[bx]
        add di, word ptr [bp-8]
        mov cx, word ptr [bp-0Ch]
        rep movsb
        inc bx
        inc bx
        dec dx
        jg short copy_rows
        add sp, 8
        pop di
        pop si
        pop ds
        pop bp
        retf
odd_alignment:
        mov ax, word ptr [si+2]
        mov word ptr [bp-0Eh], ax
        add si, 10h
        and di, 3
        shl di, 1
        jmp word ptr cs:[di+_G_39A4]
_grp_9d44a3bf ENDP
ROW_COPY_TEXT ENDS
        END
