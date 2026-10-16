.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
PUBLIC _circuit_read_flag_8bb9
_circuit_read_flag_8bb9 PROC NEAR
    mov al, byte ptr ds:[8018h]
    xor ah, ah
    ret
_circuit_read_flag_8bb9 ENDP
_TEXT ENDS
END
