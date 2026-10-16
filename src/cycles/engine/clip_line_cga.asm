        .286
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        PUBLIC _fn_cycles_cga_07efb
_fn_cycles_cga_07efb LABEL FAR
        MOV ax, word ptr [bp+8]
        CMP ax, word ptr cs:[4812h]
        JGE SHORT $+23h
        TEST word ptr [bp-6], 1
        JE SHORT $+0Fh
        JMP NEAR PTR $-0FEh
_TEXT ENDS
        END
