_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _signed_multiply_560e
_signed_multiply_560e PROC NEAR
        or bx, bx
        jl short $++9h
        mov ax, dx
        mul bx
        mov ax, dx
        ret
_signed_multiply_560e ENDP
_TEXT ENDS
END
