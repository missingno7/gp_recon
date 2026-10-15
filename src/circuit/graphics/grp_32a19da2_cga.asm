_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _GRP_9D44A3BF:NEAR
        EXTRN _FN_CIRCUIT_CGA_065DE:NEAR
        EXTRN _FN_CIRCUIT_CGA_0661A:NEAR
        PUBLIC _grp_32a19da2
_G_05E30 EQU 5E2Ch
_G_06BF6 EQU 6BDAh
_G_06BF4 EQU 6BD8h
_G_05EC6 EQU 5EAAh
_G_012FC EQU 12F8h
_G_05EBE EQU 5EA2h
_G_09BD6 EQU 9BA6h
_G_00C4C EQU 0C48h
_grp_32a19da2 PROC NEAR
        cmp byte ptr ds:[_G_05E30],0
        je short done
        push word ptr ds:[_G_06BF6]
        push word ptr ds:[_G_06BF4]
        call _GRP_9D44A3BF
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
        call _FN_CIRCUIT_CGA_065DE
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
        call _FN_CIRCUIT_CGA_0661A
        inc di
        inc di
        loop short loop_table
done:
        ret
_grp_32a19da2 ENDP
_TEXT ENDS
END
