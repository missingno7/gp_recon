.8086
DGROUP GROUP DSEG
DSEG SEGMENT BYTE PUBLIC 'DATA'
DSEG ENDS
ASSUME DS:DGROUP
EXTRN _g_cir_8c3d:WORD
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
PUBLIC _file_mode_filter
_file_mode_filter PROC NEAR
    mov ax, WORD PTR _g_cir_8c3d
    not ax
    and ax, cx
    xor cx, cx
    test al, 80h
    jne short mode_ready
    or cl, 1
mode_ready:
    ret
_file_mode_filter ENDP
_TEXT ENDS
END
