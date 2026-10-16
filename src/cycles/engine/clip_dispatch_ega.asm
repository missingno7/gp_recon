        .286
_CYCLES_MAIN_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_CYCLES_MAIN_TEXT
        EXTRN _FN_CYCLES_EGA_0B7DA:FAR
        PUBLIC _fn_cycles_ega_0de0c
_fn_cycles_ega_0de0c LABEL FAR
        PUSH         bp
        MOV          bp, sp
        MOV          bx, word ptr [bp+0Ah]
        SHL          bx, 1
        MOV          ax, word ptr CS:[bx+8712h]
        PUSH         word ptr [bp+8]
        MOV          dx, word ptr [bp+6]
        AND          dx, -8
        PUSH         dx
        PUSH         cs
        PUSH         ax
        CALL         _FN_CYCLES_EGA_0B7DA
        ADD          sp, 8
        POP          bp
        RETF
_CYCLES_MAIN_TEXT ENDS
        END
