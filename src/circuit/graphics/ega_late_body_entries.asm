.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _g_cir_seg0000_beb0:WORD
EXTRN _g_cir_seg0000_b4a2:WORD
EXTRN _g_cir_seg0000_d93c:WORD
EXTRN _g_cir_seg0000_d94c:WORD
EXTRN _fn_circuit_ega_0b163:NEAR
EXTRN _g_cir_seg0000_b1cd:NEAR
EXTRN _g_cir_seg0000_b19b:NEAR

PUBLIC _ega_setup_body_0be62
_ega_setup_body_0be62 PROC NEAR
    push bp
    mov bp, sp
    mov ax, OFFSET _g_cir_seg0000_beb0
    mov WORD PTR [bp-40h], ax
    mov ax, OFFSET _g_cir_seg0000_b4a2
    mov WORD PTR [bp-4ah], ax
    mov BYTE PTR [bp-42h], 10h
    mov BYTE PTR [bp-41h], 2
    jmp NEAR PTR _fn_circuit_ega_0b163
_ega_setup_body_0be62 ENDP

PUBLIC _ega_setup_body_0be96
_ega_setup_body_0be96 PROC NEAR
    push bp
    mov bp, sp
    mov ax, OFFSET _g_cir_seg0000_beb0
    mov WORD PTR [bp-40h], ax
    mov ax, OFFSET _g_cir_seg0000_b4a2
    mov WORD PTR [bp-4ah], ax
    mov BYTE PTR [bp-42h], 10h
    mov BYTE PTR [bp-41h], 2
    jmp NEAR PTR _g_cir_seg0000_b1cd
_ega_setup_body_0be96 ENDP

PUBLIC _ega_setup_body_0d8ee
_ega_setup_body_0d8ee PROC NEAR
    push bp
    mov bp, sp
    mov ax, OFFSET _g_cir_seg0000_d93c
    mov WORD PTR [bp-40h], ax
    mov ax, OFFSET _g_cir_seg0000_d94c
    mov WORD PTR [bp-4ah], ax
    mov BYTE PTR [bp-42h], 18h
    mov BYTE PTR [bp-41h], 4
    jmp NEAR PTR _fn_circuit_ega_0b163
_ega_setup_body_0d8ee ENDP

PUBLIC _ega_setup_body_0d908
_ega_setup_body_0d908 PROC NEAR
    push bp
    mov bp, sp
    mov ax, OFFSET _g_cir_seg0000_d93c
    mov WORD PTR [bp-40h], ax
    mov ax, OFFSET _g_cir_seg0000_d94c
    mov WORD PTR [bp-4ah], ax
    mov BYTE PTR [bp-42h], 18h
    mov BYTE PTR [bp-41h], 4
    jmp NEAR PTR _g_cir_seg0000_b19b
_ega_setup_body_0d908 ENDP

PUBLIC _ega_setup_body_0d922
_ega_setup_body_0d922 PROC NEAR
    push bp
    mov bp, sp
    mov ax, OFFSET _g_cir_seg0000_d93c
    mov WORD PTR [bp-40h], ax
    mov ax, OFFSET _g_cir_seg0000_d94c
    mov WORD PTR [bp-4ah], ax
    mov BYTE PTR [bp-42h], 18h
    mov BYTE PTR [bp-41h], 4
    jmp NEAR PTR _g_cir_seg0000_b1cd
_ega_setup_body_0d922 ENDP
_TEXT ENDS
END
