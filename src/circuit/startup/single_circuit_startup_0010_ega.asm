ROMSEG SEGMENT AT 0ffch
        ORG 8h
ROMCALL LABEL FAR
ROMSEG ENDS
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_00136:NEAR
        EXTRN _FN_CIRCUIT_EGA_00145:NEAR
        EXTRN _FN_CIRCUIT_EGA_001EB:NEAR
        EXTRN _FN_CIRCUIT_EGA_00315:NEAR
        EXTRN _FN_CIRCUIT_EGA_0275E:NEAR
        EXTRN _FN_CIRCUIT_EGA_02856:NEAR
        EXTRN _FN_CIRCUIT_EGA_03992:NEAR
        EXTRN _FN_CIRCUIT_EGA_04CF4:NEAR
        EXTRN _FN_CIRCUIT_EGA_0566E:NEAR
        EXTRN _FN_CIRCUIT_EGA_05728:NEAR
        EXTRN _FN_CIRCUIT_EGA_05F94:NEAR
        EXTRN _FN_CIRCUIT_EGA_06558:NEAR
        EXTRN _FN_CIRCUIT_EGA_066B2:NEAR
        EXTRN _FN_CIRCUIT_EGA_06EE8:NEAR
        EXTRN _FN_CIRCUIT_EGA_06F16:NEAR
        EXTRN _FN_CIRCUIT_EGA_08B08:NEAR
        EXTRN _FN_CIRCUIT_EGA_08B70:NEAR
        EXTRN _FN_CIRCUIT_EGA_08B9B:NEAR
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
        call _FN_CIRCUIT_EGA_02856
        call _FN_CIRCUIT_EGA_00136
        mov word ptr ds:[9bbeh], 0
        mov ax, 5ef0h
        push ax
        call _FN_CIRCUIT_EGA_0275E
        add sp, 2
        call _GRP_B0EF0812
        call _FN_CIRCUIT_EGA_06558
L_0030:
        mov word ptr ds:[33ah], 0
        call _FN_CIRCUIT_EGA_06558
        call _GRP_8E9BB1AC
        call far ptr ROMCALL
        call _GRP_2BAE8498
        call _FN_CIRCUIT_EGA_04CF4
        call _FN_CIRCUIT_EGA_05F94
        call _FN_CIRCUIT_EGA_05728
        call _FN_CIRCUIT_EGA_0566E
        call _GRP_FD52719F
        call _GRP_0CB3FCB5
        call _FN_CIRCUIT_EGA_08B08
        mov word ptr ds:[5edch], ax
        mov ax, word ptr ds:[5efah]
        mov bx, word ptr ds:[5f04h]
        mov word ptr ds:[5f04h], ax
        sub ax, bx
        mov word ptr ds:[9bbch], ax
        push ds
        pop es
        cmp word ptr ds:[7e0h], -1
        je short L_009F
L_0074:
        mov ax, word ptr ds:[5ef0h]
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
        cmp word ptr ds:[5eeeh], 0
        jne short L_009A
        call _FN_CIRCUIT_EGA_08B9B
        xor bx, bx
        jmp short L_0129
        nop
L_00B4:
        cmp word ptr ds:[5eeeh], 0
        jne short L_009A
        mov word ptr ds:[33ah], 0ffffh
        mov word ptr ds:[5ee2h], 0
        mov word ptr ds:[5ee4h], 0
        call _FN_CIRCUIT_EGA_001EB
        call _FN_CIRCUIT_EGA_066B2
        mov bx, 0ffffh
        jmp short L_0129
        nop
L_00D9:
        cmp word ptr ds:[5eeeh], 0
        jne short L_0114
        cmp word ptr ds:[5ed2h], 0fae6h
        jge short L_0114
        call _FN_CIRCUIT_EGA_08B9B
        call _GRP_FCB524BA
        call _FN_CIRCUIT_EGA_06F16
        call _FN_CIRCUIT_EGA_03992
        call _FN_CIRCUIT_EGA_06EE8
        mov word ptr ds:[7e0h], 0
        call _FN_CIRCUIT_EGA_00315
        call _GRP_43F58D0A
        call _FN_CIRCUIT_EGA_00145
        push ds
        mov ax, 5fadh
        push ax
        call _FN_CIRCUIT_EGA_08B70
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
        cmp word ptr ds:[9bd4h], 0
        jg short L_011D
        jmp short L_00B4
L_0129:
        push bx
        call _GRP_FCB524BA
        call _FN_CIRCUIT_EGA_06F16
        pop ax
        pop di
        pop si
        pop ds
        pop bp
        ret
_single_circuit_startup_0010 ENDP
_TEXT ENDS
END



