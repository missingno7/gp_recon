; GP variant code-segment placement recovered from the exact far-call frame.
.8086
_TEXT segment word public 'CODE'
assume cs:_TEXT
org 08D9h
extrn kb_parse_key:far
public _kb_get_char
_kb_get_char proc far
    mov     ah, 1
    int     16h             ; KEYBOARD - CHECK BUFFER, DO NOT CLEAR
    jnz     short read_buffered_key_char
    xor     ax, ax
    retf
read_buffered_key_char:
    mov     bx, ss
    mov     cx, ds
    cmp     bx, cx
    jnz     short return_keyboard_character
    mov     ah, 0
    int     16h             ; KEYBOARD - READ CHAR FROM BUFFER, WAIT IF EMPTY
    push    ax
    call far ptr kb_parse_key
    add     sp, 2
return_keyboard_character:
    retf

_kb_get_char endp
_TEXT ends
end
