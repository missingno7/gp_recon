; Reconstructed MSC STRLEN medium-model library leaf (MLIBCR.LIB).
; Far caller supplies the near DS string offset at BP+6.
.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
PUBLIC _runtime_strlen_medium
_runtime_strlen_medium PROC FAR
    push bp
    mov bp, sp
    mov dx, di
    mov ax, ds
    mov es, ax
    mov di, [bp+6]
    xor ax, ax
    mov cx, 0ffffh
    repne scasb
    not cx
    dec cx
    xchg cx, ax
    mov di, dx
    pop bp
    ret
_runtime_strlen_medium ENDP
_TEXT ENDS
END
