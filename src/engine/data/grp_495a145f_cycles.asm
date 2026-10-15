.8086
DGROUP GROUP DSEG
DSEG SEGMENT BYTE PUBLIC 'DATA'
DSEG ENDS
ASSUME DS:DGROUP
EXTRN _G_STRING_TABLE:WORD
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
PUBLIC _grp_495a145f
_grp_495a145f PROC FAR
        push    bp
        mov     bp,sp
        push    si
        push    di
        push    ds
        pop     es
        mov     dx,word ptr [bp+6]
        mov     si,OFFSET _G_STRING_TABLE
string_scan:
        lodsw
        cmp     ax,dx
        je      short string_found
        inc     ax
        xchg    si,ax
        je      short string_found
        xchg    di,ax
        xor     ax,ax
        mov     cx,0FFFFh
        repne   scasb
        mov     si,di
        jmp     short string_scan
string_found:
        xchg    si,ax
        pop     di
        pop     si
        mov     sp,bp
        pop     bp
        retf 2
_grp_495a145f ENDP
_TEXT ENDS
END
