        .286
CYC_TANDY_MASK_ROWS_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CYC_TANDY_MASK_ROWS_TEXT
        PUBLIC _fn_cycles_tandy_091a6
_fn_cycles_tandy_091a6 LABEL FAR
        PUSH         bp
        MOV          bp, sp
        PUSH         ds
        PUSH         si
        PUSH         di
        SUB          sp, 8
        MOV          ds, word ptr [bp+8]
        MOV          si, word ptr [bp+6]
        MOV          ax, word ptr [si+8]
        AND          ax, 0FFFEh
        MOV          word ptr [bp-8], ax
        MOV          ax, word ptr [si+0Ah]
        MOV          word ptr [bp-0Ah], ax
_L_TANDY_ROW:
        MOV          bx, word ptr [bp-0Ah]
        SHL          bx, 1
        ADD          bx, word ptr CS:[4392h]
        MOV          ax, word ptr [si]
        MOV          word ptr [bp-0Ch], ax
        MOV          es, word ptr CS:[438Ah]
        CLD
        MOV          ax, word ptr [bp-8]
        SAR          ax, 1
        MOV          word ptr [bp-8], ax
        JB           SHORT _L_TANDY_END
        MOV          dx, word ptr [si+2]
        ADD          si, 10h
_L_TANDY_ROW_LOOP:
        MOV          di, word ptr CS:[bx]
        ADD          di, word ptr [bp-8]
        MOV          cx, word ptr [bp-0Ch]
_L_TANDY_COPY:
        LODSB
        OR           byte ptr ES:[di], al
        INC          di
        LOOP         SHORT _L_TANDY_COPY
        INC          bx
        INC          bx
        DEC          dx
        JG           SHORT _L_TANDY_ROW_LOOP
        ADD          sp, 8
        POP          di
        POP          si
        POP          ds
        POP          bp
        RETF
_L_TANDY_END LABEL NEAR
        PUBLIC _fn_cycles_tandy_0a5e2
_fn_cycles_tandy_0a5e2 LABEL FAR
        PUSH         bp
        MOV          bp, sp
        PUSH         ds
        PUSH         si
        PUSH         di
        SUB          sp, 8
        MOV          ds, word ptr [bp+8]
        MOV          si, word ptr [bp+6]
        MOV          ax, word ptr [si+8]
        AND          ax, 0FFFEh
        MOV          word ptr [bp-8], ax
        MOV          ax, word ptr [si+0Ah]
        MOV          word ptr [bp-0Ah], ax
_L_TANDY_XOR_ROW:
        MOV          bx, word ptr [bp-0Ah]
        SHL          bx, 1
        ADD          bx, word ptr CS:[4392h]
        MOV          ax, word ptr [si]
        MOV          word ptr [bp-0Ch], ax
        MOV          es, word ptr CS:[438Ah]
        CLD
        MOV          ax, word ptr [bp-8]
        SAR          ax, 1
        MOV          word ptr [bp-8], ax
        JB           SHORT _L_TANDY_XOR_END
        MOV          dx, word ptr [si+2]
        ADD          si, 10h
_L_TANDY_XOR_ROW_LOOP:
        MOV          di, word ptr CS:[bx]
        ADD          di, word ptr [bp-8]
        MOV          cx, word ptr [bp-0Ch]
_L_TANDY_XOR_COPY:
        LODSB
        XOR          byte ptr ES:[di], al
        INC          di
        LOOP         SHORT _L_TANDY_XOR_COPY
        INC          bx
        INC          bx
        DEC          dx
        JG           SHORT _L_TANDY_XOR_ROW_LOOP
        ADD          sp, 8
        POP          di
        POP          si
        POP          ds
        POP          bp
        RETF
_L_TANDY_XOR_END LABEL NEAR
CYC_TANDY_MASK_ROWS_TEXT ENDS
        END
