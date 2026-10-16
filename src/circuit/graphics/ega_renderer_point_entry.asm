.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _g_cir_seg0000_9040:WORD
EXTRN _g_cir_seg0000_b4a2:WORD
EXTRN _fn_circuit_ega_0b163:NEAR
PUBLIC _fn_circuit_ega_08ff2
_fn_circuit_ega_08ff2 PROC NEAR
    push bp
    mov bp, sp
    mov ax, OFFSET _g_cir_seg0000_9040
    mov [bp-40h], ax
    mov ax, OFFSET _g_cir_seg0000_b4a2
    mov [bp-4ah], ax
    mov byte ptr [bp-42h], 8
    mov byte ptr [bp-41h], 1
    jmp _fn_circuit_ega_0b163
_fn_circuit_ega_08ff2 ENDP
_TEXT ENDS
END
