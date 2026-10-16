.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
EXTRN _g_cir_8b44:BYTE
EXTRN _g_cir_8b46:BYTE
EXTRN _g_cir_8b4a:WORD
EXTRN _g_cir_8b4c:WORD
EXTRN _g_cir_8b5a:WORD
EXTRN _g_cir_seg0000_c7bc:WORD
EXTRN _g_cir_seg0000_c7ce:WORD
PUBLIC _fn_circuit_ega_0b9d2
PUBLIC _fn_circuit_ega_0b9e9
_fn_circuit_ega_0b9d2 PROC NEAR
    push bp
    mov bp, sp
    push si
    push di
    sub sp, 0ch
    mov ax, [bp+6]
    mov ds:_g_cir_8b4a, ax
    mov ax, [bp+8]
    mov ds:_g_cir_8b4c, ax
    jmp short raster_body
_fn_circuit_ega_0b9d2 ENDP
    nop
_fn_circuit_ega_0b9e9 PROC NEAR
    push bp
    mov bp, sp
    push si
    push di
    sub sp, 0ch
raster_body:
    cmp word ptr cs:_g_cir_seg0000_c7bc, 0a000h
    jne mode_done
    mov cl, byte ptr ds:_g_cir_8b44
    mov ch, byte ptr ds:_g_cir_8b46
    mov bx, cx
    xor cl, ch
    not cl
    mov byte ptr [bp-10h], cl
    mov dx, 03ceh
    mov al, 1
    out dx, al
    inc dx
    mov al, cl
    out dx, al
    and bl, bh
    mov dx, 03ceh
    mov al, 0
    out dx, al
    inc dx
    mov al, bl
    out dx, al
mode_done:
    mov ax, word ptr cs:_g_cir_seg0000_c7ce
    mov word ptr [bp-6], ax
    mov es, word ptr cs:_g_cir_seg0000_c7bc
    cld
    mov ax, word ptr ds:_g_cir_8b5a
    cmp ax, 1
    je raster_done
    mov dx, 03ceh
    mov al, 1
    out dx, al
    inc dx
    mov al, 0
    out dx, al
    add sp, 0ch
    pop di
    pop si
    pop bp
    ret
raster_done:
_fn_circuit_ega_0b9e9 ENDP
_TEXT ENDS
END
