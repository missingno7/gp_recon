.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
PARSE_SIGNED_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:PARSE_SIGNED_TEXT, DS:DGROUP
        EXTRN _G_B218:WORD, _G_B21C:WORD, _G_B22E:WORD
        PUBLIC _grp_dd5f7887
_grp_dd5f7887 PROC FAR
        push bp
        mov bp, sp
        sub sp, 4
        push di
        push si
        mov si, word ptr [bp+08h]
        mov word ptr [bp-2], 1
        cmp byte ptr [si], 2Ah
        jne short optional_minus
        mov bx, word ptr DGROUP:[_G_B218]
        mov di, word ptr [bx]
        add word ptr DGROUP:[_G_B218], 2
        inc si
        jmp short parse_done
        nop
optional_minus:
        cmp byte ptr [si], 2Dh
        jne short start_digits
        mov word ptr [bp-2], 0FFFFh
        inc si
start_digits:
        sub di, di
        cmp byte ptr [si], 30h
        jl short parse_done
        cmp byte ptr [si], 39h
        jg short parse_done
        cmp word ptr DGROUP:[_G_B21C], di
        jne short digit_loop
        cmp byte ptr [si], 30h
        jne short digit_loop
        mov word ptr DGROUP:[_G_B22E], 30h
digit_loop:
        mov al, byte ptr [si]
        cbw
        mov cx, di
        shl cx, 1
        shl cx, 1
        add cx, di
        shl cx, 1
        add cx, ax
        sub cx, 30h
        mov di, cx
        inc si
        cmp byte ptr [si], 30h
        jl short parse_done
        cmp byte ptr [si], 39h
        jle short digit_loop
parse_done:
        mov ax, word ptr [bp-2]
        imul di
        mov di, ax
        mov bx, word ptr [bp+06h]
        mov word ptr [bx], di
        mov ax, si
        pop si
        pop di
        mov sp, bp
        pop bp
        retf
_grp_dd5f7887 ENDP
PARSE_SIGNED_TEXT ENDS
        END
