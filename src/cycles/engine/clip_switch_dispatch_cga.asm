        .286
CYC_CGA_SWITCH_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CYC_CGA_SWITCH_TEXT
        PUBLIC _fn_cycles_cga_0d69a
_fn_cycles_cga_0d69a LABEL FAR
        MOV          DI, word ptr [SI+6]
        SHL          DI, 1
        MOV          BL, byte ptr [SI+0Eh]
        AND          BL, 7
        JE           SHORT _L_CGA_SW1
        MOV          byte ptr [BP-10h], 0
_L_CGA_SW1:
        XOR          BH, BH
        SHL          BX, 1
        JMP          word ptr CS:[BX+606Ch]
        PUBLIC _fn_cycles_cga_0d6c4
_fn_cycles_cga_0d6c4 LABEL FAR
        MOV          DI, word ptr [SI+6]
        SHL          DI, 1
        MOV          BL, byte ptr [SI+0Eh]
        AND          BL, 7
        JE           SHORT _L_CGA_SW2
        MOV          byte ptr [BP-10h], 0
_L_CGA_SW2:
        XOR          BH, BH
        SHL          BX, 1
        JMP          word ptr CS:[BX+6096h]
CYC_CGA_SWITCH_TEXT ENDS
        END
