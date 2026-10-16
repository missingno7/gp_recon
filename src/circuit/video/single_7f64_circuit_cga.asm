_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_7f64
_g_08442 EQU 8442h
_g_08444 EQU 8444h
_g_08664 EQU 8664h
_g_08666 EQU 8666h
EXTRN _FN_CIRCUIT_CGA_06B72:NEAR
EXTRN _FN_CIRCUIT_CGA_08365:NEAR
EXTRN _FN_CIRCUIT_CGA_08376:NEAR
EXTRN _FN_CIRCUIT_CGA_0837E:NEAR
EXTRN _FN_CIRCUIT_CGA_09B70:NEAR
EXTRN _FN_CIRCUIT_CGA_0AB24:NEAR
EXTRN _FN_CIRCUIT_CGA_0B418:NEAR
EXTRN _FN_CIRCUIT_CGA_0B8F2:NEAR
EXTRN _GRP_622C4ED2:NEAR
EXTRN _GRP_7B77C400:NEAR
EXTRN _GRP_E26C8DBC:NEAR
ORG 9004h
_grp_7f64 PROC NEAR
        push bp
        mov bp, sp
        sub sp, 8eh
        push si
        lea ax, [bp - 86h]
        push ax
        call _GRP_E26C8DBC
        add sp, 2
        mov ax, 0a854h
        mov dx, SEG _TEXT
        push dx
        push ax
        call _FN_CIRCUIT_CGA_0B418
        add sp, 4
        call _FN_CIRCUIT_CGA_08376
        mov word ptr [bp - 8eh], ax
        mov ax, 8351h
        push ax
        call _FN_CIRCUIT_CGA_08365
        add sp, 2
        mov word ptr [bp - 8ah], 0
L_903C:
        sub ax, ax
        push ax
        call _FN_CIRCUIT_CGA_06B72
        add sp, 2
        sub ax, ax
        push ax
        mov ax, 1
        push ax
        call _FN_CIRCUIT_CGA_0AB24
        add sp, 4
        push word ptr ds:[_g_08444]
        push word ptr ds:[_g_08442]
        mov ax, 94dch
        push ax
        lea ax, [bp - 52h]
        push ax
        call _GRP_7B77C400
        add sp, 8
        sub ax, ax
        push ax
        lea ax, [bp - 52h]
        push ax
        call _GRP_622C4ED2
        add sp, 4
        mov ax, 8
        push ax
        sub ax, ax
        push ax
        mov ax, 94f0h
        push ax
        call _FN_CIRCUIT_CGA_09B70
        add sp, 6
        mov word ptr [bp - 88h], 0
        mov word ptr [bp - 2ah], 0
        jmp short L_90D8
        nop
L_9094:
        sub ax, ax
        push ax
        mov ax, 1
L_909A:
        push ax
        call _FN_CIRCUIT_CGA_0AB24
        add sp, 4
        mov ax, word ptr [bp - 8ah]
        cmp word ptr [bp - 88h], ax
        jl short L_90D1
        add ax, 14h
        cmp ax, word ptr [bp - 88h]
        jle short L_90D1
        mov ax, word ptr [bp - 88h]
        sub ax, word ptr [bp - 8ah]
        mov cl, 3
        shl ax, cl
        add ax, 12h
        push ax
        sub ax, ax
        push ax
        lea ax, [bp - 28h]
        push ax
        call _FN_CIRCUIT_CGA_09B70
        add sp, 6
L_90D1:
        inc word ptr [bp - 88h]
L_90D5:
        inc word ptr [bp - 2ah]
L_90D8:
        cmp word ptr [bp - 2ah], 1eh
        jge short L_9130
        mov ax, 12h
        imul word ptr [bp - 2ah]
        mov si, ax
        cmp word ptr [si - 7baah], 0
        je short L_90D5
        push word ptr [si - 7baah]
        push word ptr [si - 7bach]
        push word ptr [si - 7baeh]
        add ax, 8446h
        push ax
        push word ptr [bp - 2ah]
        mov ax, 9514h
        push ax
        lea ax, [bp - 28h]
        push ax
        call _GRP_7B77C400
        add sp, 0eh
        mov ax, si
        add ax, 8446h
        cmp ax, word ptr ds:[_g_08666]
        je short L_9127
        mov ax, si
        add ax, 8446h
        cmp ax, word ptr ds:[_g_08664]
        je short L_9127
        jmp near ptr L_9094
L_9127:
        mov ax, 1
        push ax
        sub ax, ax
        jmp near ptr L_909A
L_9130:
        call _FN_CIRCUIT_CGA_0837E
        mov word ptr [bp - 8ch], ax
        cmp ax, 5100h
        jne short L_914C
        cmp word ptr [bp - 8ah], 0
        jne short L_914C
        add word ptr [bp - 8ah], 14h
        jmp near ptr L_903C
        nop
L_914C:
        cmp word ptr [bp - 8ch], 4900h
        jne short L_9164
        cmp word ptr [bp - 8ah], 0
        je short L_9164
        sub word ptr [bp - 8ah], 14h
        jmp near ptr L_903C
        nop
L_9164:
        cmp word ptr [bp - 8ch], 1bh
        je short L_916E
        jmp near ptr L_903C
L_916E:
        push word ptr [bp - 8eh]
        call _FN_CIRCUIT_CGA_08365
        add sp, 2
        lea ax, [bp - 86h]
        push ax
        call _FN_CIRCUIT_CGA_0B8F2
        add sp, 2
        pop si
        mov sp, bp
        pop bp
        ret
_grp_7f64 ENDP
_TEXT ENDS
END
