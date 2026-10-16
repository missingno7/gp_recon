.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _grp_97985841:NEAR
EXTRN _grp_da1e7b44:NEAR
EXTRN _grp_80e23552:NEAR
PUBLIC _report_error_and_exit
_report_error_and_exit PROC NEAR
    push bp
    mov bp, sp
    mov ax, 10
    push ax
    call _grp_97985841
    mov ax, 16h
    push ax
    call _grp_da1e7b44
    mov ax, 3
    push ax
    call _grp_80e23552
    mov sp, bp
    pop bp
    ret
_report_error_and_exit ENDP
_TEXT ENDS
END
