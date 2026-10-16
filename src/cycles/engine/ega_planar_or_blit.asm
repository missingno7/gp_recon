        .286
EGA_OR_ABS SEGMENT AT 0000h
        ORG 04E8Ch
_EGA_OR_INDEX LABEL BYTE
EGA_OR_ABS ENDS
EGA_OR_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:EGA_OR_TEXT
        ORG 0DF5Bh
LDF5B LABEL NEAR
        ORG 0DF5Eh
        PUBLIC _fn_cycles_ega_0df5e
_fn_cycles_ega_0df5e LABEL FAR
        push bp ; df5e
        mov bp, sp ; df5f
        push si ; df61
        push di ; df62
        sub sp, 8 ; df63
        cld ; df66
        cmp word ptr [bp + 0Ah], 0 ; df67
        jle short LDF5B ; df6b
        cmp word ptr [bp + 0Ch], 0 ; df6d
        jle short LDF5B ; df71
        mov es, word ptr cs:[4E8Ch] ; df73
        mov cx, word ptr [bp + 6] ; df78
        mov bx, cx ; df7b
        sar bx, 1 ; df7d
        sar bx, 1 ; df7f
        sar bx, 1 ; df81
        mov word ptr [bp - 0Ch], bx ; df83
        mov bx, cx ; df86
        and bx, 7 ; df88
        mov dh, byte ptr [bx - 5C00h] ; df8b
        add cx, word ptr [bp + 0Ah] ; df8f
        dec cx ; df92
        mov bx, cx ; df93
        and bx, 7 ; df95
        mov dl, byte ptr [bx - 5BF8h] ; df98
        sar cx, 1 ; df9c
        sar cx, 1 ; df9e
        sar cx, 1 ; dfa0
        sub cx, word ptr [bp - 0Ch] ; dfa2
        mov bx, word ptr [bp + 8] ; dfa5
        shl bx, 1 ; dfa8
        add bx, word ptr cs:[4E94h] ; dfaa
        mov di, word ptr cs:[bx] ; dfaf
        add di, word ptr [bp - 0Ch] ; dfb2
        mov word ptr [bp - 6], di ; dfb5
        mov ax, word ptr cs:[4E9Eh] ; dfb8
        sub ax, cx ; dfbc
        mov word ptr [bp - 8], ax ; dfbe
        cmp word ptr cs:[4E8Ch], 0A000h ; dfc1
        je short LE014 ; dfc8
        lea si, _EGA_OR_INDEX ; dfca
        dec cx ; dfce
        mov word ptr [bp - 0Ah], cx ; dfcf
        jg short LE017 ; dfd2
        je short LE01A ; dfd4
        and dh, dl ; dfd6
        mov dl, dh ; dfd8
        not dl ; dfda
        mov al, byte ptr [bp + 0Eh] ; dfdc
        mov ah, 4 ; dfdf
        mov bx, word ptr [bp - 8] ; dfe1
LDFE4:
        cmp word ptr cs:[si], 0 ; dfe4
        je short LDFFE ; dfe8
        mov es, word ptr cs:[si] ; dfea
        mov di, word ptr [bp - 6] ; dfed
        mov cx, word ptr [bp + 0Ch] ; dff0
        test al, 1 ; dff3
        je short LE00E ; dff5
LDFF7:
        or byte ptr es:[di], dh ; dff7
        add di, bx ; dffa
        loop LDFF7 ; dffc
LDFFE:
        shr al, 1 ; dffe
        add si, 2 ; e000
        dec ah ; e003
        jg short LDFE4 ; e005
LE007:
        add sp, 8 ; e007
        pop di ; e00a
        pop si ; e00b
        pop bp ; e00c
        retf ; e00d
LE00E:
        add di, bx ; e00e
        loop LE00E ; e010
        jmp short LDFFE ; e012
LE014:
        jmp near ptr $+92h ; e014
LE017:
        jmp short LE056 ; e017
        nop ; e019
LE01A:
        mov al, byte ptr [bp + 0Eh] ; e01a
        mov ah, 4 ; e01d
        mov bx, word ptr [bp - 8] ; e01f
