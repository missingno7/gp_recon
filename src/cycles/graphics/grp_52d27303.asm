.8086
CYCLES_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CYCLES_TEXT
        PUBLIC _grp_52d27303
_grp_52d27303 PROC FAR
        push bp
        mov bp,sp
        push ds
        push si
        push di
        sub sp,8
        mov ds,word ptr [bp+8]
        mov si,word ptr [bp+6]
        mov ax,word ptr [bp+0Ah]
        sub ax,word ptr [si+4]
        mov word ptr [bp-8],ax
        mov ax,word ptr [bp+0Ch]
        sub ax,word ptr [si+6]
        mov word ptr [bp-0Ah],ax
        jmp short shared_body
_grp_52d27303 ENDP
        ORG 96
shared_body LABEL NEAR
CYCLES_TEXT ENDS
        END
