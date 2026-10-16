.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _grp_42d76ee3:NEAR
PUBLIC _dos_error_return
_dos_error_return PROC NEAR
    jae short error_done
    call _grp_42d76ee3
    mov ax, 0ffffh
    cwd
error_done:
    mov sp, bp
    pop bp
    ret
_dos_error_return ENDP
_TEXT ENDS
END
