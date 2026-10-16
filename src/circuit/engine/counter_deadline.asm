_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _fn_circuit_ega_08c44
EXTRN _fn_circuit_ega_08bf2:NEAR
EXTRN _g_cir_8b42:WORD
EXTRN _g_cir_8b40:WORD

_fn_circuit_ega_08c44 PROC NEAR
    call _fn_circuit_ega_08bf2
    cmp dx, ds:_g_cir_8b42
    jb short _deadline_false
    ja short _deadline_true
    cmp ax, ds:_g_cir_8b40
    jb short _deadline_false
_deadline_true:
    mov ax, 1
    ret
_deadline_false:
    xor ax, ax
    ret
_fn_circuit_ega_08c44 ENDP
_TEXT ENDS
END


