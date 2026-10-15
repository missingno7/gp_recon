PUBLIC _grp_f3a4e254
EXTRN _G_8626:BYTE
EXTRN _FN_CIRCUIT_EGA_0DDD8:NEAR
_TEXT SEGMENT PARA PUBLIC 'CODE'
ASSUME CS:_TEXT
_grp_f3a4e254 PROC NEAR
    push bp
    mov bp, sp
    push ds
    push si
    push di
    mov dx, 1
    cld
    mov ds, word ptr [bp+6]
    mov si, word ptr [bp+4]
    mov ax, SEG _G_8626
    mov es, ax
    mov di, word ptr [bp+8]
    mov cx, 4
    mov bx, 0
check_empty:
    cmp byte ptr es:[bx+di], 0
    je start_search
    inc bx
    loop check_empty
table_setup:
    mov ax, word ptr [si+4]
    add si, 6
    mov bx, si
compare_slots:
    mov si, bx
    mov di, word ptr [bp+8]
    mov cx, 4
compare_four:
    cmpsb
    jne compare_end
    loop compare_four
    jmp success
compare_end:
    cmp byte ptr [si-1], 0
    jne next_slot
    cmp byte ptr es:[di-1], 20h
    je success
next_slot:
    add bx, 4
    dec ax
    jge compare_slots
    or dx, dx
    je return_zero
    mov ax, SEG _G_8626
    mov ds, ax
    push word ptr [bp+8]
    mov ax, OFFSET _G_8626
    push ax
    call _FN_CIRCUIT_EGA_0DDD8
    int 20h
return_zero:
    xor ax, ax
    jmp short finish
    nop
start_search:
    mov byte ptr es:[bx+di], 20h
    inc bx
    loop start_search
    jmp short table_setup
success:
    mov si, word ptr [bp+4]
    mov ax, word ptr [si+4]
    shl ax, 1
    shl ax, 1
    add bx, ax
    shl ax, 1
    add ax, 6
    mov cx, ds
    xor dx, dx
    shl cx, 1
    rcl dx, 1
    shl cx, 1
    rcl dx, 1
    shl cx, 1
    rcl dx, 1
    shl cx, 1
    rcl dx, 1
    add ax, cx
    adc dx, 0
    add ax, word ptr [bx]
    adc dx, word ptr [bx+2]
    mov bx, ax
    and bx, 0fh
    shr dx, 1
    rcr ax, 1
    shr dx, 1
    rcr ax, 1
    shr dx, 1
    rcr ax, 1
    shr dx, 1
    rcr ax, 1
    mov dx, ax
    mov ax, bx
finish:
    pop di
    pop si
    pop ds
    pop bp
    ret
_grp_f3a4e254 ENDP
_TEXT ENDS
END
