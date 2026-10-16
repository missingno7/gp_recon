        .286
CYC_CGA_CLIP_ENTRY_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CYC_CGA_CLIP_ENTRY_TEXT
        ORG 0
_L_CGA_CLIP_BODY LABEL NEAR
        ORG 28h
        PUBLIC _fn_cycles_cga_0913a
_fn_cycles_cga_0913a LABEL FAR
        MOV          bx, cx
        NEG          bx
        MOV          dl, byte ptr CS:[bx+3A45h]
        AND          al, dl
        NOT          dl
        AND          byte ptr ES:[di], dl
        OR           byte ptr ES:[di], al
        JMP          SHORT _L_CGA_CLIP_BODY
CYC_CGA_CLIP_ENTRY_TEXT ENDS
        END
