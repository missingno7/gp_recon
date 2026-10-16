.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
EXTRN _g_cir_8c74:WORD
PUBLIC _fn_circuit_ega_0f6d0
_fn_circuit_ega_0f6d0 PROC NEAR
    pop cx
    mov ax, word ptr ds:_g_cir_8c74
    cmp ax, sp
    jae short limit_ok
    sub ax, sp
    neg ax
dispatch:
    jmp cx
limit_ok:
    xor ax, ax
    jmp short dispatch
_fn_circuit_ega_0f6d0 ENDP
_TEXT ENDS
END

