PUBLIC _grp_56eef547
EXTRN _GRP_B1F1DF1B:NEAR
EXTRN _FN_CIRCUIT_EGA_06A7A:NEAR
EXTRN _FN_CIRCUIT_EGA_06A0E:NEAR
EXTRN _GRP_F93EC5A2:NEAR
EXTRN _GRP_5306DD97:NEAR
_TEXT SEGMENT PARA PUBLIC 'CODE'
ASSUME CS:_TEXT
_grp_56eef547 PROC NEAR
    push bp
    mov bp, sp
    push si
    push di
    push word ptr [bp+4]
    call _GRP_B1F1DF1B
    add sp, 2
    or dx, dx
    jne short done
    push word ptr [bp+4]
    call _FN_CIRCUIT_EGA_06A7A
    add sp, 2
    inc ax
    mov si, ax
    push word ptr [bp+4]
    call _FN_CIRCUIT_EGA_06A0E
    add sp, 2
    push si
    mov di, si
    sub di, ax
    push word ptr [bp+4]
    call _GRP_F93EC5A2
    add sp, 4
    push di
    push si
    push dx
    push word ptr [bp+4]
    call _GRP_5306DD97
    add sp, 8
done:
    pop di
    pop si
    pop bp
    ret
_grp_56eef547 ENDP
_TEXT ENDS
END
