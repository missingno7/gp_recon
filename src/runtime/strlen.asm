; Exact near-callable DS-string length leaf.
; Input:  [BP+4] = string offset in DS
; Output: AX = length excluding the terminating NUL.
.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
PUBLIC _grp_c4f9f805
_grp_c4f9f805 PROC NEAR
    push    bp
    mov     bp, sp
    mov     dx, di
    mov     ax, ds
    mov     es, ax
    mov     di, [bp+4]
    xor     ax, ax
    mov     cx, 0ffffh
    repne   scasb
    not     cx
    dec     cx
    xchg    cx, ax
    mov     di, dx
    pop     bp
    ret
_grp_c4f9f805 ENDP
_TEXT ENDS
END
