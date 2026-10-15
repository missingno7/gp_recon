.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
VIDEO_COPY_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:VIDEO_COPY_TEXT, DS:DGROUP
        EXTRN _G_4824:WORD, _G_480A:WORD, _G_4802:WORD
        PUBLIC _grp_80e7593c
_grp_80e7593c PROC NEAR
        push bp
        mov bp, sp
        sub sp, 6
        push ds
        push si
        push di
        mov ax, word ptr [bp+0Ch]
        shr ax, 1
        shr ax, 1
        mov word ptr [bp-6], ax
        mov bx, word ptr [bp+06h]
        shl bx, 1
        add bx, word ptr cs:[_G_4824]
        mov word ptr [bp-2], bx
        mov bx, word ptr [bp+0Ah]
        shl bx, 1
        add bx, word ptr cs:[_G_480A]
        mov word ptr [bp-4], bx
        mov es, word ptr cs:[_G_4802]
        mov ax, 0B800h
        mov ds, ax
        cld
        mov ax, word ptr [bp+04h]
        sar ax, 1
        sar ax, 1
        mov word ptr [bp+04h], ax
        mov ax, word ptr [bp+08h]
        sar ax, 1
        sar ax, 1
        mov word ptr [bp+08h], ax
        mov dx, word ptr [bp+0Eh]
copy_row:
        mov bx, word ptr [bp-2]
        mov si, word ptr cs:[bx]
        add si, word ptr [bp+04h]
        mov bx, word ptr [bp-4]
        mov di, word ptr cs:[bx]
        add di, word ptr [bp+08h]
        mov cx, word ptr [bp-6]
        rep movsb
        add word ptr [bp-2], 2
        add word ptr [bp-4], 2
        dec dx
        jg short copy_row
        pop di
        pop si
        pop ds
        mov sp, bp
        pop bp
        ret
_grp_80e7593c ENDP
VIDEO_COPY_TEXT ENDS
        END
