        .286
_CYCLES_MAIN_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_CYCLES_MAIN_TEXT
        EXTRN _GRP_52D27303:FAR
        PUBLIC _fn_cycles_cga_0bca8
_fn_cycles_cga_0bca8 LABEL FAR
        PUSH         bp
        MOV          bp, sp
        MOV          bx, word ptr [bp+0Ah]
        SHL          bx, 1
        MOV          ax, word ptr CS:[bx+066E6h]
        PUSH         word ptr [bp+8]
        MOV          dx, word ptr [bp+6]
        AND          dx, -4 
        PUSH         dx
        PUSH         cs
        PUSH         ax
        CALL _GRP_52D27303
        ADD          sp, 8
        POP          bp
        RETF
_CYCLES_MAIN_TEXT ENDS
        END
