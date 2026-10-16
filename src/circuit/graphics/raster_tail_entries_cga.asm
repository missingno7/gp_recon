.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
EXTRN _g_cir_8b4a:WORD
EXTRN _g_cir_8b4c:WORD
EXTRN _g_cir_8b5a:WORD
EXTRN _g_cir_seg0000_a83c:WORD
PUBLIC _fn_circuit_cga_09b70
PUBLIC _fn_circuit_cga_09b87
_fn_circuit_cga_09b70 PROC NEAR
    push bp
    mov bp, sp
    push si
    push di
    sub sp, 6
    mov ax, [bp+6]
    mov ds:_g_cir_8b4a, ax
    mov ax, [bp+8]
    mov ds:_g_cir_8b4c, ax
    jmp short raster_body
_fn_circuit_cga_09b70 ENDP
    nop
_fn_circuit_cga_09b87 PROC NEAR
    push bp
    mov bp, sp
    push si
    push di
    sub sp, 6
raster_body:
    cld
    mov es, word ptr cs:_g_cir_seg0000_a83c
    mov ax, word ptr ds:_g_cir_8b5a
    cmp ax, 1
    je raster_done
    add sp, 6
    pop di
    pop si
    pop bp
    ret
raster_done:
_fn_circuit_cga_09b87 ENDP
_TEXT ENDS
END
