_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_0016A:NEAR
        EXTRN _FN_CIRCUIT_CGA_00312:NEAR
        EXTRN _FN_CIRCUIT_CGA_054F7:NEAR
        EXTRN _FN_CIRCUIT_CGA_06B72:NEAR
        EXTRN _GRP_9D44A3BF:NEAR
        EXTRN _GRP_B84A76B6:NEAR
        PUBLIC _single_circuit_startup_0136
_single_circuit_startup_0136 PROC NEAR
        mov bx, seg _DATA
        mov ds, bx
        cld
        call _FN_CIRCUIT_CGA_0016A
        call _GRP_B84A76B6
        call _FN_CIRCUIT_CGA_00312
        mov byte ptr ds:[6bf0h], 0
        mov byte ptr ds:[6bf1h], 0
        call _FN_CIRCUIT_CGA_054F7
        xor ax, ax
        push ax
        call _FN_CIRCUIT_CGA_06B72
        add sp, 2
        push word ptr ds:[6b64h]
        push word ptr ds:[6b62h]
        call _GRP_9D44A3BF
        add sp, 4
        ret
_single_circuit_startup_0136 ENDP
_TEXT ENDS
END
