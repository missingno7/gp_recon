        .286
CYC_TANDY_CLIP_ENTRY_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CYC_TANDY_CLIP_ENTRY_TEXT
        PUBLIC _fn_cycles_tandy_08fbc
_fn_cycles_tandy_08fbc LABEL FAR
        PUSH         bp
        MOV          bp, sp
        PUSH         ds
        PUSH         si
        PUSH         di
        SUB          sp, 10h
        MOV          ds, word ptr [bp+8]
        MOV          si, word ptr [bp+6]
        MOV          ax, word ptr [bp+0Ah]
        SUB          ax, word ptr [si+4]
        MOV          word ptr [bp-8], ax
        MOV          ax, word ptr [bp+0Ch]
        SUB          ax, word ptr [si+6]
        MOV          word ptr [bp-0Ah], ax
        JMP          SHORT $+3Ch
        PUBLIC _fn_cycles_tandy_08fe0
_fn_cycles_tandy_08fe0 LABEL FAR
        PUSH         bp
        MOV          bp, sp
        PUSH         ds
        PUSH         si
        PUSH         di
        SUB          sp, 10h
        MOV          ds, word ptr [bp+8]
        MOV          si, word ptr [bp+6]
        MOV          ax, word ptr [bp+0Ah]
        MOV          word ptr [bp-8], ax
        MOV          ax, word ptr [bp+0Ch]
        MOV          word ptr [bp-0Ah], ax
        JMP          SHORT $+1Eh
CYC_TANDY_CLIP_ENTRY_TEXT ENDS
        END
