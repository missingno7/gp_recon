.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
_G_056A_6971 EQU 06971h
_g_cga_a2f6 EQU 0a2f6h
ORG 06924h
PUBLIC _vector_angle_from_delta
_vector_angle_from_delta PROC FAR
    push bp
    mov bp, sp
    push di
    xor di, di
    mov dx, WORD PTR [bp+6]
    mov cx, WORD PTR [bp+8]
    or dx, dx
    jge SHORT nonnegative_x
    or di, 8
    neg dx
nonnegative_x:
    or cx, cx
    jge SHORT nonnegative_y
    or di, 4
    neg cx
nonnegative_y:
    cmp dx, cx
    jl SHORT divide_ratio
    je SHORT equal_delta
    xchg dx, cx
    or di, 2
divide_ratio:
    xor ax, ax
    div cx
    mov bl, ah
    xor bh, bh
    add al, 80h
    adc bx, 0
    mov al, BYTE PTR [bx+_g_cga_a2f6]
    xor ah, ah
    jmp WORD PTR cs:[di+_G_056A_6971]
equal_delta:
    or dx, dx
    je SHORT return_result
    mov ax, 80h
    jmp WORD PTR cs:[di+_G_056A_6971]
switch_table:
    DW OFFSET return_result
    DW OFFSET case_xneg
    DW OFFSET case_yneg
    DW OFFSET case_xyneg
    DW OFFSET case_majx
    DW OFFSET case_xmaj_xneg
    DW OFFSET case_ymaj_xneg
    DW OFFSET case_xymaj
case_xneg:
    neg ax
    add ah, 1
return_result:
    pop di
    pop bp
    retf
case_xyneg:
    add ah, 1
    jmp SHORT return_result
case_yneg:
    neg ax
    add ah, 2
    jmp SHORT return_result
case_majx:
    neg ax
    jmp SHORT return_result
case_xmaj_xneg:
    sub ah, 1
    jmp SHORT return_result
case_xymaj:
    add ah, 1
    neg ax
    jmp SHORT return_result
case_ymaj_xneg:
    sub ah, 2
    jmp SHORT return_result
_vector_angle_from_delta ENDP
_TEXT ENDS
END
