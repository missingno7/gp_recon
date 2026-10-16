.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
EXTRN _g_cir_7fe4:WORD
EXTRN _g_cir_7fe6:WORD
PUBLIC _atomic_counter_snapshot_read
_atomic_counter_snapshot_read PROC NEAR
    cli
    mov ax, word ptr ds:_g_cir_7fe4
    mov dx, word ptr ds:_g_cir_7fe6
    sti
    ret
_atomic_counter_snapshot_read ENDP
_TEXT ENDS
END
