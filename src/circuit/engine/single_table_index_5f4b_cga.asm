_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_066A8:NEAR
        EXTRN _FN_CIRCUIT_CGA_0A05A:NEAR
        PUBLIC _single_table_index_5f4b
_single_table_index_5f4b PROC NEAR
        cmp word ptr ds:[5ed4h], 3
        je short L_5E23
        ret
L_5E23:
        mov word ptr ds:[79a6h], 0ffffh
        mov ax, word ptr ds:[0b5eh]
        add ax, word ptr ds:[9b8ch]
        cmp ax, 60h
        jl short L_5E38
        mov ax, 30h
L_5E38:
        mov word ptr ds:[0b5eh], ax
        sar ax, 1
        sar ax, 1
        sar ax, 1
        sar ax, 1
        shl ax, 1
        shl ax, 1
        mov di, ax
        push word ptr [di+6276h]
        push word ptr [di+6274h]
        call _FN_CIRCUIT_CGA_066A8
        push word ptr [di+628eh]
        push word ptr [di+628ch]
        call _FN_CIRCUIT_CGA_0A05A
        add sp, 8
        ret
_single_table_index_5f4b ENDP
_TEXT ENDS
END
