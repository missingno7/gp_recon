_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_08D2A:NEAR
        EXTRN _FN_CIRCUIT_EGA_0BBAE:NEAR
        PUBLIC _single_table_index_5f4b
_single_table_index_5f4b PROC NEAR
        cmp word ptr ds:[5ef0h], 3
        je short L_5F53
        ret
L_5F53:
        mov word ptr ds:[80f4h], 0ffffh
        mov ax, word ptr ds:[0b62h]
        add ax, word ptr ds:[9bbch]
        cmp ax, 60h
        jl short L_5F68
        mov ax, 30h
L_5F68:
        mov word ptr ds:[0b62h], ax
        sar ax, 1
        sar ax, 1
        sar ax, 1
        sar ax, 1
        shl ax, 1
        shl ax, 1
        mov di, ax
        push word ptr [di+6292h]
        push word ptr [di+6290h]
        call _FN_CIRCUIT_EGA_08D2A
        push word ptr [di+62aah]
        push word ptr [di+62a8h]
        call _FN_CIRCUIT_EGA_0BBAE
        add sp, 8
        ret
_single_table_index_5f4b ENDP
_TEXT ENDS
END
