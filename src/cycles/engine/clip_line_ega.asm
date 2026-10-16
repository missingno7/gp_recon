        .286
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        PUBLIC _fn_cycles_ega_0c47a
        PUBLIC _fn_cycles_ega_0c489
        PUBLIC _fn_cycles_ega_0c96b
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
_G_4E96 EQU 4E96h ; CS offset
_G_4E98 EQU 4E98h ; CS offset
_G_4E9A EQU 4E9Ah ; CS offset
_G_4E9C EQU 4E9Ch ; CS offset
_CLIP_TABLE_056A_6FBC EQU 6FBCh ; local CS jump table base
_CLIP_TABLE_056A_700B EQU 700Bh ; local CS jump table base
_CLIP_TABLE_056A_70B8 EQU 70B8h ; local CS jump table base
_CLIP_TABLE_056A_70FE EQU 70FEh ; local CS jump table base
_CLIP_TABLE_056A_71E8 EQU 71E8h ; local CS jump table base
        PUSH       bp
        MOV        bp, sp
        SUB        sp, 8
        PUSH       si
        PUSH       di
        MOV        byte ptr [bp - 8], 0
        MOV        si, word ptr [bp + 0Eh]
        MOV        word ptr [si + 0Eh], 0FFh
        XOR        ax, ax
        MOV        word ptr [si + 10h], ax
        MOV        word ptr [si], ax
        MOV        word ptr [si + 4], ax
        MOV        ax, word ptr cs:[_G_4E96]
        SHL        ax, 1
        SHL        ax, 1
        SHL        ax, 1
        MOV        word ptr [bp - 2], ax
        MOV        ax, word ptr cs:[_G_4E98]
        SHL        ax, 1
        SHL        ax, 1
        SHL        ax, 1
        MOV        word ptr [bp - 4], ax
        MOV        ax, word ptr [bp + 8]
        CMP        ax, word ptr [bp + 0Ch]
        JE         _L_C4CC
        JMP        _L_C553
_L_C4CC LABEL NEAR
        MOV        byte ptr [si + 0Eh], 0
        MOV        bx, word ptr [bp + 6]
        CMP        bx, word ptr [bp + 0Ah]
        JNE        _L_C4DC
        MOV        byte ptr [si + 0Eh], 8
_L_C4DC LABEL NEAR
        JLE        _L_C4EB
        MOV        cx, word ptr [bp + 0Ah]
        MOV        word ptr [bp + 6], cx
        MOV        word ptr [bp + 0Ah], bx
        OR         byte ptr [si + 10h], 80h
_L_C4EB LABEL NEAR
        CMP        ax, word ptr cs:[_G_4E9A]
        JGE        _L_C4FF
        MOV        al, 4
_L_C4F4 LABEL NEAR
        MOV        byte ptr [si + 0Fh], al
        XOR        ah, ah
        POP        di
        POP        si
        MOV        sp, bp
        POP        bp
        RETF
_L_C4FF LABEL NEAR
        CMP        ax, word ptr cs:[_G_4E9C]
        JL         _L_C50A
        MOV        al, 8
        JMP        _L_C4F4
_L_C50A LABEL NEAR
        MOV        cx, word ptr [bp + 6]
        MOV        bx, word ptr [bp + 0Ah]
        MOV        ax, bx
        SUB        ax, cx
        INC        ax
        MOV        word ptr [si + 0Ah], ax
        XOR        dx, dx
        CMP        bx, word ptr [bp - 2]
        JGE        _L_C523
        MOV        al, 2
        JMP        _L_C4F4
_L_C523 LABEL NEAR
        CMP        cx, word ptr [bp - 4]
        JL         _L_C52C
        MOV        al, 1
        JMP        _L_C4F4
_L_C52C LABEL NEAR
        MOV        ax, word ptr [bp - 2]
        MOV        dx, ax
        SUB        ax, word ptr [bp + 6]
        JLE        _L_C540
        MOV        word ptr [bp + 6], dx
        SUB        word ptr [si + 0Ah], ax
        OR         byte ptr [si + 10h], 2
