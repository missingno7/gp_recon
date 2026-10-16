        .286
CYCLES_TANDY_CLIP_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CYCLES_TANDY_CLIP_TEXT
        PUBLIC _fn_cycles_tandy_07cf8
_fn_cycles_tandy_07cf8 LABEL FAR
        MOV          bl, byte ptr [si+0Eh]
        SHL          bx, 1
        JMP          word ptr cs:[bx+27B2h]
CYCLES_TANDY_CLIP_TEXT ENDS
        END
