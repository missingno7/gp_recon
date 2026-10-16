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
EXTRN _grp_420c3cf4:NEAR
PUBLIC _resource_record_compact
_resource_record_compact PROC NEAR
    push bp
    mov bp, sp
    push si
    push di
    mov ax, word ptr [bp + 6]
    mov si, ds:_G_A2F0
scan_records:
    cmp si, ds:_G_A2EE
    je missing_record
    cmp ax, word ptr [si + 0eh]
    je matched_record
    sub si, 12h
    jmp short scan_records
missing_record:
    push word ptr [bp + 6]
    mov ax, OFFSET _catalog_error_text
    push ax
    call _fn_circuit_ega_0ddd8
matched_record:
    mov di, si
    sub di, 12h
    cmp word ptr [di + 10h], 0
    jne return_tail
find_predecessor:
    sub di, 12h
    cmp word ptr [di + 10h], 0
    je find_predecessor
    mov word ptr [si + 10h], 0
    mov bx, word ptr [si + 0ch]
    push bx
    mov ax, word ptr [di + 0eh]
    add ax, word ptr [di + 0ch]
    push ax
    push word ptr [si + 0eh]
    add di, 12h
    cmp si, ds:_G_A2F0
    jne fields_update
    mov ds:_G_A2F0, di
fields_update:
    mov word ptr [di + 0eh], ax
    mov word ptr [di + 0ch], bx
    mov word ptr [di + 10h], 2
    mov cx, 0ch
    xor bx, bx
copy_record:
    mov al, byte ptr [bx + si]
    mov byte ptr [bx + di], al
    inc bx
    loop copy_record
    call _grp_420c3cf4
    add sp, 6
return_success:
    mov dx, word ptr [di + 0eh]
    xor ax, ax
    pop di
    pop si
    pop bp
    ret
return_tail:
    mov di, si
    jmp short return_success
_resource_record_compact ENDP
_TEXT ENDS
END
