.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _circuit_keycode_translate:NEAR
PUBLIC _fn_circuit_ega_0e522
PUBLIC _fn_circuit_ega_0e535
_fn_circuit_ega_0e522 PROC NEAR
L_E522:
    jb short L_E537
L_E524:
    xor ax, ax
    mov sp, bp
    pop bp
    ret
_fn_circuit_ega_0e522 ENDP
    jae short L_E524
    push ax
    call near ptr _circuit_keycode_translate
    pop ax
    mov sp, bp
    pop bp
    ret
_fn_circuit_ega_0e535 PROC NEAR
    jae short L_E53E
L_E537:
    call near ptr _circuit_keycode_translate
    mov ax, 0FFFFh
    cwd
L_E53E:
    mov sp, bp
    pop bp
    ret
_fn_circuit_ega_0e535 ENDP
_TEXT ENDS
END
