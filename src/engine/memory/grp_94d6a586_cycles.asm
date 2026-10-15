.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
ALLOC_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:ALLOC_TEXT, DS:DGROUP
        EXTRN _G_A540:WORD, _G_A590:WORD
        EXTRN _GRP_1A4C7479:NEAR
        PUBLIC _grp_94d6a586
_grp_94d6a586 PROC FAR
        push bp
        mov bp, sp
        push si
        push di
        push es
        cmp word ptr [bp+0Ah], 0
        jne short no_allocate
        mov di, OFFSET DGROUP:_G_A540
        mov dx, word ptr [bp+08h]
        mov ax, word ptr [bp+06h]
        dec ax
        jne short existing_block
        call _GRP_1A4C7479
        jb short no_allocate
        jmp short success
existing_block:
        mov si, word ptr DGROUP:[_G_A590]
        dec ax
        je short scan_next
        cmp si, di
        je short scan_next
        mov ax, word ptr [si+2]
        mov word ptr [bp+0Eh], ax
        push si
        call _GRP_1A4C7479
        pop si
        jae short success
scan_next:
        add si, 4
        cmp si, OFFSET DGROUP:_G_A590
        jae short no_allocate
        or dx, dx
        jne short allocate_block
no_allocate:
        mov ax, 0FFFFh
        cwd
        jmp short success
allocate_block:
        mov bx, dx
        add bx, 0Fh
        rcr bx, 1
        mov cl, 3
        shr bx, cl
        mov ah, 48h
        int 21h
        jb short no_allocate
        xchg dx, ax
        mov word ptr [si], ax
        mov word ptr [si+2], dx
        mov word ptr DGROUP:[_G_A590], si
        xor ax, ax
success:
        pop es
        pop di
        pop si
        mov sp, bp
        pop bp
        retf
_grp_94d6a586 ENDP
ALLOC_TEXT ENDS
        END
