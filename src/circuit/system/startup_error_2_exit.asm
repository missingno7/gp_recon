.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _fn_circuit_ega_0e0ba:NEAR
PUBLIC _set_dos_error_2_exit
_set_dos_error_2_exit PROC NEAR
    mov ax, 2
    jmp _fn_circuit_ega_0e0ba
_set_dos_error_2_exit ENDP
_TEXT ENDS
END
