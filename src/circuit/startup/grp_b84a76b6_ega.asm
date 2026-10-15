_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_05AE6:NEAR
        EXTRN _FN_CIRCUIT_EGA_05A15:NEAR
        PUBLIC _grp_b84a76b6
_grp_b84a76b6 PROC NEAR
        xor ax, ax
        mov byte ptr ds:[5e3eh], al
        mov word ptr ds:[0906h], ax
        mov word ptr ds:[5ed2h], 0FFCCh
        mov word ptr ds:[5ee2h], 320h
        mov word ptr ds:[5ee4h], 320h
        mov word ptr ds:[5edah], ax
        mov word ptr ds:[5ed4h], ax
        mov word ptr ds:[5ed6h], ax
        mov word ptr ds:[5ed8h], ax
        mov word ptr ds:[5ef0h], ax
        mov byte ptr ds:[5eebh], al
        mov byte ptr ds:[5f3ah], al
        mov byte ptr ds:[5f02h], al
        mov byte ptr ds:[5eb4h], al
        call _FN_CIRCUIT_EGA_05AE6
        mov word ptr ds:[98e8h], 0
        mov word ptr ds:[5e34h], 0FFFFh
        mov word ptr ds:[066ah], 0
        mov word ptr ds:[0a4ch], 0
        mov word ptr ds:[04feh], 0
        mov word ptr ds:[08f2h], 0
        mov word ptr ds:[5efah], 64h
        mov word ptr ds:[5efch], 64h
        mov word ptr ds:[5f04h], 64h
        mov word ptr ds:[9bbch], 0h
        mov word ptr ds:[5f06h], 0h
        mov byte ptr ds:[5ef2h], 0
        xor ax, ax
        mov word ptr ds:[5eeeh], ax
        call _FN_CIRCUIT_EGA_05A15
        xor ax, ax
        mov word ptr ds:[5fd4h], ax
        mov word ptr ds:[9cf6h], ax
        mov word ptr ds:[5fe0h], ax
        mov word ptr ds:[5fdah], ax
        mov word ptr ds:[5fd6h], ax
        mov ax, word ptr ds:[5a7ah]
        mov word ptr ds:[80f4h], ax
        mov word ptr ds:[80f8h], 384h
        mov word ptr ds:[80f6h], 0ffffh
        cmp byte ptr ds:[6Ch], 0
        je short else_path
        mov byte ptr ds:[5f3bh], 1
        mov ax, word ptr ds:[5724h]
        mov word ptr ds:[5edeh], ax
        mov ax, word ptr ds:[57aah]
        mov word ptr ds:[5f40h], ax
        mov ax, word ptr ds:[57ach]
        mov word ptr ds:[5f42h], ax
        jmp short merge_path
        nop
else_path:
        mov byte ptr ds:[5f3bh], 0
        mov ax, word ptr ds:[57a6h]
        mov word ptr ds:[5f40h], ax
        mov ax, word ptr ds:[57a8h]
        mov word ptr ds:[5f42h], ax
merge_path:
        mov ax, word ptr ds:[5f40h]
        mov word ptr ds:[5f44h], ax
        mov ax, word ptr ds:[5f42h]
        mov word ptr ds:[5f46h], ax
        mov word ptr ds:[5ee6h], 190h
        mov al, 1
        mov byte ptr ds:[5eeah], al
        mov byte ptr ds:[5ee8h], al
        ret
_grp_b84a76b6 ENDP
_TEXT ENDS
END
