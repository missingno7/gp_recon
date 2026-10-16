        .286
CLIP3_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CLIP3_TEXT
        PUBLIC _fn_cycles_ega_0c78b
_fn_cycles_ega_0c78b LABEL FAR
        MOV          byte ptr [si+0Fh], al
        POP          di
        POP          si
        MOV          sp, bp
        POP          bp
        RETF
CLIP3_TEXT ENDS
        END
