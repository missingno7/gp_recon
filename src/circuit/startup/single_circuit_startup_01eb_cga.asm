ROMSEG SEGMENT AT 0db4h
        ORG 6h
ROMCALL LABEL FAR
ROMSEG ENDS

_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_04BD4:NEAR
        EXTRN _FN_CIRCUIT_CGA_05524:NEAR
        EXTRN _FN_CIRCUIT_CGA_055DE:NEAR
        EXTRN _FN_CIRCUIT_CGA_05E64:NEAR
        EXTRN _FN_CIRCUIT_CGA_0834C:NEAR
        EXTRN _FN_CIRCUIT_CGA_0AA3B:NEAR
        EXTRN _FN_CIRCUIT_CGA_0AA59:NEAR
        EXTRN _GRP_0CB3FCB5:NEAR
        EXTRN _GRP_2BAE8498:NEAR
        EXTRN _GRP_FD52719F:NEAR
L_01E7:
        ret
        PUBLIC _single_circuit_startup_01eb
_single_circuit_startup_01eb PROC NEAR
L_01E8:
        call far ptr ROMCALL
        call _GRP_2BAE8498
        call _FN_CIRCUIT_CGA_04BD4
        call _FN_CIRCUIT_CGA_05E64
        call _FN_CIRCUIT_CGA_055DE
        call _FN_CIRCUIT_CGA_05524
        call _GRP_FD52719F
        call _GRP_0CB3FCB5
        call _FN_CIRCUIT_CGA_0AA59
        or al, al
        jne short L_020C
        call _FN_CIRCUIT_CGA_0AA3B
L_020C:
        cmp word ptr ds:[4ah], 0
        jne short L_01E7
        call _FN_CIRCUIT_CGA_0834C
        cmp al, 0
        je short L_01E8
        ret
_single_circuit_startup_01eb ENDP
_TEXT ENDS
END
