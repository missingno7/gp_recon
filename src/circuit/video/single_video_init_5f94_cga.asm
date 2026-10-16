ROMSEG SEGMENT AT 0db4h
        ORG 35eh
ROMCALL LABEL FAR
ROMSEG ENDS

_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_054F7:NEAR
        EXTRN _FN_CIRCUIT_CGA_05E1B:NEAR
        EXTRN _FN_CIRCUIT_CGA_066A8:NEAR
        EXTRN _FN_CIRCUIT_CGA_097F0:NEAR
        EXTRN _FN_CIRCUIT_CGA_0A05A:NEAR
        EXTRN _FN_CIRCUIT_CGA_0B418:NEAR
        EXTRN _GRP_389C6FA6:NEAR
        EXTRN _GRP_B9D4E504:NEAR
        PUBLIC _single_video_init_5f94
_single_video_init_5f94 PROC NEAR
        mov byte ptr ds:[5e3ah], 0ffh
        push word ptr ds:[66ah]
        mov ax, word ptr ds:[0b60h]
        mov word ptr ds:[66ah], ax
        call far ptr ROMCALL
        mov ax, 16h
        mov word ptr cs:[0a84ch], ax
        mov word ptr ds:[5e22h], ax
        mov ax, 0
        mov word ptr cs:[0a84ah], ax
        mov word ptr ds:[5e28h], 70h
        mov word ptr cs:[0a848h], 1ch
        mov word ptr cs:[0a846h], 0
        mov word ptr ds:[5e24h], 0bh
        mov word ptr ds:[5e2ah], 0eh
        push cs
        push word ptr ds:[5e3ch]
        call _FN_CIRCUIT_CGA_0B418
        add sp, 4
        call _GRP_389C6FA6
        call _GRP_B9D4E504
        call _FN_CIRCUIT_CGA_05E1B
        push ds
        mov bx, word ptr ds:[5e40h]
        mov ds, word ptr ds:[5e42h]
        mov ax, word ptr ds:[0]
        mov ax, word ptr ds:[2]
        mov ax, word ptr ds:[8]
        mov ax, word ptr ds:[0ah]
        pop ds
        push word ptr ds:[6b7ch]
        push word ptr ds:[6b7ah]
        call _FN_CIRCUIT_CGA_066A8
        push word ptr ds:[6b84h]
        push word ptr ds:[6b82h]
        call _FN_CIRCUIT_CGA_0A05A
        push word ptr ds:[6b80h]
        push word ptr ds:[6b7eh]
        call _FN_CIRCUIT_CGA_066A8
        push word ptr ds:[6b88h]
        push word ptr ds:[6b86h]
        call _FN_CIRCUIT_CGA_0A05A
        add sp, 10h
        call _FN_CIRCUIT_CGA_054F7
        mov word ptr cs:[0a848h], 10h
        mov word ptr cs:[0a84ch], 87h
        push word ptr ds:[0a14h]
        push word ptr ds:[0a10h]
        push word ptr ds:[5e42h]
        push word ptr ds:[5e40h]
        call _FN_CIRCUIT_CGA_097F0
        add sp, 8
        mov word ptr cs:[0a848h], 50h
        mov word ptr cs:[0a846h], 40h
        push word ptr ds:[0a14h]
        push word ptr ds:[0a12h]
        push word ptr ds:[5e42h]
        push word ptr ds:[5e40h]
        call _FN_CIRCUIT_CGA_097F0
        add sp, 8
        mov ax, word ptr ds:[66ah]
        mov word ptr ds:[0b60h], ax
        pop word ptr ds:[66ah]
        mov byte ptr ds:[5e3ah], 0
        ret
_single_video_init_5f94 ENDP
_TEXT ENDS
END