LE022:
        cmp word ptr cs:[si], 0 ; e022
        je short LE040 ; e026
        mov es, word ptr cs:[si] ; e028
        mov di, word ptr [bp - 6] ; e02b
        mov cx, word ptr [bp + 0Ch] ; e02e
        test al, 1 ; e031
        je short LE04B ; e033
LE035:
        or byte ptr es:[di], dh ; e035
        inc di ; e038
        or byte ptr es:[di], dl ; e039
        add di, bx ; e03c
        loop LE035 ; e03e
LE040:
        shr al, 1 ; e040
        add si, 2 ; e042
        dec ah ; e045
        jg short LE022 ; e047
        jmp short LE007 ; e049
LE04B:
        not dx ; e04b
LE04D:
        inc di ; e04d
        add di, bx ; e04e
        loop LE04D ; e050
        not dx ; e052
        jmp short LE040 ; e054
LE056:
        mov ah, 4 ; e056
LE058:
        cmp word ptr cs:[si], 0 ; e058
        je short LE085 ; e05c
        mov es, word ptr cs:[si] ; e05e
        mov di, word ptr [bp - 6] ; e061
        mov bx, word ptr [bp + 0Ch] ; e064
        test byte ptr [bp + 0Eh], 1 ; e067
        je short LE092 ; e06b
        mov al, 0FFh ; e06d
LE06F:
        or byte ptr es:[di], dh ; e06f
        inc di ; e072
        mov cx, word ptr [bp - 0Ah] ; e073
LE076:
        or byte ptr es:[di], al ; e076
        inc di ; e079
        loop LE076 ; e07a
        or byte ptr es:[di], dl ; e07c
        add di, word ptr [bp - 8] ; e07f
        dec bx ; e082
        jg short LE06F ; e083
LE085:
        shr byte ptr [bp + 0Eh], 1 ; e085
        add si, 2 ; e088
        dec ah ; e08b
        jg short LE058 ; e08d
        jmp near ptr $-88h ; e08f
LE092:
        not dx ; e092
        xor al, al ; e094
LE096:
        inc di ; e096
        mov cx, word ptr [bp - 0Ah] ; e097
        add di, cx ; e09a
        add di, word ptr [bp - 8] ; e09c
        dec bx ; e09f
        jg short LE096 ; e0a0
        not dx ; e0a2
        jmp short LE085 ; e0a4
LE0A6:
        mov bx, dx ; e0a6
        mov dx, 3CEh ; e0a8
        mov al, 5 ; e0ab
        out dx, al ; e0ad
        inc dx ; e0ae
        mov al, 2 ; e0af
        out dx, al ; e0b1
        mov dx, 3CEh ; e0b2
        mov al, 3 ; e0b5
        out dx, al ; e0b7
        inc dx ; e0b8
        mov al, 10h ; e0b9
        out dx, al ; e0bb
        mov dx, 3C4h ; e0bc
        mov al, 2 ; e0bf
        out dx, al ; e0c1
        inc dx ; e0c2
        mov al, 0FFh ; e0c3
        out dx, al ; e0c5
        dec cx ; e0c6
        mov word ptr [bp - 0Ah], cx ; e0c7
        jg short LE117 ; e0ca
        je short LE11A ; e0cc
        and bh, bl ; e0ce
        mov dx, 3CEh ; e0d0
        mov al, 8 ; e0d3
        out dx, al ; e0d5
        inc dx ; e0d6
        mov al, bh ; e0d7
        out dx, al ; e0d9
        mov di, word ptr [bp - 6] ; e0da
        mov cx, word ptr [bp + 0Ch] ; e0dd
        mov al, byte ptr [bp + 0Eh] ; e0e0
        mov dx, word ptr cs:[4E9Eh] ; e0e3
LE0E8:
        mov ah, byte ptr es:[di] ; e0e8
        mov byte ptr es:[di], al ; e0eb
        add di, dx ; e0ee
        loop LE0E8 ; e0f0
