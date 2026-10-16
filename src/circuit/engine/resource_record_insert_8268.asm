.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
EXTRN _G_A2F0:WORD
EXTRN _G_A2F2:WORD
EXTRN _g_tail:WORD
EXTRN _g_cir_seg0000_8680:BYTE
EXTRN _g_cir_seg0000_8656:BYTE
EXTRN _grp_3919c85a:NEAR
EXTRN _fn_circuit_ega_0ddd8:NEAR
PUBLIC _grp_f93ec5a2
_grp_f93ec5a2 PROC NEAR
    push bp
    mov bp, sp
    push si
    push di
    mov di, ds:_G_A2F0
    mov si, ds:_G_A2F2
    mov dx, word ptr [di+0Eh]
    add dx, word ptr [di+0Ch]
    add di, 12h
    cmp si, di
    jbe scan_current
insert_record:
    mov ds:_G_A2F0, di
    push word ptr [bp+4]
    call _grp_3919c85a
    add sp, 2
    mov si, ax
    xor bx, bx
    mov cx, 0Ch
copy_record:
    mov al, byte ptr [bx+si]
    mov byte ptr [bx+di], al
    inc bx
    loop copy_record
    mov si, ds:_G_A2F2
    mov ax, word ptr [bp+6]
    mov word ptr [di+0Eh], dx
    mov word ptr [di+0Ch], ax
    mov word ptr [di+10h], 2
    add ax, dx
    cmp ax, word ptr [si+0Eh]
    ja scan_forward
return_zero:
    xor ax, ax
    pop di
    pop si
    pop bp
    ret
scan_current:
    cmp si, ds:_g_tail
    je report_first
    add si, 12h
    mov ds:_G_A2F2, si
    jmp short insert_record
report_first:
    push word ptr [bp+4]
    mov ax, OFFSET _g_cir_seg0000_8680
    push ax
    call _fn_circuit_ega_0ddd8
scan_forward:
    mov si, ds:_G_A2F2
    mov di, ds:_G_A2F0
    mov ax, word ptr [di+0Eh]
    add ax, word ptr [di+0Ch]
compare_current:
    cmp ax, word ptr [si+0Eh]
    jbe return_zero
    cmp si, ds:_g_tail
    je report_last
    mov word ptr [si+10h], 0
    add si, 12h
    mov ds:_G_A2F2, si
    jmp short compare_current
report_last:
    push word ptr [bp+4]
    mov ax, OFFSET _g_cir_seg0000_8656
    push ax
    call _fn_circuit_ega_0ddd8
_grp_f93ec5a2 ENDP
_TEXT ENDS
END
