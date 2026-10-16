.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
ROMSEG SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:ROMSEG, DS:DGROUP
EXTRN _G_05EBE:WORD
EXTRN _g_7188:WORD
EXTRN _g_66c:WORD
EXTRN _g_66e:WORD
EXTRN _grp_2005c197:NEAR
EXTRN _grp_bbb9e788:NEAR
EXTRN _grp_c3ff30eb:NEAR
EXTRN _grp_e4a1c50f:NEAR
PUBLIC _fn_circuit_ega_0ffc8
_fn_circuit_ega_0ffc8 PROC FAR
    mov ax, ds:_G_05EBE
    mov ds:_g_7188, ax
    push ds
    pop es
    mov bx, 0ffffh
    mov ds:_g_66c, bx
    mov ds:_g_66e, bx
    call _grp_2005c197
    call _grp_bbb9e788
    call _grp_c3ff30eb
    mov si, 0dch
    mov cx, 27h
    mov bp, 4c0h
    add bp, si
    call _grp_e4a1c50f
    retf
_fn_circuit_ega_0ffc8 ENDP
ROMSEG ENDS
END
