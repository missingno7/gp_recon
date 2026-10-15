_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_03952:NEAR
        EXTRN _FN_CIRCUIT_EGA_05AED:NEAR
        EXTRN _FN_CIRCUIT_EGA_08C84:NEAR
        EXTRN _FN_CIRCUIT_EGA_0B9D2:NEAR
        EXTRN _FN_CIRCUIT_EGA_0F28E:NEAR
        EXTRN _FN_CIRCUIT_EGA_0FE7C:NEAR
        EXTRN _GRP_0376AEFE:NEAR
        EXTRN _GRP_1E9784B3:NEAR
        EXTRN _GRP_2DE0858F:NEAR
        EXTRN _GRP_58B528F2:NEAR
        EXTRN _GRP_640926B3:NEAR
        EXTRN _GRP_921AA84F:NEAR
        EXTRN _GRP_CDDC44DB:NEAR
        PUBLIC _grp_0ab05b10
_grp_0ab05b10 PROC NEAR
        push bp
        mov bp, sp
        sub sp, 12h
        mov ax, 915ch
        push ax
        call _GRP_640926B3
        add sp, 2
        or ax, ax
        jge short L_24B2
        cmp word ptr [bp+4], 0
        jne short L_24B2
        mov ax, 5ah
L_24A3:
        cwd
        push dx
        push ax
        call _GRP_921AA84F
        add sp, 4
L_24AC:
        sub ax, ax
        mov sp, bp
        pop bp
        ret
L_24B2:
        mov ax, 0ch
        push ax
        sub ax, ax
        push ax
        call _FN_CIRCUIT_EGA_08C84
        add sp, 4
        cmp word ptr [bp+4], 0
        je short L_24D2
        mov ax, 0bfh
        push ax
        mov ax, 8
        push ax
        mov ax, 9162h
        jmp short L_24DD
L_24D2:
        mov ax, 0bfh
        push ax
        mov ax, 8
        push ax
        mov ax, 9188h
L_24DD:
        push ax
        call _FN_CIRCUIT_EGA_0B9D2
        add sp, 6
L_24E4:
        mov ax, 0bb8h
        cwd
        push dx
        push ax
        mov ax, 0bfh
        push ax
        mov ax, 0ddh
        push ax
        mov ax, 1
        push ax
        mov ax, 2b4h
        push ax
        call _FN_CIRCUIT_EGA_03952
        add sp, 0ch
        cmp byte ptr ds:[2b4h], 39h
        jg short L_250E
        cmp byte ptr ds:[2b4h], 30h
        jge short L_2515
L_250E:
        cmp byte ptr ds:[2b4h], 20h
        jne short L_24E4
L_2515:
        cmp byte ptr ds:[2b4h], 20h
        je short L_24AC
        mov ax, 91aeh
        push ax
        mov ax, 2b4h
        push ax
        call _GRP_CDDC44DB
        add sp, 4
        cmp word ptr [bp+4], 0
        je short L_2533
        jmp L_25BE
L_2533:
        mov ax, 8002h
        push ax
        mov ax, 2b4h
        push ax
        call _GRP_0376AEFE
        add sp, 4
        mov word ptr [bp-12h], ax
        or ax, ax
        jg short L_254B
        jmp L_2680
L_254B:
        mov ax, 0ah
        push ax
        lea ax, [bp-10h]
        push ax
        push word ptr [bp-12h]
        call _GRP_58B528F2
        add sp, 6
        mov ax, 2aah
        push ax
        lea ax, [bp-10h]
        push ax
        call _GRP_1E9784B3
        add sp, 4
        mov ax, 118h
        push ax
        mov ax, 15ch
        push ax
        push word ptr [bp-12h]
        call _GRP_58B528F2
        add sp, 6
        mov ax, 14h
        push ax
        mov ax, 9ba8h
        push ax
        push word ptr [bp-12h]
        call _GRP_58B528F2
        add sp, 6
        mov ax, 2
        push ax
        mov ax, 288h
        push ax
        push word ptr [bp-12h]
        call _GRP_58B528F2
        add sp, 6
        mov ax, 2
        push ax
        mov ax, 0eeh
        push ax
        push word ptr [bp-12h]
        call _GRP_58B528F2
        add sp, 6
        push word ptr [bp-12h]
        call _FN_CIRCUIT_EGA_0F28E
        add sp, 2
        call _FN_CIRCUIT_EGA_05AED
        mov sp, bp
        pop bp
        ret
L_25BE:
        mov ax, 180h
        push ax
        mov ax, 8302h
        push ax
        mov ax, 2b4h
        push ax
        call _GRP_0376AEFE
        add sp, 6
        mov word ptr [bp-12h], ax
        or ax, ax
        jg short L_25DA
        jmp L_2668
L_25DA:
        mov ax, 0ah
        push ax
        mov ax, 2aah
        push ax
        push word ptr [bp-12h]
        call _GRP_2DE0858F
        add sp, 6
        mov ax, 118h
        push ax
        mov ax, 15ch
        push ax
        push word ptr [bp-12h]
        call _GRP_2DE0858F
        add sp, 6
        mov ax, 14h
        push ax
        mov ax, 9ba8h
        push ax
        push word ptr [bp-12h]
        call _GRP_2DE0858F
        add sp, 6
        mov ax, 2
        push ax
        mov ax, 288h
        push ax
        push word ptr [bp-12h]
        call _GRP_2DE0858F
        add sp, 6
        mov ax, 2
        push ax
        mov ax, 0eeh
        push ax
        push word ptr [bp-12h]
        call _GRP_2DE0858F
        add sp, 6
        cmp ax, 2
        je short L_265C
        mov ax, 2b4h
        push ax
        call _FN_CIRCUIT_EGA_0FE7C
        add sp, 2
        mov ax, 0bfh
        push ax
        mov ax, 0ddh
        push ax
        mov ax, 91b4h
        push ax
        call _FN_CIRCUIT_EGA_0B9D2
        add sp, 6
        mov ax, 12ch
        cwd
        push dx
        push ax
        call _GRP_921AA84F
        add sp, 4
L_265C:
        push word ptr [bp-12h]
        call _FN_CIRCUIT_EGA_0F28E
        add sp, 2
        jmp L_24AC
L_2668:
        mov ax, 0bfh
        push ax
        mov ax, 0ddh
        push ax
        mov ax, 91c2h
        push ax
        call _FN_CIRCUIT_EGA_0B9D2
        add sp, 6
        mov ax, 0c8h
        jmp L_24A3
L_2680:
        mov ax, 0bfh
        push ax
        mov ax, 0ddh
        push ax
        mov ax, 91d0h
        push ax
        call _FN_CIRCUIT_EGA_0B9D2
        add sp, 6
        mov ax, 96h
        cwd
        push dx
        push ax
        call _GRP_921AA84F
        add sp, 4
        mov sp, bp
        pop bp
        ret
_grp_0ab05b10 ENDP
_TEXT ENDS
END
