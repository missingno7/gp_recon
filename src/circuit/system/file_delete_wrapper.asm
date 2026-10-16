.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _fn_circuit_ega_0e522:NEAR
PUBLIC _fn_circuit_ega_0fe7c
_fn_circuit_ega_0fe7c PROC NEAR
    push bp
    mov bp, sp
    mov dx, word ptr [bp + 4]
    mov ah, 41h
    int 21h
    jmp near ptr _fn_circuit_ega_0e522
_fn_circuit_ega_0fe7c ENDP
_TEXT ENDS
END
