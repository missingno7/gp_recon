.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
PUBLIC _mul_high_signed_bx
_mul_high_signed_bx PROC NEAR
    or bx, bx
    jl short negative_bx
    mov ax, dx
    mul bx
    mov ax, dx
    ret
negative_bx:
    neg bx
    mov ax, dx
    mul bx
    mov ax, dx
    neg ax
    ret
_mul_high_signed_bx ENDP
_TEXT ENDS
END
