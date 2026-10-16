.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
PUBLIC _mul_s16_u16_bits8_23
_mul_s16_u16_bits8_23 PROC NEAR
    or ax, ax
    jl short negative_ax
    mul bx
    mov al, ah
    mov ah, dl
    ret
negative_ax:
    neg ax
    mul bx
    mov al, ah
    mov ah, dl
    neg ax
    ret
_mul_s16_u16_bits8_23 ENDP
_TEXT ENDS
END
