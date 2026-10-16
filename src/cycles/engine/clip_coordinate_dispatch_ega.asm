        .286
CYC_EGA_COORD_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CYC_EGA_COORD_TEXT
        PUBLIC _fn_cycles_ega_0c73d
_fn_cycles_ega_0c73d LABEL FAR
        XOR          AX, AX
        SUB          AX, word ptr [SI+4]
        MOV          DX, word ptr CS:[4E9Ch]
        SBB          DX, word ptr [BP+8]
        OR           byte ptr [SI+11h], 8
        MOV          BL, byte ptr [SI+0Eh]
        SHL          BX, 1
        JMP          word ptr CS:[BX+70B8h]
CYC_EGA_COORD_TEXT ENDS
        END
