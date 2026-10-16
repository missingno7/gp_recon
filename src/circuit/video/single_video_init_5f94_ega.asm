ROMSEG SEGMENT AT 0ffch
        ORG 360h
ROMCALL LABEL FAR
ROMSEG ENDS

_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_04C0A:NEAR
        EXTRN _FN_CIRCUIT_EGA_05641:NEAR
        EXTRN _FN_CIRCUIT_EGA_05F4B:NEAR
        EXTRN _FN_CIRCUIT_EGA_08CD8:NEAR
        EXTRN _FN_CIRCUIT_EGA_08D2A:NEAR
        EXTRN _FN_CIRCUIT_EGA_0A6AA:NEAR
        EXTRN _FN_CIRCUIT_EGA_0BBAE:NEAR
        EXTRN _GRP_389C6FA6:NEAR
        EXTRN _GRP_B9D4E504:NEAR
        PUBLIC _single_video_init_5f94
_single_video_init_5f94 PROC NEAR
        mov byte ptr ds:[5e3eh], 0ffh
        push word ptr ds:[66ah]
        mov ax, word ptr ds:[0b64h]
        mov word ptr ds:[66ah], ax
        call far ptr ROMCALL
        mov ax, 16h
        mov word ptr cs:[0c7cch], ax
        mov word ptr ds:[5e26h], ax
        mov ax, 0
        mov word ptr cs:[0c7cah], ax
        mov word ptr ds:[5e2ch], 70h
        mov word ptr cs:[0c7c8h], 0eh
        mov word ptr cs:[0c7c6h], 0
        mov word ptr ds:[5e28h], 0bh
        mov word ptr ds:[5e2eh], 7
        push cs
        push word ptr ds:[5e40h]
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        mov ax, word ptr cs:[0c7bch]
        mov word ptr ds:[6c10h], ax
        mov ax, word ptr cs:[0c7beh]
        mov word ptr ds:[6c12h], ax
        mov ax, word ptr cs:[0c7c0h]
        mov word ptr ds:[6c14h], ax
        mov ax, word ptr cs:[0c7c2h]
        mov word ptr ds:[6c16h], ax
        call _GRP_389C6FA6
        mov bx, 0ch
        shl bx, 1
        add bx, word ptr ds:[5e48h]
        mov cx, 46h
        call _FN_CIRCUIT_EGA_04C0A
        call _GRP_B9D4E504
        call _FN_CIRCUIT_EGA_05F4B
        push ds
        mov bx, word ptr ds:[5e44h]
        mov ds, word ptr ds:[5e46h]
        mov ax, word ptr ds:[0]
        mov ax, word ptr ds:[2]
        mov ax, word ptr ds:[8]
        mov ax, word ptr ds:[0ah]
        pop ds
        push word ptr ds:[6b98h]
        push word ptr ds:[6b96h]
        call _FN_CIRCUIT_EGA_08D2A
        push word ptr ds:[6ba0h]
        push word ptr ds:[6b9eh]
        call _FN_CIRCUIT_EGA_0BBAE
        push word ptr ds:[6b9ch]
        push word ptr ds:[6b9ah]
        call _FN_CIRCUIT_EGA_08D2A
        push word ptr ds:[6ba4h]
        push word ptr ds:[6ba2h]
        call _FN_CIRCUIT_EGA_0BBAE
        add sp, 10h
        call _FN_CIRCUIT_EGA_05641
        mov word ptr cs:[0c7c8h], 8
        mov word ptr cs:[0c7cch], 87h
        push word ptr ds:[0a18h]
        push word ptr ds:[0a14h]
        push word ptr ds:[5e46h]
        push word ptr ds:[5e44h]
        call _FN_CIRCUIT_EGA_0A6AA
        add sp, 8
        mov word ptr cs:[0c7c8h], 28h
        mov word ptr cs:[0c7c6h], 20h
        push word ptr ds:[0a18h]
        push word ptr ds:[0a16h]
        push word ptr ds:[5e46h]
        push word ptr ds:[5e44h]
        call _FN_CIRCUIT_EGA_0A6AA
        add sp, 8
        mov ax, word ptr ds:[66ah]
        mov word ptr ds:[0b64h], ax
        pop word ptr ds:[66ah]
        mov byte ptr ds:[5e3eh], 0
        ret
_single_video_init_5f94 ENDP
_TEXT ENDS
END
