_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _single_4b82
_g_008e2 EQU 08e2h
_g_008e3 EQU 08e3h
_g_008e4 EQU 08e4h
_g_008e5 EQU 08e5h
_single_4b82 PROC NEAR
        shr bx, 1
        jae short L_4B8E
        mov byte ptr ds:[_g_008e2], 0ffh
        nop
        jmp short L_4B94
L_4B8E:
        mov byte ptr ds:[_g_008e2], 0
        nop
L_4B94:
        shr bx, 1
        jae short L_4BA0
        mov byte ptr ds:[_g_008e3], 0ffh
        nop
        jmp short L_4BA6
L_4BA0:
        mov byte ptr ds:[_g_008e3], 0
        nop
L_4BA6:
        shr bx, 1
        jae short L_4BB2
        mov byte ptr ds:[_g_008e4], 0ffh
        nop
        jmp short L_4BB8
L_4BB2:
        mov byte ptr ds:[_g_008e4], 0
        nop
L_4BB8:
        shr bx, 1
        jae short L_4BC4
        mov byte ptr ds:[_g_008e5], 0ffh
        nop
        jmp short L_4BCA
L_4BC4:
        mov byte ptr ds:[_g_008e5], 0
        nop
L_4BCA:
        ret
_single_4b82 ENDP
_TEXT ENDS
END
