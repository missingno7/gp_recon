.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
EXTRN _g_cir_8018:BYTE
PUBLIC _read_circuit_state_byte
_read_circuit_state_byte PROC NEAR
    mov al, byte ptr ds:_g_cir_8018
    xor ah, ah
    ret
_read_circuit_state_byte ENDP
_TEXT ENDS
END
