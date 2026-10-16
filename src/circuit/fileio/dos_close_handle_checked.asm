.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
EXTRN _g_cir_8c48:WORD
EXTRN _g_cir_8c4a:BYTE
EXTRN _fn_circuit_ega_0e522:NEAR
PUBLIC _dos_close_handle_checked
_dos_close_handle_checked PROC NEAR
    push bp
    mov bp, sp
    mov bx, [bp+4]
    cmp bx, ds:_g_cir_8c48
    jb short close_handle
    mov ax, 900h
    stc
    jmp short done
close_handle:
    mov ah, 3eh
    int 21h
    jb short done
    mov byte ptr ds:_g_cir_8c4a[bx], 0
done:
    jmp _fn_circuit_ega_0e522
_dos_close_handle_checked ENDP
_TEXT ENDS
END
