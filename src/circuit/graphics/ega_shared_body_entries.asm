.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _g_cir_seg0000_8d44:WORD
EXTRN _g_cir_seg0000_aa78:WORD
EXTRN _EXT_A689:NEAR
EXTRN _g_cir_seg0000_a6c1:NEAR
EXTRN _g_cir_seg0000_a6f3:NEAR
PUBLIC _fn_circuit_ega_08cf6
PUBLIC _fn_circuit_ega_08d10
PUBLIC _fn_circuit_ega_08d2a

_fn_circuit_ega_08cf6 PROC NEAR
    push bp
    mov bp, sp
    mov ax, OFFSET _g_cir_seg0000_8d44
    mov [bp-40h], ax
    mov ax, OFFSET _g_cir_seg0000_aa78
    mov [bp-4ah], ax
    mov byte ptr [bp-42h], 8
    mov byte ptr [bp-41h], 1
    jmp _EXT_A689
_fn_circuit_ega_08cf6 ENDP

_fn_circuit_ega_08d10 PROC NEAR
    push bp
    mov bp, sp
    mov ax, OFFSET _g_cir_seg0000_8d44
    mov [bp-40h], ax
    mov ax, OFFSET _g_cir_seg0000_aa78
    mov [bp-4ah], ax
    mov byte ptr [bp-42h], 8
    mov byte ptr [bp-41h], 1
    jmp _g_cir_seg0000_a6c1
_fn_circuit_ega_08d10 ENDP

_fn_circuit_ega_08d2a PROC NEAR
    push bp
    mov bp, sp
    mov ax, OFFSET _g_cir_seg0000_8d44
    mov [bp-40h], ax
    mov ax, OFFSET _g_cir_seg0000_aa78
    mov [bp-4ah], ax
    mov byte ptr [bp-42h], 8
    mov byte ptr [bp-41h], 1
    jmp _g_cir_seg0000_a6f3
_fn_circuit_ega_08d2a ENDP
_TEXT ENDS
END
