.8086
CYCLES_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CYCLES_TEXT
        PUBLIC _grp_94479a00
_grp_94479a00 PROC FAR
        push bp
        mov bp,sp
        push ds
        push si
        push di
        sub sp,8
        mov ds,word ptr [bp+8]
        mov si,word ptr [bp+6]
        mov ax,word ptr [bp+0Ah]
        mov word ptr [bp-8],ax
        mov ax,word ptr [bp+0Ch]
        mov word ptr [bp-0Ah],ax
        jmp short shared_body
_grp_94479a00 ENDP
        ORG 60
shared_body LABEL NEAR
CYCLES_TEXT ENDS
        END
