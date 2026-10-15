; Exact near-callable scanner for a DS string path.
; Input:  [BP+4] = string offset in DS
; Output: AX = offset after the final ':' or '\\', or the original
;         string offset when neither separator occurs.
; The scan uses LODSB and updates the saved argument only at separators.
.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
PUBLIC _grp_3919c85a
_grp_3919c85a PROC NEAR
    push    bp
    mov     bp, sp
    push    si
    mov     si, [bp+4]
path_scan_loop:
    lodsb
    or      al, al
    je      short path_scan_done
    cmp     al, 3ah
    je      short path_scan_save
    cmp     al, 5ch
    jne     short path_scan_loop
path_scan_save:
    mov     [bp+4], si
    jmp     short path_scan_loop
path_scan_done:
    mov     ax, [bp+4]
    pop     si
    pop     bp
    ret
_grp_3919c85a ENDP
_TEXT ENDS
END
