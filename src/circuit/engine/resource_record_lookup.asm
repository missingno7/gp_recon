.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
EXTRN _G_A2EE:WORD
EXTRN _G_A2F0:WORD
EXTRN _catalog_error_text:BYTE
EXTRN _fn_circuit_ega_0ddd8:NEAR
PUBLIC _resource_record_lookup
_resource_record_lookup PROC NEAR
    push bp
    mov bp, sp
    push si
    mov ax, word ptr [bp + 6]
    mov si, ds:_G_A2F0
check_record:
    cmp si, ds:_G_A2EE
    je report_missing
    cmp ax, word ptr [si + 0eh]
    je found
    sub si, 12h
    jmp short check_record
report_missing:
    push word ptr [bp + 6]
    mov ax, OFFSET _catalog_error_text
    push ax
    call _fn_circuit_ega_0ddd8
found:
    mov ax, word ptr [si + 0ch]
    pop si
    pop bp
    ret
_resource_record_lookup ENDP
_TEXT ENDS
END
