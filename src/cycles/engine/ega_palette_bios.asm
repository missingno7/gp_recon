        .286
CYCLES_SEG0000_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CYCLES_SEG0000_TEXT
        PUBLIC _fn_cycles_ega_0a302
_fn_cycles_ega_0a302 LABEL FAR
        PUSH         bp
        MOV          bp, sp
        MOV          ax, ds
        MOV          es, ax
        MOV          ah, 10h
        MOV          al, 2
        MOV          dx, word ptr [bp+6]
        INT          10h
        POP          bp
        RETF
CYCLES_SEG0000_TEXT ENDS
        END
