.8086
DGROUP GROUP DSEG
DSEG SEGMENT BYTE PUBLIC 'DATA'
DSEG ENDS
ASSUME DS:DGROUP
EXTRN _g_cir_8a1e:WORD
EXTRN _g_cir_8a20:BYTE
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
PUBLIC _state_ring_rotate_byte
_state_ring_rotate_byte PROC NEAR
    push si
    dec WORD PTR _g_cir_8a1e
    mov si, WORD PTR _g_cir_8a1e
    and si, 0ffh
    mov al, BYTE PTR _g_cir_8a20[si]
    cmp al, 80h
    rcl al, 1
    mov BYTE PTR _g_cir_8a20[si], al
    xor ah, ah
    pop si
    ret
_state_ring_rotate_byte ENDP
_TEXT ENDS
END
