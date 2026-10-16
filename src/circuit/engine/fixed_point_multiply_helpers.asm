.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
PUBLIC _fn_circuit_ega_1026f
PUBLIC _fn_circuit_ega_10285
_fn_circuit_ega_1026f PROC NEAR
    or bx, bx
    jl short L_1027A
    mov ax, dx
    mul bx
    mov ax, dx
    ret
L_1027A:
    neg bx
    mov ax, dx
    mul bx
    mov ax, dx
    neg ax
    ret
_fn_circuit_ega_1026f ENDP
_fn_circuit_ega_10285 PROC NEAR
    or ax, ax
    jl short L_10290
    mul bx
    mov al, ah
    mov ah, dl
    ret
L_10290:
    neg ax
    mul bx
    mov al, ah
    mov ah, dl
    neg ax
    ret
_fn_circuit_ega_10285 ENDP
_TEXT ENDS
END
