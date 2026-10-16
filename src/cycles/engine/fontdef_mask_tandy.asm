        .286
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        PUBLIC _fontdef_mask
_fontdef_mask LABEL FAR
        PUSH bp
        MOV bp, sp
        MOV es, word ptr ds:[09C8Ch]
        MOV ax, word ptr [bp+8]
        AND ax, 0Fh
        MOV word ptr es:[2], ax
        MOV ax, word ptr [bp+6]
        AND ax, 0Fh
        MOV word ptr es:[0], ax
        POP bp
        RETF
_TEXT ENDS
        END
