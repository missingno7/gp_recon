        .286
CYC_CGA_COORD_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CYC_CGA_COORD_TEXT
        PUBLIC _fn_cycles_cga_07ccd
_fn_cycles_cga_07ccd LABEL FAR
        XOR          AX, AX
        SUB          AX, word ptr [SI+4]
        MOV          DX, word ptr CS:[4812h]
        SBB          DX, word ptr [BP+8]
        OR           byte ptr [SI+11h], 8
        MOV          BL, byte ptr [SI+0Eh]
        SHL          BX, 1
        JMP          word ptr CS:[BX+2798h]
CYC_CGA_COORD_TEXT ENDS
        END
