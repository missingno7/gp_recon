.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _CS_G_0C7CC:WORD
EXTRN _CS_G_0C7CA:WORD
EXTRN _G_4E94:WORD
EXTRN _CS_G_0C7C8:WORD
EXTRN _CS_G_0C7C6:WORD
EXTRN _G_4E9E:WORD
EXTRN _CS_G_0C7BC:WORD
PUBLIC _fn_circuit_ega_09394
_fn_circuit_ega_09394 PROC NEAR
    push bp
    mov bp, sp
    push ds
    push si
    push di
    sub sp, 0Ch
    mov dx, word ptr cs:_CS_G_0C7CC
    mov bx, word ptr cs:_CS_G_0C7CA
    sub dx, bx
    shl bx, 1
    add bx, word ptr cs:_G_4E94
    mov cx, word ptr cs:_CS_G_0C7C8
    mov si, word ptr cs:_CS_G_0C7C6
    sub cx, si
    mov di, word ptr cs:[bx]
    add di, si
    mov ax, word ptr cs:_G_4E9E
    sub ax, cx
    mov word ptr [bp-0Ah], di
    mov word ptr [bp-0Ch], ax
    mov word ptr [bp-0Eh], dx
    mov word ptr [bp-08h], cx
    cmp word ptr cs:_CS_G_0C7BC, 0A000h
    je short L_MODE_ENTRY
    cmp cx, word ptr cs:_G_4E9E
    jne short L_BYTE_PLANES
    mov ax, word ptr cs:_G_4E9E
    imul dx
    shr ax, 1
    mov word ptr [bp-08h], ax
    mov dx, word ptr [bp+4]
    xor si, si
L_WORD_PLANES:
    mov ax, word ptr cs:[si+_CS_G_0C7BC]
    or ax, ax
    je short L_WORD_NEXT
    mov es, ax
    mov di, word ptr [bp-0Ah]
    xor ax, ax
    test dx, 1
    je short L_WORD_FILL
    not ax
L_WORD_FILL:
    mov cx, word ptr [bp-08h]
    rep stosw
L_WORD_NEXT:
    shr dl, 1
    add si, 2
    cmp si, 8
    jl short L_WORD_PLANES
L_EPILOGUE:
    add sp, 0Ch
    pop di
    pop si
    pop ds
    pop bp
    ret
L_MODE_ENTRY:
    jmp short L_MODE_CTRL
    nop
L_BYTE_PLANES:
    mov dx, word ptr [bp+4]
    lea ax, _CS_G_0C7BC
    mov word ptr [bp-10h], ax
    mov byte ptr [bp-12h], 4
L_BYTE_LOOP:
    mov si, word ptr [bp-10h]
    mov ax, word ptr cs:[si]
    or ax, ax
    je short L_BYTE_NEXT
    mov es, ax
    xor ax, ax
    test word ptr [bp+4], 1
    je short L_BYTE_FILL
    not ax
L_BYTE_FILL:
    mov di, word ptr [bp-0Ah]
    mov si, word ptr [bp-0Ch]
    mov dx, word ptr [bp-0Eh]
    mov bx, word ptr [bp-08h]
L_BYTE_FILL_LOOP:
    mov cx, bx
    rep stosb
    add di, si
    dec dx
    jg short L_BYTE_FILL_LOOP
L_BYTE_NEXT:
    shr word ptr [bp+4], 1
    add word ptr [bp-10h], 2
    dec byte ptr [bp-12h]
    jg short L_BYTE_LOOP
    jmp short L_EPILOGUE
L_MODE_CTRL:
    mov dx, 03CEh
    mov al, 5
    out dx, al
    inc dx
    mov al, 2
    out dx, al
    mov dx, 03C4h
    mov al, 2
    out dx, al
    inc dx
    mov al, 0Fh
    out dx, al
    mov es, word ptr cs:_CS_G_0C7BC
    cmp cx, 28h
    jne short L_WIDE_LINES
    mov ax, cx
    mov dx, word ptr [bp-0Eh]
    imul dl
    mov cx, ax
    mov di, word ptr [bp-0Ah]
    mov ax, word ptr [bp+4]
    rep stosb
    mov dx, 03CEh
    mov al, 5
    out dx, al
    inc dx
    mov al, 0
    out dx, al
    add sp, 0Ch
    pop di
    pop si
    pop ds
    pop bp
    ret
L_WIDE_LINES:
    mov di, word ptr [bp-0Ah]
    mov si, word ptr [bp-0Ch]
    mov dx, word ptr [bp-0Eh]
    mov ax, word ptr [bp+4]
L_WIDE_LINE_LOOP:
    mov cx, word ptr [bp-08h]
    rep stosb
    add di, si
    dec dx
    jle short L_WIDE_LINE_LOOP
    jmp near ptr L_EPILOGUE
_fn_circuit_ega_09394 ENDP
_TEXT ENDS
END
