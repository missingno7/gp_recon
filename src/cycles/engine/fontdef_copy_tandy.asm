        .286
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        PUBLIC _fontdef_copy
_fontdef_copy LABEL FAR
        PUSH bp
        MOV bp, sp
        PUSH di
        PUSH si
        MOV si, word ptr [bp+6]
        MOV ax, word ptr [si+16h]
        MOV word ptr ds:[09C8Ch], ax
        MOV es, ax
        XOR di, di
        CLD
        MOV cx, 0Bh
        REP MOVSW
        POP si
        POP di
        POP bp
        RETF
_TEXT ENDS
        END
