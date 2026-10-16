.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _fn_circuit_ega_0b184
_fn_circuit_ega_0b184 PROC NEAR
    push bp
    mov bp, sp
    mov ax, 0B492h
    mov word ptr [bp-40h], ax
    mov ax, 0B4A2h
    mov word ptr [bp-4Ah], ax
    mov byte ptr [bp-42h], 0
    mov byte ptr [bp-41h], 3
    push ds
    push si
    push di
    sub sp, 44h
    mov ds, word ptr [bp+6]
    mov si, word ptr [bp+4]
    mov ax, word ptr [bp+8]
    mov word ptr [bp-8], ax
    mov ax, word ptr [bp+0Ah]
    mov word ptr [bp-0Ah], ax
    jmp short $+32h
    nop
_fn_circuit_ega_0b184 ENDP
_TEXT ENDS
END