_L_C540 LABEL NEAR
        MOV        ax, word ptr [bp + 0Ah]
        SUB        ax, word ptr [bp - 4]
        INC        ax
        JLE        _L_C550
        SUB        word ptr [si + 0Ah], ax
        OR         byte ptr [si + 11h], 1
_L_C550 LABEL NEAR
        JMP        _L_C67C
_L_C553 LABEL NEAR
        JL         _L_C56A
        MOV        bx, word ptr [bp + 6]
        MOV        cx, word ptr [bp + 0Ah]
        MOV        word ptr [bp + 6], cx
        MOV        word ptr [bp + 0Ah], bx
        MOV        cx, word ptr [bp + 0Ch]
        MOV        word ptr [bp + 8], cx
        MOV        word ptr [bp + 0Ch], ax
_L_C56A LABEL NEAR
        XOR        dx, dx
        MOV        ax, word ptr [bp + 8]
        CMP        ax, word ptr cs:[_G_4E9C]
        JL         _L_C57B
        MOV        dl, 8
        JMP        _L_C5CA
        NOP
_L_C57B LABEL NEAR
        CMP        ax, word ptr cs:[_G_4E9A]
        JGE        _L_C585
        OR         dh, 4
_L_C585 LABEL NEAR
        MOV        ax, word ptr [bp + 0Ch]
        CMP        ax, word ptr cs:[_G_4E9A]
        JGE        _L_C594
        MOV        dl, 4
        JMP        _L_C5CA
        NOP
_L_C594 LABEL NEAR
        CMP        ax, word ptr cs:[_G_4E9C]
        JL         _L_C59E
        OR         dl, 8
_L_C59E LABEL NEAR
        MOV        ax, word ptr [bp + 6]
        CMP        ax, word ptr [bp - 2]
        JGE        _L_C5A9
        OR         dh, 2
_L_C5A9 LABEL NEAR
        CMP        ax, word ptr [bp - 4]
        JL         _L_C5B1
        OR         dh, 1
_L_C5B1 LABEL NEAR
        MOV        ax, word ptr [bp + 0Ah]
        CMP        ax, word ptr [bp - 2]
        JGE        _L_C5BC
        OR         dl, 2
_L_C5BC LABEL NEAR
        CMP        ax, word ptr [bp - 4]
        JL         _L_C5C4
        OR         dl, 1
_L_C5C4 LABEL NEAR
        TEST       dh, dl
        JE         _L_C5E2
        AND        dl, dh
_L_C5CA LABEL NEAR
        MOV        byte ptr [si + 0Fh], dl
        CMP        byte ptr [bp - 8], 0
        JNE        _L_C5DE
_L_C5D3 LABEL NEAR
        MOV        al, byte ptr [si + 0Fh]
        XOR        ah, ah
        POP        di
        POP        si
        MOV        sp, bp
        POP        bp
        RETF
_L_C5DE LABEL NEAR
        MOV        byte ptr [bp - 8], 2
_L_C5E2 LABEL NEAR
        OR         dl, dh
        XOR        dh, dh
        MOV        word ptr [bp - 6], dx
        MOV        cx, word ptr [bp + 0Ch]
        SUB        cx, word ptr [bp + 8]
        MOV        dx, word ptr [bp + 0Ah]
        SUB        dx, word ptr [bp + 6]
        JNE        _L_C602
        INC        cx
        MOV        word ptr [si + 0Ah], cx
        MOV        byte ptr [si + 0Eh], 1
        JMP        _L_C647
        NOP
_L_C602 LABEL NEAR
        JL         _L_C62B
        CMP        dx, cx
        JB         _L_C61E
        JE         _L_C624
        MOV        byte ptr [si + 0Eh], 7
_L_C60E LABEL NEAR
        XCHG       dx, cx
_L_C610 LABEL NEAR
        XOR        ax, ax
        DIV        cx
        MOV        word ptr [si + 8], ax
        INC        cx
        MOV        word ptr [si + 0Ah], cx
        JMP        _L_C647
        NOP
