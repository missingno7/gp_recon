.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
EXTRN _g_cir_7fe4:WORD
EXTRN _g_cir_7fe6:WORD
PUBLIC _fn_circuit_ega_08bf2
_fn_circuit_ega_08bf2 PROC NEAR
    cli
    mov ax, ds:_g_cir_7fe4
    mov dx, ds:_g_cir_7fe6
    sti
    ret
_fn_circuit_ega_08bf2 ENDP
_TEXT ENDS
END
