ROMSEG SEGMENT AT 0db4h
        ORG 6h
ROMCALL LABEL FAR
ROMSEG ENDS
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_00136:NEAR
        EXTRN _FN_CIRCUIT_CGA_00145:NEAR
        EXTRN _FN_CIRCUIT_CGA_001E8:NEAR
        EXTRN _FN_CIRCUIT_CGA_00312:NEAR
        EXTRN _FN_CIRCUIT_CGA_0275A:NEAR
        EXTRN _FN_CIRCUIT_CGA_02852:NEAR
        EXTRN _FN_CIRCUIT_CGA_0399A:NEAR
        EXTRN _FN_CIRCUIT_CGA_04BD4:NEAR
        EXTRN _FN_CIRCUIT_CGA_05524:NEAR
        EXTRN _FN_CIRCUIT_CGA_055DE:NEAR
        EXTRN _FN_CIRCUIT_CGA_05E64:NEAR
        EXTRN _FN_CIRCUIT_CGA_063FE:NEAR
        EXTRN _FN_CIRCUIT_CGA_06558:NEAR
        EXTRN _FN_CIRCUIT_CGA_07786:NEAR
        EXTRN _FN_CIRCUIT_CGA_077B4:NEAR
        EXTRN _FN_CIRCUIT_CGA_0A6B8:NEAR
        EXTRN _FN_CIRCUIT_CGA_0AA10:NEAR
        EXTRN _FN_CIRCUIT_CGA_0AA3B:NEAR
        EXTRN _GRP_0CB3FCB5:NEAR
        EXTRN _GRP_2BAE8498:NEAR
        EXTRN _GRP_43F58D0A:NEAR
        EXTRN _GRP_8E9BB1AC:NEAR
        EXTRN _GRP_B0EF0812:NEAR
        EXTRN _GRP_FCB524BA:NEAR
        EXTRN _GRP_FD52719F:NEAR
        PUBLIC _single_circuit_startup_0010
_single_circuit_startup_0010 PROC NEAR
        push bp
        push ds
        push si
        push di
        call _FN_CIRCUIT_CGA_02852
        call _FN_CIRCUIT_CGA_00136
        mov word ptr ds:[9b8eh], 0
        mov ax, 5ed4h
        push ax
        call _FN_CIRCUIT_CGA_0275A
        add sp, 2
        call _GRP_B0EF0812
        call _FN_CIRCUIT_CGA_063FE
L_0030:
        mov word ptr ds:[33ah], 0
        call _FN_CIRCUIT_CGA_063FE
        call _GRP_8E9BB1AC
        call far ptr ROMCALL
        call _GRP_2BAE8498
        call _FN_CIRCUIT_CGA_04BD4
        call _FN_CIRCUIT_CGA_05E64
        call _FN_CIRCUIT_CGA_055DE
        call _FN_CIRCUIT_CGA_05524
        call _GRP_FD52719F
        call _GRP_0CB3FCB5
        call _FN_CIRCUIT_CGA_0A6B8
        mov word ptr ds:[5ec0h], ax
        mov ax, word ptr ds:[5edeh]
        mov bx, word ptr ds:[5ee8h]
        mov word ptr ds:[5ee8h], ax
        sub ax, bx
        mov word ptr ds:[9b8ch], ax
        push ds
        pop es
        cmp word ptr ds:[7e0h], -1
        je short L_009F
L_0074:
        mov ax, word ptr ds:[5ed4h]
        and ax, 0fh
        je short L_009A
        cmp ax, 1
        je short L_00A2
        cmp ax, 2
        je short L_00B4
        cmp ax, 3
        je short L_00B4
        cmp ax, 4
        je short L_009C
        cmp ax, 7
        je short L_00A5
        cmp ax, 0
        jle short L_00A5
L_009A:
        jmp short L_0030
L_009C:
        jmp L_0120
L_009F:
        jmp short L_00D9
        nop
L_00A2:
        jmp short L_0117
        nop
L_00A5:
        cmp word ptr ds:[5ed2h], 0
        jne short L_009A
        call _FN_CIRCUIT_CGA_0AA3B
        xor bx, bx
        jmp short L_0129
        nop
L_00B4:
        cmp word ptr ds:[5ed2h], 0
        jne short L_009A
        mov word ptr ds:[33ah], 0ffffh
        mov word ptr ds:[5ec6h], 0
        mov word ptr ds:[5ec8h], 0
        call _FN_CIRCUIT_CGA_001E8
        call _FN_CIRCUIT_CGA_06558
        mov bx, 0ffffh
        jmp short L_0129
        nop
L_00D9:
        cmp word ptr ds:[5ed2h], 0
        jne short L_0114
        cmp word ptr ds:[5eb6h], 0fae6h
        jge short L_0114
        call _FN_CIRCUIT_CGA_0AA3B
        call _GRP_FCB524BA
        call _FN_CIRCUIT_CGA_077B4
        call _FN_CIRCUIT_CGA_0399A
        call _FN_CIRCUIT_CGA_07786
        mov word ptr ds:[7e0h], 0
        call _FN_CIRCUIT_CGA_00312
        call _GRP_43F58D0A
        call _FN_CIRCUIT_CGA_00145
        push ds
        mov ax, 5f91h
        push ax
        call _FN_CIRCUIT_CGA_0AA10
        add sp, 4
        jmp L_0030
L_0114:
        jmp L_0074
L_0117:
        mov bx, 1bh
        jmp short L_0129
        nop
L_011D:
        jmp L_0030
L_0120:
        cmp word ptr ds:[9ba4h], 0
        jg short L_011D
        jmp short L_00B4
L_0129:
        push bx
        call _GRP_FCB524BA
        call _FN_CIRCUIT_CGA_077B4
        pop ax
        pop di
        pop si
        pop ds
        pop bp
        ret
_single_circuit_startup_0010 ENDP
_TEXT ENDS
END

