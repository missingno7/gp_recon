        .286
CYCLES_SEG0000_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CYCLES_SEG0000_TEXT
        PUBLIC _fontdef_segment_write
_fontdef_segment_write LABEL FAR
        PUSH         bp
        MOV          bp, sp
        MOV          es, word ptr ds:[9C8Ch]
        MOV          ax, word ptr [bp+6]
        MOV          word ptr es:[8], ax
        MOV          ax, word ptr [bp+8]
        MOV          word ptr es:[0Ah], ax
        POP          bp
        RETF
CYCLES_SEG0000_TEXT ENDS
        END
