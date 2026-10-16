.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _grp_fe15c5cd:NEAR
PUBLIC _ega_graphics_controller_init
_ega_graphics_controller_init PROC NEAR
    mov dx, 03CEh
    mov al, 5
    out dx, al
    inc dx
    mov al, 0
    out dx, al
    mov dx, 03CEh
    mov al, 1
    out dx, al
    inc dx
    mov al, 0
    out dx, al
    mov dx, 03CEh
    mov al, 8
    out dx, al
    inc dx
    mov al, 0FFh
    out dx, al
    mov dx, 03CEh
    mov al, 3
    out dx, al
    inc dx
    mov al, 0
    out dx, al
    mov ax, 0
    push ax
    call near ptr _grp_fe15c5cd
    add sp, 2
    mov ax, 40h
    mov es, ax
    mov ax, word ptr es:[10h]
    and ax, 0FFCFh
    or ax, 10h
    mov word ptr es:[10h], ax
    mov ah, 0
    mov al, 0Dh
    int 10h
    mov ax, ds
    mov es, ax
    mov ah, 10h
    mov al, 2
    mov dx, 8B6Ch
    int 10h
    ret
_ega_graphics_controller_init ENDP
_TEXT ENDS
END
