_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_7f64
_g_086e2 EQU 86e2h
_g_086e4 EQU 86e4h
_g_08904 EQU 8904h
_g_08906 EQU 8906h
EXTRN _FN_CIRCUIT_EGA_078B9:NEAR
EXTRN _FN_CIRCUIT_EGA_078CA:NEAR
EXTRN _FN_CIRCUIT_EGA_078D2:NEAR
EXTRN _FN_CIRCUIT_EGA_08C84:NEAR
EXTRN _FN_CIRCUIT_EGA_08CD8:NEAR
EXTRN _FN_CIRCUIT_EGA_0B9D2:NEAR
EXTRN _FN_CIRCUIT_EGA_0DE26:NEAR
EXTRN _GRP_622C4ED2:NEAR
EXTRN _GRP_7B77C400:NEAR
EXTRN _GRP_E26C8DBC:NEAR
EXTRN _GRP_FE15C5CD:NEAR
ORG 7F64h
_grp_7f64 PROC NEAR
        push bp
        mov bp, sp
        sub sp, 8eh
        push si
        lea ax, [bp - 86h]
        push ax
        call _GRP_E26C8DBC
        add sp, 2
        mov ax, 0c7d4h
        mov dx, SEG _TEXT
        push dx
        push ax
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        call _FN_CIRCUIT_EGA_078CA
        mov word ptr [bp - 8eh], ax
        mov ax, 78a5h
        push ax
        call _FN_CIRCUIT_EGA_078B9
        add sp, 2
        mov word ptr [bp - 8ah], 0
L_7F9C:
        sub ax, ax
        push ax
        call _GRP_FE15C5CD
        add sp, 2
        sub ax, ax
        push ax
        mov ax, 1
        push ax
        call _FN_CIRCUIT_EGA_08C84
        add sp, 4
        push word ptr ds:[_g_086e4]
        push word ptr ds:[_g_086e2]
        mov ax, 9420h
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
        mov ax, 9434h
        push ax
        call _FN_CIRCUIT_EGA_0B9D2
        add sp, 6
        mov word ptr [bp - 88h], 0
        mov word ptr [bp - 2ah], 0
        jmp short L_8038
        nop
L_7FF4:
        sub ax, ax
        push ax
        mov ax, 1
L_7FFA:
        push ax
        call _FN_CIRCUIT_EGA_08C84
        add sp, 4
        mov ax, word ptr [bp - 8ah]
        cmp word ptr [bp - 88h], ax
        jl short L_8031
        add ax, 14h
        cmp ax, word ptr [bp - 88h]
        jle short L_8031
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
        call _FN_CIRCUIT_EGA_0B9D2
        add sp, 6
L_8031:
        inc word ptr [bp - 88h]
L_8035:
        inc word ptr [bp - 2ah]
L_8038:
        cmp word ptr [bp - 2ah], 1eh
        jge short L_8090
        mov ax, 12h
        imul word ptr [bp - 2ah]
        mov si, ax
        cmp word ptr [si - 790ah], 0
        je short L_8035
        push word ptr [si - 790ah]
        push word ptr [si - 790ch]
        push word ptr [si - 790eh]
        add ax, 86e6h
        push ax
        push word ptr [bp - 2ah]
        mov ax, 9458h
        push ax
        lea ax, [bp - 28h]
        push ax
        call _GRP_7B77C400
        add sp, 0eh
        mov ax, si
        add ax, 86e6h
        cmp ax, word ptr ds:[_g_08906]
        je short L_8087
        mov ax, si
        add ax, 86e6h
        cmp ax, word ptr ds:[_g_08904]
        je short L_8087
        jmp near ptr L_7FF4
L_8087:
        mov ax, 1
        push ax
        sub ax, ax
        jmp near ptr L_7FFA
L_8090:
        call _FN_CIRCUIT_EGA_078D2
        mov word ptr [bp - 8ch], ax
        cmp ax, 5100h
        jne short L_80AC
        cmp word ptr [bp - 8ah], 0
        jne short L_80AC
        add word ptr [bp - 8ah], 14h
        jmp near ptr L_7F9C
        nop
L_80AC:
        cmp word ptr [bp - 8ch], 4900h
        jne short L_80C4
        cmp word ptr [bp - 8ah], 0
        je short L_80C4
        sub word ptr [bp - 8ah], 14h
        jmp near ptr L_7F9C
        nop
L_80C4:
        cmp word ptr [bp - 8ch], 1bh
        je short L_80CE
        jmp near ptr L_7F9C
L_80CE:
        push word ptr [bp - 8eh]
        call _FN_CIRCUIT_EGA_078B9
        add sp, 2
        lea ax, [bp - 86h]
        push ax
        call _FN_CIRCUIT_EGA_0DE26
        add sp, 2
        pop si
        mov sp, bp
        pop bp
        ret
_grp_7f64 ENDP
_TEXT ENDS
END
