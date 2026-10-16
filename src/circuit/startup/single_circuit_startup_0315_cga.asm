_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA

_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_07786:NEAR
        EXTRN _FN_CIRCUIT_CGA_078DE:NEAR
        EXTRN _FN_CIRCUIT_CGA_0AA10:NEAR
        EXTRN _FN_CIRCUIT_CGA_0AB78:NEAR
        EXTRN _FN_CIRCUIT_CGA_0B418:NEAR
        EXTRN _GRP_9D44A3BF:NEAR
        EXTRN _GRP_E4004F71:NEAR
        PUBLIC _single_circuit_startup_0315
_single_circuit_startup_0315 PROC NEAR
        mov ax, 0fh
        push ax
        mov ax, 23h
        push ax
        mov ax, 50h
        push ax
        call _FN_CIRCUIT_CGA_0AB78
        add sp, 6
        mov word ptr ds:[5e32h], ax
        mov word ptr ds:[5e34h], dx
        mov bx, ax
        mov ax, word ptr cs:[bx+2]
        mov cx, word ptr cs:[bx]
        mov word ptr ds:[5e36h], cx
        mov word ptr ds:[5e38h], ax
        push ds
        mov ds, word ptr ds:[5e38h]
        mov word ptr ds:[8], 0f0h
        pop ds
        mov ax, 0fh
        push ax
        mov ax, 2bh
        push ax
        mov ax, 70h
        push ax
        call _FN_CIRCUIT_CGA_0AB78
        add sp, 6
        mov word ptr ds:[5e3ch], ax
        mov word ptr ds:[5e3eh], dx
        mov bx, ax
        mov ax, word ptr cs:[bx+2]
        mov cx, word ptr cs:[bx]
        mov dx, word ptr cs:[bx+0ah]
        mov word ptr ds:[5e40h], cx
        mov word ptr ds:[5e42h], ax
        mov word ptr ds:[5e44h], dx
        mov ax, 0
        push ax
        mov ax, 73h
        push ax
        mov ax, 140h
        push ax
        call _FN_CIRCUIT_CGA_0AB78
        add sp, 6
        mov word ptr ds:[5e4ch], ax
        mov word ptr ds:[5e4eh], dx
        mov bx, ax
        mov ax, word ptr cs:[bx+2]
        mov cx, word ptr cs:[bx]
        mov dx, word ptr cs:[bx+0ah]
        mov word ptr ds:[5e50h], cx
        mov word ptr ds:[5e52h], ax
        mov word ptr ds:[5e54h], dx
        mov bx, 6160h
        push bx
        mov bx, 5fc6h
        push bx
        push word ptr ds:[967ah]
        push word ptr ds:[9678h]
        call _GRP_E4004F71
        add sp, 8
        mov bx, 68c0h
        push bx
        mov bx, 647eh
        push bx
        push word ptr ds:[9682h]
        push word ptr ds:[9680h]
        call _GRP_E4004F71
        add sp, 8
        mov bx, 6740h
        push bx
        mov bx, 62fch
        push bx
        push word ptr ds:[967eh]
        push word ptr ds:[967ch]
        call _GRP_E4004F71
        add sp, 8
        mov bx, 6bb8h
        push bx
        mov bx, 6b92h
        push bx
        push word ptr ds:[96a4h]
        push word ptr ds:[96a2h]
        call _GRP_E4004F71
        add sp, 8
        mov bx, 6b62h
        push bx
        mov bx, 6b30h
        push bx
        push word ptr ds:[98dah]
        push word ptr ds:[98d8h]
        call _GRP_E4004F71
        add sp, 8
        mov bx, word ptr ds:[6b66h]
        mov ax, word ptr ds:[6b68h]
        mov es, ax
        mov ax, word ptr es:[bx+8]
        mov word ptr ds:[5e6ah], ax
        mov ax, word ptr es:[bx+0ah]
        mov word ptr ds:[5e6ch], ax
        mov si, word ptr es:[bx+2]
        mov di, word ptr es:[bx]
        mov dx, seg _DATA
        mov es, dx
        mov ax, 0fh
        push ax
        shl di, 1
        shl di, 1
        push si
        push di
        call _FN_CIRCUIT_CGA_0AB78
        add sp, 6
        mov word ptr ds:[5e62h], ax
        mov word ptr ds:[5e64h], dx
        mov ds, dx
        mov bx, ax
        mov ax, word ptr [bx+2]
        mov cx, word ptr [bx]
        mov dx, seg _DATA
        mov ds, dx
        mov word ptr ds:[5e66h], cx
        mov word ptr ds:[5e68h], ax
        mov bx, word ptr ds:[62ech]
        mov ax, word ptr ds:[62eeh]
        mov es, ax
        mov ax, word ptr es:[bx+8]
        mov word ptr ds:[5e5eh], ax
        mov ax, word ptr es:[bx+0ah]
        mov word ptr ds:[5e60h], ax
        mov si, word ptr es:[bx+2]
        mov di, word ptr es:[bx]
        mov dx, seg _DATA
        mov es, dx
        mov ax, 0fh
        push ax
        shl di, 1
        shl di, 1
        push si
        push di
        call _FN_CIRCUIT_CGA_0AB78
        add sp, 6
        mov word ptr ds:[5e56h], ax
        mov word ptr ds:[5e58h], dx
        mov ds, dx
        mov bx, ax
        mov ax, word ptr [bx+2]
        mov cx, word ptr [bx]
        mov dx, seg _DATA
        mov ds, dx
        mov word ptr ds:[5e5ah], cx
        mov word ptr ds:[5e5ch], ax
        mov bx, word ptr ds:[6b6eh]
        mov ax, word ptr ds:[6b70h]
        mov ds, ax
        mov ax, word ptr [bx+8]
        mov cx, word ptr [bx+0ah]
        mov si, word ptr [bx+2]
        mov di, word ptr [bx]
        mov dx, seg _DATA
        mov ds, dx
        mov word ptr ds:[5e76h], ax
        mov word ptr ds:[5e78h], cx
        mov ax, 0fh
        push ax
        shl di, 1
        shl di, 1
        push si
        push di
        call _FN_CIRCUIT_CGA_0AB78
        add sp, 6
        mov word ptr ds:[5e6eh], ax
        mov word ptr ds:[5e70h], dx
        mov ds, dx
        mov bx, ax
        mov ax, word ptr [bx+2]
        mov cx, word ptr [bx]
        mov dx, seg _DATA
        mov ds, dx
        mov word ptr ds:[5e72h], cx
        mov word ptr ds:[5e74h], ax
        push word ptr ds:[5e34h]
        push word ptr ds:[5e32h]
        call _FN_CIRCUIT_CGA_0B418
        add sp, 4
        push word ptr ds:[62a6h]
        push word ptr ds:[62a4h]
        call _GRP_9D44A3BF
        add sp, 4
        call _FN_CIRCUIT_CGA_07786
        push ds
        mov ax, 5f91h
        push ax
        call _FN_CIRCUIT_CGA_0AA10
        add sp, 4
        mov al, 0ah
        cbw
        mov word ptr ds:[5ee4h], ax
        mov word ptr ds:[5ee2h], ax
        mov ax, 4c3fh
        push ax
        call _FN_CIRCUIT_CGA_078DE
        add sp, 2
        ret
_single_circuit_startup_0315 ENDP
_TEXT ENDS
END