_L_C61E LABEL NEAR
        MOV        byte ptr [si + 0Eh], 5
        JMP        _L_C610
_L_C624 LABEL NEAR
        MOV        byte ptr [si + 0Eh], 3
        JMP        _L_C643
        NOP
_L_C62B LABEL NEAR
        NEG        dx
        CMP        dx, cx
        JB         _L_C639
        JE         _L_C63F
        MOV        byte ptr [si + 0Eh], 6
        JMP        _L_C60E
_L_C639 LABEL NEAR
        MOV        byte ptr [si + 0Eh], 4
        JMP        _L_C610
_L_C63F LABEL NEAR
        MOV        byte ptr [si + 0Eh], 2
_L_C643 LABEL NEAR
        INC        cx
        MOV        word ptr [si + 0Ah], cx
_L_C647 LABEL NEAR
        CMP        byte ptr [bp - 8], 2
        JE         _L_C659
        MOV        bx, word ptr [bp - 6]
        SHL        bx, 1
        JE         _L_C67C
        JMP        word ptr cs:[bx + _CLIP_TABLE_056A_6FBC]
_L_C659 LABEL NEAR
        JMP        _L_C5D3
; CS jump table at C65C, 16 word entries
_L_C65C LABEL WORD
        DW           6FDCh, 71DEh, 70F4h, 70F4h, 6FF0h, 6FF0h, 6FF0h, 6FF0h
        DW           709Dh, 71DEh, 70F4h, 70F4h, 6FF0h, 6FF0h, 6FF0h, 6FF0h
_L_C67C LABEL NEAR
        MOV        ax, word ptr [bp + 6]
        MOV        word ptr [si + 2], ax
        MOV        ax, word ptr [bp + 8]
        MOV        word ptr [si + 6], ax
        XOR        ax, ax
        POP        di
        POP        si
        MOV        sp, bp
        POP        bp
        RETF
_L_C690 LABEL NEAR
        MOV        ax, word ptr [bp + 8]
        MOV        cx, word ptr cs:[_G_4E9A]
        MOV        word ptr [bp + 8], cx
        SUB        cx, ax
        OR         byte ptr [si + 10h], 4
        MOV        bl, byte ptr [si + 0Eh]
        SHL        bx, 1
        JMP        word ptr cs:[bx + _CLIP_TABLE_056A_700B]
; CS jump table at C6AB, 8 word entries
_L_C6AB LABEL WORD
        DW           0h, 701Bh, 7021h, 702Ah, 7033h, 7043h, 7053h, 7078h
_L_C6BB LABEL NEAR
        SUB        word ptr [si + 0Ah], cx
        JMP        _L_C9A2
_L_C6C1 LABEL NEAR
        SUB        word ptr [bp + 6], cx
        SUB        word ptr [si + 0Ah], cx
        JMP        _L_C9A2
_L_C6CA LABEL NEAR
        ADD        word ptr [bp + 6], cx
        SUB        word ptr [si + 0Ah], cx
        JMP        _L_C9A2
_L_C6D3 LABEL NEAR
        MOV        ax, word ptr [si + 8]
        MUL        cx
        SUB        word ptr [si], ax
        SBB        word ptr [bp + 6], dx
        SUB        word ptr [si + 0Ah], cx
        JMP        _L_C9A2
_L_C6E3 LABEL NEAR
        MOV        ax, word ptr [si + 8]
        MUL        cx
        ADD        word ptr [si], ax
        ADC        word ptr [bp + 6], dx
        SUB        word ptr [si + 0Ah], cx
        JMP        _L_C9A2
_L_C6F3 LABEL NEAR
        MOV        word ptr [bp + 8], ax
        MOV        dx, cx
        DEC        dx
        MOV        ax, 8000h
        DIV        word ptr [si + 8]
        XOR        cx, cx
        SUB        cx, dx
        ADC        ax, 0
        SUB        word ptr [bp + 6], ax
        SUB        word ptr [si + 0Ah], ax
        MUL        word ptr [si + 8]
        ADD        word ptr [si + 4], ax
        ADC        word ptr [bp + 8], dx
        JMP        _L_C9A2
