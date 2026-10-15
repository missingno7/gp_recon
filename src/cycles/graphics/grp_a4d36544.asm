.8086
CYCLES_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CYCLES_TEXT
        PUBLIC _grp_a4d36544
_grp_a4d36544 PROC FAR
        push bp
        mov bp,sp
        push ds
        push si
        push di
        sub sp,16
        mov ds,word ptr [bp+8]
        mov si,word ptr [bp+6]
        mov ax,word ptr [bp+0Ah]
        mov word ptr [bp-8],ax
        mov ax,word ptr [bp+0Ch]
        mov word ptr [bp-0Ah],ax
        jmp short shared_body
_grp_a4d36544 ENDP
        ORG 57
shared_body LABEL NEAR
CYCLES_TEXT ENDS
        END
