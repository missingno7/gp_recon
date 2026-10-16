_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _single_compare_limit_4a5b
_g_007f0 EQU 07f0h
_single_compare_limit_4a5b PROC NEAR
        mov dx,word ptr ds:[_g_007f0]
        cmp ax,dx
        jg short boundary
        ret
boundary:
_single_compare_limit_4a5b ENDP
_TEXT ENDS
END
