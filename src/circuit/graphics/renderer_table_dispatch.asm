.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _g_cir_seg0000_df9a:WORD
EXTRN _ega_setup_body_0d8ee:NEAR
PUBLIC _setup_renderer_from_table_dff4
_setup_renderer_from_table_dff4 PROC NEAR
    push bp
    mov bp, sp
    mov bx, WORD PTR [bp+8]
    shl bx, 1
    mov ax, WORD PTR CS:_g_cir_seg0000_df9a[bx]
    push WORD PTR [bp+6]
    mov dx, WORD PTR [bp+4]
    and dx, 0fff8h
    push dx
    push cs
    push ax
    call NEAR PTR _ega_setup_body_0d8ee
    add sp, 8
    pop bp
    ret
_setup_renderer_from_table_dff4 ENDP
_TEXT ENDS
END
