.8086
DGROUP GROUP DSEG
DSEG SEGMENT BYTE PUBLIC 'DATA'
DSEG ENDS
ASSUME DS:DGROUP
EXTRN _g_8017:BYTE
EXTRN _g_cir_800a:WORD
EXTRN _g_cir_800c:WORD
EXTRN _g_8018:BYTE
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
PUBLIC _state_pair_write_mode3
_state_pair_write_mode3 PROC NEAR
    push bp
    mov bp, sp
    cmp BYTE PTR _g_8017, 3
    jne SHORT _skip_write
    cli
    mov ax, WORD PTR [bp+6]
    mov WORD PTR _g_cir_800a, ax
    mov ax, WORD PTR [bp+4]
    mov WORD PTR _g_cir_800c, ax
    mov BYTE PTR _g_8018, 1
    sti
_skip_write:
    pop bp
    ret
_state_pair_write_mode3 ENDP
_TEXT ENDS
END
