.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
EXTRN _g_8018:BYTE
PUBLIC _fn_circuit_ega_08bb9
_fn_circuit_ega_08bb9 PROC NEAR
    mov al, byte ptr ds:_g_8018
    xor ah, ah
    ret
_fn_circuit_ega_08bb9 ENDP
_TEXT ENDS
END
