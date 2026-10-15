.8086
CYCLES_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CYCLES_TEXT
        PUBLIC _grp_54458be1
_grp_54458be1 PROC FAR
        push bp
        mov bp,sp
        push ds
        push si
        push di
        sub sp,16
        mov ds,word ptr [bp+8]
        mov si,word ptr [bp+6]
        mov ax,word ptr [bp+0Ah]
        sub ax,word ptr [si+4]
        mov word ptr [bp-8],ax
        mov ax,word ptr [bp+0Ch]
        sub ax,word ptr [si+6]
        mov word ptr [bp-0Ah],ax
        jmp short shared_body
_grp_54458be1 ENDP
        ORG 93
shared_body LABEL NEAR
CYCLES_TEXT ENDS
        END
