_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_054F7:NEAR
        EXTRN _FN_CIRCUIT_CGA_06B72:NEAR
        EXTRN _GRP_9D44A3BF:NEAR
        PUBLIC _single_circuit_startup_0145
_single_circuit_startup_0145 PROC NEAR
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
_single_circuit_startup_0145 ENDP
_TEXT ENDS
END
