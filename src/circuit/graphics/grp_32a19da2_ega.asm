_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_0B1B6:NEAR
        EXTRN _FN_CIRCUIT_EGA_06738:NEAR
        EXTRN _FN_CIRCUIT_EGA_06785:NEAR
        PUBLIC _grp_32a19da2
_G_05E30 EQU 5E30h
_G_06BF6 EQU 6BF6h
_G_06BF4 EQU 6BF4h
_G_05EC6 EQU 5EC6h
_G_012FC EQU 12FCh
_G_05EBE EQU 5EBEh
_G_09BD6 EQU 9BD6h
_G_00C4C EQU 0C4Ch
_grp_32a19da2 PROC NEAR
        cmp byte ptr ds:[_G_05E30],0
        je short done
        push word ptr ds:[_G_06BF6]
        push word ptr ds:[_G_06BF4]
        call _FN_CIRCUIT_EGA_0B1B6
        add sp,4
        mov bp,word ptr ds:[_G_05EC6]
        shr bp,1
        shr bp,1
        and bp,0fffeh
        neg bp
        add bp,word ptr ds:[_G_012FC]
        mov bx,word ptr ds:[_G_05EBE]
        shr bx,1
        shr bx,1
        and bx,0fffeh
        add bx,bp
        jge short nonnegative
        xor bx,bx
nonnegative:
        call _FN_CIRCUIT_EGA_06738
        cmp word ptr ds:[_G_09BD6],0
        je short done
        mov cx,9
        mov di,_G_00C4C
loop_table:
        mov bx,word ptr ds:[di]
        sar bx,1
        sar bx,1
        and bx,0fffeh
        add bx,bp
        jge short nonnegative2
        xor bx,bx
nonnegative2:
        call _FN_CIRCUIT_EGA_06785
        inc di
        inc di
        loop short loop_table
done:
        ret
_grp_32a19da2 ENDP
_TEXT ENDS
END
