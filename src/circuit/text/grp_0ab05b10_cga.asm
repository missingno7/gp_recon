_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_03956:NEAR
        EXTRN _FN_CIRCUIT_CGA_059AF:NEAR
        EXTRN _FN_CIRCUIT_CGA_09B70:NEAR
        EXTRN _FN_CIRCUIT_CGA_0AB24:NEAR
        EXTRN _FN_CIRCUIT_CGA_0BDF4:NEAR
        EXTRN _FN_CIRCUIT_CGA_0C44E:NEAR
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
        mov ax, 9134h
        push ax
        call _GRP_640926B3
        add sp, 2
        or ax, ax
        jge short L_24AE
        cmp word ptr [bp+4], 0
        jne short L_24AE
        mov ax, 5ah
L_249F:
        cwd
        push dx
        push ax
        call _GRP_921AA84F
        add sp, 4
L_24A8:
        sub ax, ax
        mov sp, bp
        pop bp
        ret
L_24AE:
        mov ax, 2
        push ax
        sub ax, ax
        push ax
        call _FN_CIRCUIT_CGA_0AB24
        add sp, 4
        cmp word ptr [bp+4], 0
        je short L_24CE
        mov ax, 0bfh
        push ax
        mov ax, 8
        push ax
        mov ax, 913ah
        jmp short L_24D9
L_24CE:
        mov ax, 0bfh
        push ax
        mov ax, 8
        push ax
        mov ax, 9160h
L_24D9:
        push ax
        call _FN_CIRCUIT_CGA_09B70
        add sp, 6
L_24E0:
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
        call _FN_CIRCUIT_CGA_03956
        add sp, 0ch
        cmp byte ptr ds:[2b4h], 39h
        jg short L_250A
        cmp byte ptr ds:[2b4h], 30h
        jge short L_2511
L_250A:
        cmp byte ptr ds:[2b4h], 20h
        jne short L_24E0
L_2511:
        cmp byte ptr ds:[2b4h], 20h
        je short L_24A8
        mov ax, 9186h
        push ax
        mov ax, 2b4h
        push ax
        call _GRP_CDDC44DB
        add sp, 4
        cmp word ptr [bp+4], 0
        je short L_252F
        jmp L_25BA
L_252F:
        mov ax, 8002h
        push ax
        mov ax, 2b4h
        push ax
        call _GRP_0376AEFE
        add sp, 4
        mov word ptr [bp-12h], ax
        or ax, ax
        jg short L_2547
        jmp L_267C
L_2547:
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
        mov ax, 9b78h
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
        call _FN_CIRCUIT_CGA_0BDF4
        add sp, 2
        call _FN_CIRCUIT_CGA_059AF
        mov sp, bp
        pop bp
        ret
L_25BA:
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
        jg short L_25D6
        jmp L_2664
L_25D6:
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
        mov ax, 9b78h
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
        je short L_2658
        mov ax, 2b4h
        push ax
        call _FN_CIRCUIT_CGA_0C44E
        add sp, 2
        mov ax, 0bfh
        push ax
        mov ax, 0ddh
        push ax
        mov ax, 918ch
        push ax
        call _FN_CIRCUIT_CGA_09B70
        add sp, 6
        mov ax, 12ch
        cwd
        push dx
        push ax
        call _GRP_921AA84F
        add sp, 4
L_2658:
        push word ptr [bp-12h]
        call _FN_CIRCUIT_CGA_0BDF4
        add sp, 2
        jmp L_24A8
L_2664:
        mov ax, 0bfh
        push ax
        mov ax, 0ddh
        push ax
        mov ax, 919ah
        push ax
        call _FN_CIRCUIT_CGA_09B70
        add sp, 6
        mov ax, 0c8h
        jmp L_249F
L_267C:
        mov ax, 0bfh
        push ax
        mov ax, 0ddh
        push ax
        mov ax, 91a8h
        push ax
        call _FN_CIRCUIT_CGA_09B70
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