LE0F2:
        mov dx, 3CEh ; e0f2
        mov al, 8 ; e0f5
        out dx, al ; e0f7
        inc dx ; e0f8
        mov al, 0FFh ; e0f9
        out dx, al ; e0fb
        mov dx, 3CEh ; e0fc
        mov al, 3 ; e0ff
        out dx, al ; e101
        inc dx ; e102
        mov al, 0 ; e103
        out dx, al ; e105
        mov dx, 3CEh ; e106
        mov al, 5 ; e109
        out dx, al ; e10b
        inc dx ; e10c
        mov al, 0 ; e10d
        out dx, al ; e10f
        add sp, 8 ; e110
        pop di ; e113
        pop si ; e114
        pop bp ; e115
        retf ; e116
LE117:
        jmp short LE161 ; e117
        nop ; e119
LE11A:
        mov dx, 3CEh ; e11a
        mov al, 8 ; e11d
        out dx, al ; e11f
        inc dx ; e120
        mov al, bh ; e121
        out dx, al ; e123
        mov di, word ptr [bp - 6] ; e124
        mov cx, word ptr [bp + 0Ch] ; e127
        mov al, byte ptr [bp + 0Eh] ; e12a
        mov dx, word ptr cs:[4E9Eh] ; e12d
LE132:
        mov ah, byte ptr es:[di] ; e132
        mov byte ptr es:[di], al ; e135
        add di, dx ; e138
        loop LE132 ; e13a
        mov dx, 3CEh ; e13c
        mov al, 8 ; e13f
        out dx, al ; e141
        inc dx ; e142
        mov al, bl ; e143
        out dx, al ; e145
        mov di, word ptr [bp - 6] ; e146
        inc di ; e149
        mov cx, word ptr [bp + 0Ch] ; e14a
        mov al, byte ptr [bp + 0Eh] ; e14d
        mov dx, word ptr cs:[4E9Eh] ; e150
LE155:
        mov ah, byte ptr es:[di] ; e155
        mov byte ptr es:[di], al ; e158
        add di, dx ; e15b
        loop LE155 ; e15d
        jmp short LE0F2 ; e15f
LE161:
        mov dx, 3CEh ; e161
        mov al, 8 ; e164
        out dx, al ; e166
        inc dx ; e167
        mov al, bh ; e168
        out dx, al ; e16a
        mov di, word ptr [bp - 6] ; e16b
        mov cx, word ptr [bp + 0Ch] ; e16e
        mov al, byte ptr [bp + 0Eh] ; e171
        mov dx, word ptr cs:[4E9Eh] ; e174
LE179:
        mov ah, byte ptr es:[di] ; e179
        mov byte ptr es:[di], al ; e17c
        add di, dx ; e17f
        loop LE179 ; e181
        mov dx, 3CEh ; e183
        mov al, 8 ; e186
        out dx, al ; e188
        inc dx ; e189
        mov al, bl ; e18a
        out dx, al ; e18c
        mov di, word ptr [bp - 6] ; e18d
        add di, word ptr [bp - 0Ah] ; e190
        inc di ; e193
        mov cx, word ptr [bp + 0Ch] ; e194
        mov al, byte ptr [bp + 0Eh] ; e197
        mov dx, word ptr cs:[4E9Eh] ; e19a
LE19F:
        mov ah, byte ptr es:[di] ; e19f
        mov byte ptr es:[di], al ; e1a2
        add di, dx ; e1a5
        loop LE19F ; e1a7
        mov dx, 3CEh ; e1a9
        mov al, 8 ; e1ac
        out dx, al ; e1ae
        inc dx ; e1af
        mov al, 0FFh ; e1b0
        out dx, al ; e1b2
        mov di, word ptr [bp - 6] ; e1b3
        inc di ; e1b6
        mov bx, word ptr [bp + 0Ch] ; e1b7
        mov al, byte ptr [bp + 0Eh] ; e1ba
        mov dx, word ptr [bp - 8] ; e1bd
        inc dx ; e1c0
LE1C1:
        mov cx, word ptr [bp - 0Ah] ; e1c1
LE1C4:
        mov ah, byte ptr es:[di] ; e1c4
        stosb ; e1c7
        loop LE1C4 ; e1c8
        add di, dx ; e1ca
        dec bx ; e1cc
        jg short LE1C1 ; e1cd
        jmp near ptr $-0DDh ; e1cf
EGA_OR_TEXT ENDS
        END
