        .286
CYCLES_CGA_CLIP_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CYCLES_CGA_CLIP_TEXT
        PUBLIC _fn_cycles_cga_07d1b
_fn_cycles_cga_07d1b LABEL FAR
        MOV          byte ptr [si+0Fh], al
        POP          di
        POP          si
        MOV          sp, bp
        POP          bp
        RETF
CYCLES_CGA_CLIP_TEXT ENDS
        END
