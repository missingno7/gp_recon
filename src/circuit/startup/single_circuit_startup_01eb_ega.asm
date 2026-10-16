ROMSEG SEGMENT AT 0ffch
        ORG 8h
ROMCALL LABEL FAR
ROMSEG ENDS

_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_04CF4:NEAR
        EXTRN _FN_CIRCUIT_EGA_0566E:NEAR
        EXTRN _FN_CIRCUIT_EGA_05728:NEAR
        EXTRN _FN_CIRCUIT_EGA_05F94:NEAR
        EXTRN _FN_CIRCUIT_EGA_078A0:NEAR
        EXTRN _FN_CIRCUIT_EGA_08B9B:NEAR
        EXTRN _FN_CIRCUIT_EGA_08BB9:NEAR
        EXTRN _GRP_0CB3FCB5:NEAR
        EXTRN _GRP_2BAE8498:NEAR
        EXTRN _GRP_FD52719F:NEAR
L_01EA:
        ret
        PUBLIC _single_circuit_startup_01eb
_single_circuit_startup_01eb PROC NEAR
L_01EB:
        call far ptr ROMCALL
        call _GRP_2BAE8498
        call _FN_CIRCUIT_EGA_04CF4
        call _FN_CIRCUIT_EGA_05F94
        call _FN_CIRCUIT_EGA_05728
        call _FN_CIRCUIT_EGA_0566E
        call _GRP_FD52719F
        call _GRP_0CB3FCB5
        call _FN_CIRCUIT_EGA_08BB9
        or al, al
        jne short L_020F
        call _FN_CIRCUIT_EGA_08B9B
L_020F:
        cmp word ptr ds:[4ah], 0
        jne short L_01EA
        call _FN_CIRCUIT_EGA_078A0
        cmp al, 0
        je short L_01EB
        ret
_single_circuit_startup_01eb ENDP
_TEXT ENDS
END