_L_C718 LABEL NEAR
        MOV        word ptr [bp + 8], ax
        MOV        dx, cx
        DEC        dx
        MOV        ax, 8000h
        DIV        word ptr [si + 8]
        XOR        cx, cx
        SUB        cx, dx
        ADC        ax, 0
        ADD        word ptr [bp + 6], ax
        SUB        word ptr [si + 0Ah], ax
        MUL        word ptr [si + 8]
        ADD        word ptr [si + 4], ax
        ADC        word ptr [bp + 8], dx
        JMP        _L_C9A2
_L_C73D LABEL NEAR
        XOR        ax, ax
        SUB        ax, word ptr [si + 4]
        MOV        dx, word ptr cs:[_G_4E9C]
        SBB        dx, word ptr [bp + 8]
        OR         byte ptr [si + 11h], 8
        MOV        bl, byte ptr [si + 0Eh]
        SHL        bx, 1
        JMP        word ptr cs:[bx + _CLIP_TABLE_056A_70B8]
; CS jump table at C758, 8 word entries
_L_C758 LABEL WORD
        DW           0h, 70C8h, 70C8h, 70C8h, 70C8h, 70C8h, 70CEh, 70CEh
_L_C768 LABEL NEAR
        MOV        word ptr [si + 0Ah], dx
        JMP        _L_C67C
_L_C76E LABEL NEAR
        SUB        ax, 8000h
        SBB        dx, 0
        JL         _L_C788
        DIV        word ptr [si + 8]
        XOR        cx, cx
        SUB        cx, dx
        ADC        ax, 0
        JLE        _L_C788
        MOV        word ptr [si + 0Ah], ax
        JMP        _L_C67C
_L_C788 LABEL NEAR
        MOV        ax, 8
_L_C78B LABEL NEAR
        MOV        byte ptr [si + 0Fh], al
        POP        di
        POP        si
        MOV        sp, bp
        POP        bp
        RETF
_L_C794 LABEL NEAR
        MOV        bl, byte ptr [si + 0Eh]
        SHL        bx, 1
        JMP        word ptr cs:[bx + _CLIP_TABLE_056A_70FE]
; CS jump table at C79E, 8 word entries
_L_C79E LABEL WORD
        DW           0h, 71D8h, 710Eh, 7127h, 713Fh, 7168h, 7195h, 71BAh
_L_C7AE LABEL NEAR
        MOV        cx, word ptr [bp + 6]
        SUB        cx, word ptr [bp - 2]
        MOV        ax, word ptr [bp + 8]
        ADD        ax, cx
        MOV        word ptr [bp + 0Ch], ax
        INC        cx
        MOV        word ptr [si + 0Ah], cx
        OR         byte ptr [si + 11h], 2
        JMP        _L_C96B
_L_C7C7 LABEL NEAR
        MOV        ax, word ptr [bp + 6]
        MOV        cx, word ptr [bp - 2]
        MOV        word ptr [bp + 6], cx
        SUB        cx, ax
        ADD        word ptr [bp + 8], cx
        SUB        word ptr [si + 0Ah], cx
        OR         byte ptr [si + 10h], 2
        JMP        _L_C96B
_L_C7DF LABEL NEAR
        MOV        ax, word ptr [si]
        MOV        dx, word ptr [bp + 6]
        SUB        dx, word ptr [bp - 2]
        ADD        ax, 8000h
        ADC        dx, 0
        DIV        word ptr [si + 8]
        XOR        cx, cx
        SUB        cx, dx
        ADC        ax, 0
        MOV        word ptr [si + 0Ah], ax
        DEC        ax
        ADD        ax, word ptr [bp + 8]
        MOV        word ptr [bp + 0Ch], ax
        OR         byte ptr [si + 11h], 2
        JMP        _L_C96B
