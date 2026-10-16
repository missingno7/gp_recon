        .286
CYC_TANDY_COORD_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CYC_TANDY_COORD_TEXT
        PUBLIC _fn_cycles_tandy_07bb7
_fn_cycles_tandy_07bb7 LABEL FAR
        XOR          AX, AX
        SUB          AX, word ptr [SI+4]
        MOV          DX, word ptr CS:[439Ah]
        SBB          DX, word ptr [BP+8]
        OR           byte ptr [SI+11h], 8
        MOV          BL, byte ptr [SI+0Eh]
        SHL          BX, 1
        JMP          word ptr CS:[BX+2682h]
CYC_TANDY_COORD_TEXT ENDS
        END
