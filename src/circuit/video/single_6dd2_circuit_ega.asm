_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_6dd2
EXTRN _GRP_AACE91DA:NEAR
_grp_6dd2 PROC NEAR
        push bp
        mov bp, sp
        sub sp, 2
        push si
        mov word ptr [bp - 2], 0
        jmp short L_6DEC
L_6DE0:
        mov bx, word ptr [bp - 2]
        mov si, word ptr [bp + 4]
        mov byte ptr [bx + si], 20h
        inc word ptr [bp - 2]
L_6DEC:
        mov ax, word ptr [bp + 6]
        cmp word ptr [bp - 2], ax
        jl short L_6DE0
        push word ptr [bp + 0eh]
        push word ptr [bp + 0ch]
        push word ptr [bp + 0ah]
        push word ptr [bp + 8]
        push ax
        push word ptr [bp + 4]
        call _GRP_AACE91DA
        add sp, 0ch
        pop si
        mov sp, bp
        pop bp
        ret
_grp_6dd2 ENDP
_TEXT ENDS
END
