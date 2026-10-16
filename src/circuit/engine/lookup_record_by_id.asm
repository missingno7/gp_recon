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
PUBLIC _lookup_record_by_id
_lookup_record_by_id PROC NEAR
    push bp
    mov bp, sp
    push si
    mov ax, word ptr [bp + 6]
    mov si, ds:_G_A2F0
scan_records:
    cmp si, ds:_G_A2EE
    je missing_record
    cmp ax, word ptr [si + 0eh]
    je found_record
    sub si, 12h
    jmp short scan_records
missing_record:
    push word ptr [bp + 6]
    mov ax, OFFSET _catalog_error_text
    push ax
    call _fn_circuit_ega_0ddd8
found_record:
    mov ax, word ptr [si + 0ch]
    pop si
    pop bp
    ret
_lookup_record_by_id ENDP
_TEXT ENDS
END
