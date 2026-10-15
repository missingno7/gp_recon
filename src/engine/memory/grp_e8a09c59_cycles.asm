.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
MEM_INIT_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:MEM_INIT_TEXT, DS:DGROUP
        EXTRN _G_9F66:WORD, _G_9F68:WORD, _G_9F62:WORD, _G_9F64:WORD
        EXTRN _G_A2EE:WORD, _G_A2F0:WORD, _G_A2F2:WORD, _G_A2F4:WORD
        PUBLIC _grp_e8a09c59
_grp_e8a09c59 PROC FAR
        push bp
        mov bp, sp
        push si
        push di
        mov word ptr DGROUP:[_G_9F66], cs
        mov word ptr DGROUP:[_G_9F68], ds
        cmp word ptr DGROUP:[_G_9F62], 0
        jne short link_tables
        mov bx, 64h
        mov ah, 48h
        int 21h
        mov si, word ptr DGROUP:[_G_A2EE]
        mov word ptr [si+0Eh], ax
        mov word ptr DGROUP:[_G_9F64], ax
        mov es, ax
        mov bx, word ptr [bp+06h]
        sub bx, word ptr [si+0Eh]
        mov ah, 4Ah
        int 21h
        mov ah, 4Ah
        int 21h
        mov ax, word ptr DGROUP:[_G_9F64]
        add ax, bx
        mov si, word ptr DGROUP:[_G_A2F4]
        mov word ptr [si+0Eh], ax
        mov word ptr DGROUP:[_G_9F62], ax
link_tables:
        mov si, word ptr DGROUP:[_G_A2F4]
        mov word ptr DGROUP:[_G_A2F2], si
        mov si, word ptr DGROUP:[_G_A2EE]
        mov word ptr DGROUP:[_G_A2F0], si
clear_table:
        add si, 12h
        cmp si, word ptr DGROUP:[_G_A2F4]
        je short done
        mov word ptr [si+10h], 0
        jmp short clear_table
done:
        pop di
        pop si
        pop bp
        retf
_grp_e8a09c59 ENDP
MEM_INIT_TEXT ENDS
        END
