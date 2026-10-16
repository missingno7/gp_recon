.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _fn_circuit_ega_0e522:NEAR
PUBLIC _dos_delete_file
_dos_delete_file PROC NEAR
    push bp
    mov bp, sp
    mov dx, [bp+4]
    mov ah, 41h
    int 21h
    jmp _fn_circuit_ega_0e522
_dos_delete_file ENDP
_TEXT ENDS
END
