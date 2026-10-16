        .286
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        PUBLIC _fn_cycles_ega_0c47a
        PUBLIC _fn_cycles_ega_0c489
_fn_cycles_ega_0c47a LABEL FAR
        PUSH         bp
        MOV          bp, sp
        SUB          sp, 8
        PUSH         si
        PUSH         di
        MOV          byte ptr [bp-8], 1
        JMP          $+0Fh
        NOP
_fn_cycles_ega_0c489 LABEL FAR
        PUSH         bp
        MOV          bp, sp
        SUB          sp, 8
        PUSH         si
        PUSH         di
        MOV          byte ptr [bp-8], 0
_clip_line_body LABEL NEAR
_TEXT ENDS
        END
