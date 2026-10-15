.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
INITIALIZE_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:INITIALIZE_TEXT, DS:DGROUP
        EXTRN _G_A738:WORD, _G_A738_TEXT:WORD, _G_A73A:WORD, _G_A73E:WORD
        EXTRN _GRP_759F46BF:NEAR, _GRP_2C45569D:NEAR
        PUBLIC _grp_69ac66a9
_grp_69ac66a9 PROC NEAR
        push bp
        mov bp,sp
        push si
        push di
        mov bx,OFFSET _G_A738_TEXT
        cmp word ptr [bx],0
        jne short already_initialized
        push ds
        pop es
        mov ax,5
        call _GRP_759F46BF
        jne short allocate_ok
        xor ax,ax
        cwd
        jmp short cleanup
allocate_ok:
        inc ax
        and al,0FEh
        mov word ptr ds:[_G_A738],ax
        mov word ptr ds:[_G_A73A],ax
        xchg si,ax
        mov word ptr [si],1
        add si,4
        mov word ptr [si-2],0FFFEh
        mov word ptr ds:[_G_A73E],si
already_initialized:
        mov cx,word ptr [bp+4]
        mov ax,ds
        mov es,ax
        call _GRP_2C45569D
cleanup:
        pop di
        pop si
        mov sp,bp
        pop bp
        ret
_grp_69ac66a9 ENDP
INITIALIZE_TEXT ENDS
        END
