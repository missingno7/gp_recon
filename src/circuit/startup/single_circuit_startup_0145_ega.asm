_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_05641:NEAR
        EXTRN _FN_CIRCUIT_EGA_0564D:NEAR
        EXTRN _FN_CIRCUIT_EGA_0B1B6:NEAR
        EXTRN _GRP_FE15C5CD:NEAR
        PUBLIC _single_circuit_startup_0145
_single_circuit_startup_0145 PROC NEAR
        mov byte ptr ds:[6c0ch], 0
        mov byte ptr ds:[6c0dh], 0
        call _FN_CIRCUIT_EGA_05641
        xor ax, ax
        push ax
        call _GRP_FE15C5CD
        add sp, 2
        push word ptr ds:[6b80h]
        push word ptr ds:[6b7eh]
        call _FN_CIRCUIT_EGA_0B1B6
        add sp, 4
        call _FN_CIRCUIT_EGA_0564D
        ret
_single_circuit_startup_0145 ENDP
_TEXT ENDS
END
