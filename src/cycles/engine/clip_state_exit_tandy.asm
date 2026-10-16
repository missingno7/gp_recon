        .286
CYCLES_TANDY_CLIP_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CYCLES_TANDY_CLIP_TEXT
        PUBLIC _fn_cycles_tandy_07c05
_fn_cycles_tandy_07c05 LABEL FAR
        MOV          byte ptr [si+0Fh], al
        POP          di
        POP          si
        MOV          sp, bp
        POP          bp
        RETF
CYCLES_TANDY_CLIP_TEXT ENDS
        END