_L_C808 LABEL NEAR
        MOV        dx, word ptr [bp - 2]
        XOR        ax, ax
        SUB        ax, word ptr [si]
        SBB        dx, word ptr [bp + 6]
        SUB        ax, 8000h
        SBB        dx, 0
        JL         _L_C832
        DIV        word ptr [si + 8]
        INC        ax
        ADD        word ptr [bp + 8], ax
        SUB        word ptr [si + 0Ah], ax
        JLE        _L_C878
        MUL        word ptr [si + 8]
        ADD        word ptr [si], ax
        ADC        word ptr [bp + 6], dx
        OR         byte ptr [si + 10h], 2
_L_C832 LABEL NEAR
        JMP        _L_C96B
_L_C835 LABEL NEAR
        MOV        ax, word ptr [bp + 6]
        SUB        ax, word ptr [bp - 2]
        MOV        cx, ax
        INC        cx
        MOV        word ptr [si + 0Ah], cx
        MUL        word ptr [si + 8]
        ADD        ax, word ptr [si + 4]
        ADC        dx, word ptr [bp + 8]
        ADD        ax, 8000h
        ADC        dx, 0
        MOV        word ptr [bp + 0Ch], dx
        OR         byte ptr [si + 11h], 2
        JMP        _L_C96B
_L_C85A LABEL NEAR
        MOV        cx, word ptr [bp + 6]
        MOV        ax, word ptr [bp - 2]
        MOV        word ptr [bp + 6], ax
        SUB        ax, cx
        SUB        word ptr [si + 0Ah], ax
        MUL        word ptr [si + 8]
        ADD        word ptr [si + 4], ax
        ADC        word ptr [bp + 8], dx
        OR         byte ptr [si + 10h], 2
        JMP        _L_C96B
_L_C878 LABEL NEAR
        MOV        ax, 2
        JMP        _L_C78B
_L_C87E LABEL NEAR
        MOV        bl, byte ptr [si + 0Eh]
        SHL        bx, 1
        JMP        word ptr cs:[bx + _CLIP_TABLE_056A_71E8]
; CS jump table at C888, 8 word entries
_L_C888 LABEL WORD
        DW           0h, 72C5h, 71F8h, 7211h, 722Bh, 7256h, 7283h, 72A2h
_L_C898 LABEL NEAR
        MOV        cx, word ptr [bp + 6]
        MOV        ax, word ptr [bp - 4]
        DEC        ax
        MOV        word ptr [bp + 6], ax
        SUB        cx, ax
        ADD        word ptr [bp + 8], cx
        SUB        word ptr [si + 0Ah], cx
        OR         byte ptr [si + 10h], 1
        JMP        _L_C97F
_L_C8B1 LABEL NEAR
        MOV        cx, word ptr [bp - 4]
        DEC        cx
        SUB        cx, word ptr [bp + 6]
        MOV        ax, word ptr [bp + 8]
        ADD        ax, cx
        MOV        word ptr [bp + 0Ch], ax
        INC        cx
        MOV        word ptr [si + 0Ah], cx
        OR         byte ptr [si + 11h], 1
        JMP        _L_C97F
_L_C8CB LABEL NEAR
        MOV        dx, word ptr [bp + 6]
        SUB        dx, word ptr [bp - 4]
        MOV        ax, word ptr [si]
        ADD        ax, 8000h
        ADC        dx, 0
        JL         _L_C8F3
        DIV        word ptr [si + 8]
        INC        ax
        ADD        word ptr [bp + 8], ax
        SUB        word ptr [si + 0Ah], ax
        JLE          $+5Fh
        MUL        word ptr [si + 8]
        SUB        word ptr [si], ax
        SBB        word ptr [bp + 6], dx
        OR         byte ptr [si + 10h], 1
_L_C8F3 LABEL NEAR
        JMP        _L_C97F
_L_C8F6 LABEL NEAR
        MOV        dx, word ptr [bp - 4]
        XOR        ax, ax
        SUB        ax, word ptr [si]
        SBB        dx, word ptr [bp + 6]
        SUB        ax, 8000h
        SBB        dx, 0
        JL         _L_C965
        DIV        word ptr [si + 8]
        XOR        cx, cx
        SUB        cx, dx
        ADC        ax, 0
        MOV        word ptr [si + 0Ah], ax
        DEC        ax
        ADD        ax, word ptr [bp + 8]
        MOV        word ptr [bp + 0Ch], ax
        OR         byte ptr [si + 11h], 1
        JMP        _L_C97F
        NOP
