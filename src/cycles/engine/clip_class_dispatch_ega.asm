        .286
CLIP3_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CLIP3_TEXT
        PUBLIC _fn_cycles_ega_0c87e
_fn_cycles_ega_0c87e LABEL FAR
        MOV          bl, byte ptr [si+0Eh]
        SHL          bx, 1
        JMP          word ptr cs:[bx+71E8h]
CLIP3_TEXT ENDS
        END
