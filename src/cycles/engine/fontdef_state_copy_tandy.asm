        .286
_CYCLES_MAIN_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_CYCLES_MAIN_TEXT
        PUBLIC _fn_cycles_tandy_09ad0
_fn_cycles_tandy_09ad0 LABEL FAR
        PUSH         bp
        MOV          bp, sp
        PUSH         ds
        PUSH         di
        PUSH         si
        XOR          si, si
        MOV          di, word ptr [bp+6]
        MOV          ax, ds
        MOV          es, ax
        MOV          ds, word ptr ds:[09C8Ch]
        CLD
        MOV          word ptr es:[di+16h], ds
        MOV          cx, 0Bh
        REP          MOVSW
        POP          si
        POP          di
        POP          ds
        POP          bp
        RETF
_CYCLES_MAIN_TEXT ENDS
        END
