        .286
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        PUBLIC _fn_cycles_ega_0c67c
_fn_cycles_ega_0c67c LABEL FAR
        MOV          ax, word ptr [bp+6]
        MOV          word ptr [si+2], ax
        MOV          ax, word ptr [bp+8]
        MOV          word ptr [si+6], ax
        XOR          ax, ax
        POP          di
        POP          si
        MOV          sp, bp
        POP          bp
        RETF
_TEXT ENDS
        END
