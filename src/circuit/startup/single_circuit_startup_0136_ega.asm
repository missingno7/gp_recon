_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_0016D:NEAR
        EXTRN _FN_CIRCUIT_EGA_00315:NEAR
        EXTRN _FN_CIRCUIT_EGA_05641:NEAR
        EXTRN _FN_CIRCUIT_EGA_0564D:NEAR
        EXTRN _FN_CIRCUIT_EGA_0B1B6:NEAR
        EXTRN _GRP_B84A76B6:NEAR
        EXTRN _GRP_FE15C5CD:NEAR
        PUBLIC _single_circuit_startup_0136
_single_circuit_startup_0136 PROC NEAR
        mov bx, seg _DATA
        mov ds, bx
        cld
        call _FN_CIRCUIT_EGA_0016D
        call _GRP_B84A76B6
        call _FN_CIRCUIT_EGA_00315
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
_single_circuit_startup_0136 ENDP
_TEXT ENDS
END
