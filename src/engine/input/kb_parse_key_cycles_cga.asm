.8086
_TEXT segment word public 'CODE'
assume cs:_TEXT
org 094Ch
public _kb_parse_key
_kb_parse_key proc far
    push bp
    mov bp, sp
    cli
    cmp byte ptr ds:[9512h], 0
    je short kb_parse_key_acquire
    sti
    pop bp
    retf
kb_parse_key_acquire:
    mov byte ptr ds:[9512h], 1
    sti
    mov bx, word ptr [bp+6]
    or bl, bl
    je short kb_parse_key_select_extended
    and bx, 7Fh
    mov word ptr [bp+6], bx
    shl bx, 1
    mov bx, word ptr [bx+9308h]
kb_parse_key_dispatch:
    or bx, bx
    je short kb_parse_key_return_input
    push di
    push si
    mov ax, seg _kb_parse_key
    push ax
    call bx
    pop si
    pop di
    xor ax, ax
    mov byte ptr ds:[9512h], 0
    pop bp
    retf
kb_parse_key_select_extended:
    mov bl, bh
    xor bh, bh
    cmp bx, 84h
    jl short kb_parse_key_scan_extended
    mov bx, 84h
kb_parse_key_scan_extended:
    shl bx, 1
    mov bx, word ptr [bx+9408h]
    jmp short kb_parse_key_dispatch
kb_parse_key_return_input:
    mov ax, word ptr [bp+6]
    mov byte ptr ds:[9512h], 0
    pop bp
    retf
_kb_parse_key endp
_TEXT ends
end
