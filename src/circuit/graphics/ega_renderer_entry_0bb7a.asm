.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _g_cir_seg0000_bbc8:WORD
EXTRN _g_cir_seg0000_aa78:WORD
EXTRN _EXT_A689:NEAR
PUBLIC _fn_circuit_ega_0bb7a
_fn_circuit_ega_0bb7a PROC NEAR
    push bp
    mov bp, sp
    mov ax, OFFSET _g_cir_seg0000_bbc8
    mov [bp-40h], ax
    mov ax, OFFSET _g_cir_seg0000_aa78
    mov [bp-4ah], ax
    mov byte ptr [bp-42h], 10h
    mov byte ptr [bp-41h], 2
    jmp _EXT_A689
_fn_circuit_ega_0bb7a ENDP
_TEXT ENDS
END
