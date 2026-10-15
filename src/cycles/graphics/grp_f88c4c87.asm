.8086
DISP0_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:DISP0_TEXT
        EXTRN _DISP0_G_4802:WORD, _G_4192:WORD
        PUBLIC _grp_f88c4c87
_grp_f88c4c87 PROC FAR
        push bp
        mov bp,sp
        sub sp,14
        push si
        push di
        mov si,word ptr [bp+6]
        mov ax,word ptr [si]
        mov dx,word ptr [si+2]
        add ax,8000h
        adc dx,0
        mov word ptr [bp-2],ax
        mov word ptr [bp-4],dx
        mov ax,word ptr [si+4]
        mov dx,word ptr [si+6]
        add ax,8000h
        adc dx,0
        mov word ptr [bp-6],ax
        mov word ptr [bp-8],dx
        mov al,byte ptr [si+0Ch]
        mov byte ptr [bp-0Eh],al
        mov ax,word ptr [si+8]
        mov word ptr [bp-0Ah],ax
        mov ax,word ptr cs:[_DISP0_G_4802]
        mov es,ax
        mov bx,word ptr [si+0Eh]
        shl bx,1
        jmp word ptr cs:[bx+_G_4192]
_grp_f88c4c87 ENDP
DISP0_TEXT ENDS
        END
