.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
QUEUE_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:QUEUE_TEXT, DS:DGROUP
        EXTRN _G_A2F0:WORD, _G_A2EE:WORD
        EXTRN _FN_CYCLES_TANDY_05594:FAR, _GRP_420C3CF4:FAR
        PUBLIC _grp_0f688901
_grp_0f688901 PROC FAR
        push bp
        mov bp, sp
        push si
        push di
        mov ax, word ptr [bp+8]
        mov si, word ptr DGROUP:[_G_A2F0]
find_item:
        cmp si, word ptr DGROUP:[_G_A2EE]
        je short allocate_item
        cmp ax, word ptr [si+0Eh]
        je short found_item
        sub si, 12h
        jmp short find_item
allocate_item:
        push word ptr [bp+8]
        mov ax, 9871h
        push ax
        call far ptr _FN_CYCLES_TANDY_05594
found_item:
        mov di, si
        sub di, 12h
        cmp word ptr [di+10h], 0
        jne short slot_ready_tail
find_free:
        sub di, 12h
        cmp word ptr [di+10h], 0
        je short find_free
slot_ready:
        mov word ptr [si+10h], 0
        mov bx, word ptr [si+0Ch]
        push bx
        mov ax, word ptr [di+0Eh]
        add ax, word ptr [di+0Ch]
        push ax
        push word ptr [si+0Eh]
        add di, 12h
        cmp si, word ptr DGROUP:[_G_A2F0]
        jne short keep_head
        mov word ptr DGROUP:[_G_A2F0], di
keep_head:
        mov word ptr [di+0Eh], ax
        mov word ptr [di+0Ch], bx
        mov word ptr [di+10h], 2
        mov cx, 0Ch
        xor bx, bx
copy_bytes:
        mov al, byte ptr [bx+si]
        mov byte ptr [bx+di], al
        inc bx
        loop short copy_bytes
        call far ptr _GRP_420C3CF4
        add sp, 6
return_tail:
        mov dx, word ptr [di+0Eh]
        xor ax, ax
        pop di
        pop si
        pop bp
        retf
slot_ready_tail:
        mov di, si
        jmp short return_tail
slot_ready_return:
        mov dx, word ptr [di+0Eh]
        xor ax, ax
        pop di
        pop si
        pop bp
        retf
_grp_0f688901 ENDP
QUEUE_TEXT ENDS
        END
