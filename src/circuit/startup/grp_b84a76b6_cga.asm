_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_0599C:NEAR
        EXTRN _FN_CIRCUIT_CGA_058CB:NEAR
        PUBLIC _grp_b84a76b6
_grp_b84a76b6 PROC NEAR
        xor ax, ax
        mov byte ptr ds:[5e3ah], al
        mov word ptr ds:[0902h], ax
        mov word ptr ds:[5eb6h], 0FFCCh
        mov word ptr ds:[5ec6h], 320h
        mov word ptr ds:[5ec8h], 320h
        mov word ptr ds:[5ebeh], ax
        mov word ptr ds:[5eb8h], ax
        mov word ptr ds:[5ebah], ax
        mov word ptr ds:[5ebch], ax
        mov word ptr ds:[5ed4h], ax
        mov byte ptr ds:[5ecfh], al
        mov byte ptr ds:[5f1eh], al
        mov byte ptr ds:[5ee6h], al
        mov byte ptr ds:[5e98h], al
        call _FN_CIRCUIT_CGA_0599C
        mov word ptr ds:[98b8h], 0
        mov word ptr ds:[5e30h], 0FFFFh
        mov word ptr ds:[066ah], 0
        mov word ptr ds:[0a48h], 0
        mov word ptr ds:[04feh], 0
        mov word ptr ds:[08eeh], 0
        mov word ptr ds:[5edeh], 64h
        mov word ptr ds:[5ee0h], 64h
        mov word ptr ds:[5ee8h], 64h
        mov word ptr ds:[9b8ch], 0h
        mov word ptr ds:[5eeah], 0h
        mov byte ptr ds:[5ed6h], 0
        xor ax, ax
        mov word ptr ds:[5ed2h], ax
        call _FN_CIRCUIT_CGA_058CB
        xor ax, ax
        mov word ptr ds:[5fb8h], ax
        mov word ptr ds:[9cc6h], ax
        mov word ptr ds:[5fc4h], ax
        mov word ptr ds:[5fbeh], ax
        mov word ptr ds:[5fbah], ax
        mov ax, word ptr ds:[5a76h]
        mov word ptr ds:[79a6h], ax
        mov word ptr ds:[79aah], 384h
        mov word ptr ds:[79a8h], 0ffffh
        cmp byte ptr ds:[6Ch], 0
        je short else_path
        mov byte ptr ds:[5f1fh], 1
        mov ax, word ptr ds:[5720h]
        mov word ptr ds:[5ec2h], ax
        mov ax, word ptr ds:[57a6h]
        mov word ptr ds:[5f24h], ax
        mov ax, word ptr ds:[57a8h]
        mov word ptr ds:[5f26h], ax
        jmp short merge_path
        nop
else_path:
        mov byte ptr ds:[5f1fh], 0
        mov ax, word ptr ds:[57a2h]
        mov word ptr ds:[5f24h], ax
        mov ax, word ptr ds:[57a4h]
        mov word ptr ds:[5f26h], ax
merge_path:
        mov ax, word ptr ds:[5f24h]
        mov word ptr ds:[5f28h], ax
        mov ax, word ptr ds:[5f26h]
        mov word ptr ds:[5f2ah], ax
        mov word ptr ds:[5ecah], 190h
        mov al, 1
        mov byte ptr ds:[5eceh], al
        mov byte ptr ds:[5ecch], al
        ret
_grp_b84a76b6 ENDP
_TEXT ENDS
END
