_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA

_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_06EE8:NEAR
        EXTRN _FN_CIRCUIT_EGA_07040:NEAR
        EXTRN _FN_CIRCUIT_EGA_08B70:NEAR
        EXTRN _FN_CIRCUIT_EGA_08CD8:NEAR
        EXTRN _FN_CIRCUIT_EGA_0B1B6:NEAR
        EXTRN _FN_CIRCUIT_EGA_0C97E:NEAR
        EXTRN _GRP_E4004F71:NEAR
        PUBLIC _single_circuit_startup_0315
_single_circuit_startup_0315 PROC NEAR
        mov ax, 0fh
        push ax
        mov ax, 23h
        push ax
        mov ax, 50h
        push ax
        call _FN_CIRCUIT_EGA_0C97E
        add sp, 6
        mov word ptr ds:[5e36h], ax
        mov word ptr ds:[5e38h], dx
        mov bx, ax
        mov ax, word ptr cs:[bx+2]
        mov cx, word ptr cs:[bx]
        mov word ptr ds:[5e3ah], cx
        mov word ptr ds:[5e3ch], ax
        push ds
        mov ds, word ptr ds:[5e3ch]
        mov word ptr ds:[8], 0f0h
        pop ds
        mov ax, 0fh
        push ax
        mov ax, 2bh
        push ax
        mov ax, 70h
        push ax
        call _FN_CIRCUIT_EGA_0C97E
        add sp, 6
        mov word ptr ds:[5e40h], ax
        mov word ptr ds:[5e42h], dx
        mov bx, ax
        mov ax, word ptr cs:[bx+2]
        mov cx, word ptr cs:[bx]
        mov dx, word ptr cs:[bx+0ah]
        mov word ptr ds:[5e44h], cx
        mov word ptr ds:[5e46h], ax
        mov word ptr ds:[5e48h], dx
        mov ax, 0fh
        push ax
        mov ax, 73h
        push ax
        mov ax, 140h
        push ax
        call _FN_CIRCUIT_EGA_0C97E
        add sp, 6
        mov word ptr ds:[5e50h], ax
        mov word ptr ds:[5e52h], dx
        mov bx, ax
        mov ax, word ptr cs:[bx+2]
        mov cx, word ptr cs:[bx]
        mov dx, word ptr cs:[bx+0ah]
        mov word ptr ds:[5e54h], cx
        mov word ptr ds:[5e56h], ax
        mov word ptr ds:[5e58h], dx
        mov bx, 617ch
        push bx
        mov bx, 5fe2h
        push bx
        push word ptr ds:[96aah]
        push word ptr ds:[96a8h]
        call _GRP_E4004F71
        add sp, 8
        mov bx, 68dch
        push bx
        mov bx, 649ah
        push bx
        push word ptr ds:[96b2h]
        push word ptr ds:[96b0h]
        call _GRP_E4004F71
        add sp, 8
        mov bx, 675ch
        push bx
        mov bx, 6318h
        push bx
        push word ptr ds:[96aeh]
        push word ptr ds:[96ach]
        call _GRP_E4004F71
        add sp, 8
        mov bx, 6bd4h
        push bx
        mov bx, 6baeh
        push bx
        push word ptr ds:[96d4h]
        push word ptr ds:[96d2h]
        call _GRP_E4004F71
        add sp, 8
        mov bx, 6b7eh
        push bx
        mov bx, 6b4ch
        push bx
        push word ptr ds:[990ah]
        push word ptr ds:[9908h]
        call _GRP_E4004F71
        add sp, 8
        mov bx, word ptr ds:[6b82h]
        mov ax, word ptr ds:[6b84h]
        mov es, ax
        mov ax, word ptr es:[bx+8]
        mov word ptr ds:[5e6eh], ax
        mov ax, word ptr es:[bx+0ah]
        mov word ptr ds:[5e70h], ax
        mov si, word ptr es:[bx+2]
        mov di, word ptr es:[bx]
        mov dx, seg _DATA
        mov es, dx
        mov ax, 0fh
        push ax
        shl di, 1
        shl di, 1
        shl di, 1
        push si
        push di
        call _FN_CIRCUIT_EGA_0C97E
        add sp, 6
        mov word ptr ds:[5e66h], ax
        mov word ptr ds:[5e68h], dx
        mov ds, dx
        mov bx, ax
        mov ax, word ptr [bx+2]
        mov cx, word ptr [bx]
        mov dx, seg _DATA
        mov ds, dx
        mov word ptr ds:[5e6ah], cx
        mov word ptr ds:[5e6ch], ax
        mov bx, word ptr ds:[6308h]
        mov ax, word ptr ds:[630ah]
        mov es, ax
        mov ax, word ptr es:[bx+8]
        mov word ptr ds:[5e62h], ax
        mov ax, word ptr es:[bx+0ah]
        mov word ptr ds:[5e64h], ax
        mov si, word ptr es:[bx+2]
        mov di, word ptr es:[bx]
        mov dx, seg _DATA
        mov es, dx
        mov ax, 0fh
        push ax
        shl di, 1
        shl di, 1
        shl di, 1
        push si
        push di
        call _FN_CIRCUIT_EGA_0C97E
        add sp, 6
        mov word ptr ds:[5e5ah], ax
        mov word ptr ds:[5e5ch], dx
        mov ds, dx
        mov bx, ax
        mov ax, word ptr [bx+2]
        mov cx, word ptr [bx]
        mov dx, seg _DATA
        mov ds, dx
        mov word ptr ds:[5e5eh], cx
        mov word ptr ds:[5e60h], ax
        mov bx, word ptr ds:[6b8ah]
        mov ax, word ptr ds:[6b8ch]
        mov ds, ax
        mov ax, word ptr [bx+8]
        mov cx, word ptr [bx+0ah]
        mov si, word ptr [bx+2]
        mov di, word ptr [bx]
        mov dx, seg _DATA
        mov ds, dx
        mov word ptr ds:[5e7ah], ax
        mov word ptr ds:[5e7ch], cx
        mov ax, 0fh
        push ax
        shl di, 1
        shl di, 1
        shl di, 1
        push si
        push di
        call _FN_CIRCUIT_EGA_0C97E
        add sp, 6
        mov word ptr ds:[5e72h], ax
        mov word ptr ds:[5e74h], dx
        mov ds, dx
        mov bx, ax
        mov ax, word ptr [bx+2]
        mov cx, word ptr [bx]
        mov dx, seg _DATA
        mov ds, dx
        mov word ptr ds:[5e76h], cx
        mov word ptr ds:[5e78h], ax
        push word ptr ds:[5e38h]
        push word ptr ds:[5e36h]
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        push word ptr ds:[62c2h]
        push word ptr ds:[62c0h]
        call _FN_CIRCUIT_EGA_0B1B6
        add sp, 4
        call _FN_CIRCUIT_EGA_06EE8
        push ds
        mov ax, 5fadh
        push ax
        call _FN_CIRCUIT_EGA_08B70
        add sp, 4
        mov al, 0ah
        cbw
        mov word ptr ds:[5f00h], ax
        mov word ptr ds:[5efeh], ax
        mov ax, 4d89h
        push ax
        call _FN_CIRCUIT_EGA_07040
        add sp, 2
        ret
_single_circuit_startup_0315 ENDP
_TEXT ENDS
END
