.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
RESOURCE_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:RESOURCE_TEXT, DS:DGROUP
        EXTRN _GRP_7D50CA88:FAR
        EXTRN _G_5A6E:WORD
        PUBLIC _grp_7533f10a
_grp_7533f10a PROC FAR
        push bp
        mov bp, sp
        sub sp, 0Eh
        push ds
        push si
        push di
        cld
        mov ax, word ptr [bp+8]
        mov ds, ax
        mov ax, word ptr [bp+6]
        mov si, ax
        mov ax, word ptr [bp+0Ch]
        mov word ptr [bp-0Ah], ax
        mov ax, word ptr [bp+0Ah]
        mov word ptr [bp-8], ax
        mov bx, word ptr [si+4]
        mov word ptr [bp-2], bx
        mov word ptr [bp-4], 0
loop_loop:
        push word ptr [bp-4]
        push word ptr [bp+8]
        push word ptr [bp+6]
        mov ax, SEG DGROUP
        mov ds, ax
        call far ptr _GRP_7D50CA88
        add sp, 6
        mov word ptr [bp-6], ax
        mov si, ax
        mov ds, dx
        mov di, word ptr [bp-8]
        mov es, word ptr [bp-0Ah]
        mov al, byte ptr [si+0Fh]
        and al, 0F0h
        jne short loop_advance
        mov al, byte ptr [si+0Eh]
        shr al, 1
        shr al, 1
        shr al, 1
        shr al, 1
        je short loop_advance
        cmp al, 4
        jb short loop_dispatch
        mov ax, 1
        jmp short loop_return
        nop
loop_advance:
        inc word ptr [bp-4]
        dec word ptr [bp-2]
        jg short loop_loop
        xor ax, ax
loop_return:
        pop di
        pop si
        pop ds
        mov sp, bp
        pop bp
        retf
loop_dispatch:
        mov dx, word ptr [si]
        mov word ptr [bp-0Ch], dx
        mov dx, word ptr [si+2]
        mov word ptr [bp-0Eh], dx
        xor dx, dx
        xor ah, ah
        mov bx, ax
        dec bx
        shl bx, 1
        jmp word ptr cs:[bx+_G_5A6E]
_grp_7533f10a ENDP
RESOURCE_TEXT ENDS
        END
