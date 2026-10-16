.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
EXTRN _G_A2F0:WORD
EXTRN _G_A2F2:WORD
EXTRN _g_tail:WORD
EXTRN _grp_3919c85a:NEAR
EXTRN _grp_420c3cf4:NEAR
EXTRN _grp_2a1dacea:NEAR
PUBLIC _grp_b1f1df1b
_grp_b1f1df1b PROC NEAR
    push bp
    mov bp, sp
    push si
    push di
    mov si, ds:_G_A2F2
    push word ptr [bp+4]
    call _grp_3919c85a
    add sp, 2
    mov di, ax
scan_list:
    xor bx, bx
    cmp word ptr [si+10h], 0
    je return_zero
compare_name:
    mov al, byte ptr [bx+di]
    or al, al
    je check_name_end
    cmp byte ptr [bx+si], al
    jne next_record
    inc bx
    cmp bx, 0Ch
    jl compare_name
    jmp short add_record
    nop
check_name_end:
    cmp byte ptr [bx+si], 2Eh
    je add_record
    cmp byte ptr [bx+si], 0
    je add_record
next_record:
    add si, 12h
    cmp si, ds:_g_tail
    jb scan_list
return_zero:
    xor dx, dx
return_ax_zero:
    xor ax, ax
    pop di
    pop si
    pop bp
    ret
add_record:
    mov di, ds:_G_A2F0
    mov dx, word ptr [di+0Eh]
    add dx, word ptr [di+0Ch]
    add di, 12h
    mov ds:_G_A2F0, di
    mov ax, word ptr [si+0Ch]
    push ax
    push dx
    push word ptr [si+0Eh]
    mov word ptr [si+10h], 0
    mov word ptr [di+0Eh], dx
    mov word ptr [di+0Ch], ax
    mov word ptr [di+10h], 2
    xor bx, bx
    mov cx, 0Ch
copy_record:
    mov al, byte ptr [bx+si]
    mov byte ptr [bx+di], al
    inc bx
    loop copy_record
    cmp si, ds:_G_A2F2
    jne after_current_update
    add word ptr ds:_G_A2F2, 12h
after_current_update:
    call _grp_420c3cf4
    add sp, 6
    mov si, ds:_G_A2F2
    mov di, ds:_G_A2F0
scan_live:
    mov ax, word ptr [di+0Eh]
    add ax, word ptr [di+0Ch]
compare_end:
    cmp ax, word ptr [si+0Eh]
    jbe compact
    mov word ptr [si+10h], 0
    add si, 12h
    mov ds:_G_A2F2, si
    jmp short compare_end
compact:
    call _grp_2a1dacea
    mov dx, word ptr [di+0Eh]
    jmp short return_ax_zero
_grp_b1f1df1b ENDP
_TEXT ENDS
END
