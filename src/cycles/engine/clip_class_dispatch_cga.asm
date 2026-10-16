        .286
CYCLES_CGA_CLIP_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CYCLES_CGA_CLIP_TEXT
        PUBLIC _fn_cycles_cga_07e0e
_fn_cycles_cga_07e0e LABEL FAR
        MOV          bl, byte ptr [si+0Eh]
        SHL          bx, 1
        JMP          word ptr cs:[bx+28C8h]
CYCLES_CGA_CLIP_TEXT ENDS
        END