_L_C923 LABEL NEAR
        MOV        ax, word ptr [bp + 6]
        MOV        cx, word ptr [bp - 4]
        DEC        cx
        SUB        ax, cx
        MOV        word ptr [bp + 6], cx
        SUB        word ptr [si + 0Ah], ax
        MUL        word ptr [si + 8]
        ADD        word ptr [si + 4], ax
        ADC        word ptr [bp + 8], dx
        OR         byte ptr [si + 10h], 1
        JMP        _L_C97F
        NOP
_L_C942 LABEL NEAR
        MOV        ax, word ptr [bp - 4]
        SUB        ax, word ptr [bp + 6]
        MOV        word ptr [si + 0Ah], ax
        DEC        ax
        MUL        word ptr [si + 8]
        ADD        ax, word ptr [si + 4]
        ADC        dx, word ptr [bp + 8]
        ADD        ax, 8000h
        ADC        dx, 0
        MOV        word ptr [bp + 0Ch], dx
        OR         byte ptr [si + 11h], 1
        JMP        _L_C97F
        NOP
_L_C965 LABEL NEAR
        MOV        ax, 1
        JMP        _L_C78B
_fn_cycles_ega_0c96b LABEL FAR
_L_C96B LABEL NEAR
        MOV        ax, word ptr [bp + 8]
        CMP        ax, word ptr cs:[_G_4E9C]
        JGE        _L_C996
        TEST       word ptr [bp - 6], 1
        JE         _L_C989
        JMP        NEAR PTR $-0FEh
_L_C97F LABEL NEAR
        MOV        ax, word ptr [bp + 8]
        CMP        ax, word ptr cs:[_G_4E9C]
        JGE        _L_C996
_L_C989 LABEL NEAR
        MOV        ax, word ptr [bp + 0Ch]
        CMP        ax, word ptr cs:[_G_4E9C]
        JGE        _L_C9FD
        JMP        _L_C67C
_L_C996 LABEL NEAR
        MOV        ax, 8
        MOV        byte ptr [si + 0Fh], al
        POP        di
        POP        si
        MOV        sp, bp
        POP        bp
        RETF
_L_C9A2 LABEL NEAR
        XOR        dx, dx
        MOV        ax, word ptr [bp + 6]
        CMP        ax, word ptr [bp - 2]
        JGE        _L_C9AF
        OR         dh, 2
_L_C9AF LABEL NEAR
        MOV        bx, word ptr [si]
        ADD        bx, 8000h
        ADC        ax, 0
        CMP        ax, word ptr [bp - 4]
        JL         _L_C9C0
        OR         dh, 1
_L_C9C0 LABEL NEAR
        MOV        ax, word ptr [bp + 0Ah]
        CMP        ax, word ptr [bp - 2]
        JGE        _L_C9CB
        OR         dl, 2
_L_C9CB LABEL NEAR
        CMP        ax, word ptr [bp - 4]
        JL         _L_C9D3
        OR         dl, 1
_L_C9D3 LABEL NEAR
        TEST       dh, dl
        JE         _L_C9E6
        AND        dl, dh
        MOV        byte ptr [si + 0Fh], dl
        MOV        al, dl
        XOR        ah, ah
        POP        di
        POP        si
        MOV        sp, bp
        POP        bp
        RETF
_L_C9E6 LABEL NEAR
        MOV        ax, word ptr [bp + 0Ch]
        CMP        ax, word ptr cs:[_G_4E9C]
        JLE        _L_C9F3
        OR         dl, 8
_L_C9F3 LABEL NEAR
        OR         dl, dh
        XOR        dh, dh
        MOV        word ptr [bp - 6], dx
        JMP        _L_C647
_L_C9FD LABEL NEAR
        JMP        _L_C73D
_TEXT ENDS
        END
