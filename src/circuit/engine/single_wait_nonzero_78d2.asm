_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_078A0:NEAR
        PUBLIC _wait_nonzero_78d2
_wait_nonzero_78d2 PROC NEAR
L_WAIT:
        call _FN_CIRCUIT_EGA_078A0
        cmp ax, 0
        je short L_WAIT
        ret
_wait_nonzero_78d2 ENDP
_TEXT ENDS
END
