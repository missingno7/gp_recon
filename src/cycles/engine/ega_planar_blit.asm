        .286
EGA_PLANAR_ABS SEGMENT AT 056Ah
        ORG 04E8Ch
_EGA_PLANAR_INDEX LABEL BYTE
EGA_PLANAR_ABS ENDS
EGA_PLANAR_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:EGA_PLANAR_TEXT
        ORG 066ADh
LBD4D LABEL NEAR
        ORG 066B0h
        PUBLIC _fn_cycles_ega_0bd50
_fn_cycles_ega_0bd50 LABEL FAR
        push bp ; bd50
        mov bp, sp ; bd51
        push si ; bd53
        push di ; bd54
        sub sp, 8 ; bd55
        cld ; bd58
        cmp word ptr [bp + 0Ah], 0 ; bd59
        jle short LBD4D ; bd5d
        cmp word ptr [bp + 0Ch], 0 ; bd5f
        jle short LBD4D ; bd63
        mov es, word ptr cs:[4E8Ch] ; bd65
        mov cx, word ptr [bp + 6] ; bd6a
        mov bx, cx ; bd6d
        sar bx, 1 ; bd6f
        sar bx, 1 ; bd71
        sar bx, 1 ; bd73
        mov word ptr [bp - 0Ch], bx ; bd75
        mov bx, cx ; bd78
        and bx, 7 ; bd7a
        mov dh, byte ptr [bx - 6608h] ; bd7d
        add cx, word ptr [bp + 0Ah] ; bd81
        dec cx ; bd84
        mov bx, cx ; bd85
        and bx, 7 ; bd87
        mov dl, byte ptr [bx - 6600h] ; bd8a
        sar cx, 1 ; bd8e
        sar cx, 1 ; bd90
        sar cx, 1 ; bd92
        sub cx, word ptr [bp - 0Ch] ; bd94
        mov bx, word ptr [bp + 8] ; bd97
        shl bx, 1 ; bd9a
        add bx, word ptr cs:[4E94h] ; bd9c
        mov di, word ptr cs:[bx] ; bda1
        add di, word ptr [bp - 0Ch] ; bda4
        mov word ptr [bp - 6], di ; bda7
        mov ax, word ptr cs:[4E9Eh] ; bdaa
        sub ax, cx ; bdae
        mov word ptr [bp - 8], ax ; bdb0
        cmp word ptr cs:[4E8Ch], 0A000h ; bdb3
        je short LBE06 ; bdba
        lea si, _EGA_PLANAR_INDEX ; bdbc
        dec cx ; bdc0
        mov word ptr [bp - 0Ah], cx ; bdc1
        jg short LBE09 ; bdc4
        je short LBE0C ; bdc6
        and dh, dl ; bdc8
        mov dl, dh ; bdca
        not dl ; bdcc
        mov al, byte ptr [bp + 0Eh] ; bdce
        mov ah, 4 ; bdd1
        mov bx, word ptr [bp - 8] ; bdd3
LBDD6:
        cmp word ptr cs:[si], 0 ; bdd6
        je short LBDF0 ; bdda
        mov es, word ptr cs:[si] ; bddc
        mov di, word ptr [bp - 6] ; bddf
        mov cx, word ptr [bp + 0Ch] ; bde2
        test al, 1 ; bde5
        je short LBE00 ; bde7
LBDE9:
        xor byte ptr es:[di], dh ; bde9
        add di, bx ; bdec
        loop LBDE9 ; bdee
LBDF0:
        shr al, 1 ; bdf0
        add si, 2 ; bdf2
        dec ah ; bdf5
        jg short LBDD6 ; bdf7
LBDF9:
        add sp, 8 ; bdf9
        pop di ; bdfc
        pop si ; bdfd
        pop bp ; bdfe
        retf ; bdff
LBE00:
        add di, bx ; be00
        loop LBE00 ; be02
        jmp short LBDF0 ; be04
LBE06:
        jmp near ptr $+92h ; be06
LBE09:
        jmp short LBE48 ; be09
        nop ; be0b
LBE0C:
        mov al, byte ptr [bp + 0Eh] ; be0c
        mov ah, 4 ; be0f
        mov bx, word ptr [bp - 8] ; be11
LBE14:
        cmp word ptr cs:[si], 0 ; be14
        je short LBE32 ; be18
        mov es, word ptr cs:[si] ; be1a
        mov di, word ptr [bp - 6] ; be1d
        mov cx, word ptr [bp + 0Ch] ; be20
        test al, 1 ; be23
        je short LBE3D ; be25
LBE27:
        xor byte ptr es:[di], dh ; be27
        inc di ; be2a
        xor byte ptr es:[di], dl ; be2b
        add di, bx ; be2e
        loop LBE27 ; be30
LBE32:
        shr al, 1 ; be32
        add si, 2 ; be34
        dec ah ; be37
        jg short LBE14 ; be39
        jmp short LBDF9 ; be3b
LBE3D:
        not dx ; be3d
LBE3F:
        inc di ; be3f
        add di, bx ; be40
        loop LBE3F ; be42
        not dx ; be44
        jmp short LBE32 ; be46
LBE48:
        mov ah, 4 ; be48
LBE4A:
        cmp word ptr cs:[si], 0 ; be4a
        je short LBE77 ; be4e
        mov es, word ptr cs:[si] ; be50
        mov di, word ptr [bp - 6] ; be53
        mov bx, word ptr [bp + 0Ch] ; be56
        test byte ptr [bp + 0Eh], 1 ; be59
        je short LBE84 ; be5d
        mov al, 0FFh ; be5f
LBE61:
        xor byte ptr es:[di], dh ; be61
        inc di ; be64
        mov cx, word ptr [bp - 0Ah] ; be65
LBE68:
        xor byte ptr es:[di], al ; be68
        inc di ; be6b
        loop LBE68 ; be6c
        xor byte ptr es:[di], dl ; be6e
        add di, word ptr [bp - 8] ; be71
        dec bx ; be74
        jg short LBE61 ; be75
LBE77:
        shr byte ptr [bp + 0Eh], 1 ; be77
        add si, 2 ; be7a
        dec ah ; be7d
        jg short LBE4A ; be7f
        jmp near ptr $-88h ; be81
LBE84:
        not dx ; be84
        xor al, al ; be86
LBE88:
        inc di ; be88
        mov cx, word ptr [bp - 0Ah] ; be89
        add di, cx ; be8c
        add di, word ptr [bp - 8] ; be8e
        dec bx ; be91
        jg short LBE88 ; be92
        not dx ; be94
        jmp short LBE77 ; be96
LBE98:
        mov bx, dx ; be98
        mov dx, 3CEh ; be9a
        mov al, 5 ; be9d
        out dx, al ; be9f
        inc dx ; bea0
        mov al, 2 ; bea1
        out dx, al ; bea3
        mov dx, 3CEh ; bea4
        mov al, 3 ; bea7
        out dx, al ; bea9
        inc dx ; beaa
        mov al, 18h ; beab
        out dx, al ; bead
        mov dx, 3C4h ; beae
        mov al, 2 ; beb1
        out dx, al ; beb3
        inc dx ; beb4
        mov al, 0FFh ; beb5
        out dx, al ; beb7
        dec cx ; beb8
        mov word ptr [bp - 0Ah], cx ; beb9
        jg short LBF09 ; bebc
        je short LBF0C ; bebe
        and bh, bl ; bec0
        mov dx, 3CEh ; bec2
        mov al, 8 ; bec5
        out dx, al ; bec7
        inc dx ; bec8
        mov al, bh ; bec9
        out dx, al ; becb
        mov di, word ptr [bp - 6] ; becc
        mov cx, word ptr [bp + 0Ch] ; becf
        mov al, byte ptr [bp + 0Eh] ; bed2
        mov dx, word ptr cs:[4E9Eh] ; bed5
LBEDA:
        mov ah, byte ptr es:[di] ; beda
        mov byte ptr es:[di], al ; bedd
        add di, dx ; bee0
        loop LBEDA ; bee2
LBEE4:
        mov dx, 3CEh ; bee4
        mov al, 8 ; bee7
        out dx, al ; bee9
        inc dx ; beea
        mov al, 0FFh ; beeb
        out dx, al ; beed
        mov dx, 3CEh ; beee
        mov al, 3 ; bef1
        out dx, al ; bef3
        inc dx ; bef4
        mov al, 0 ; bef5
        out dx, al ; bef7
        mov dx, 3CEh ; bef8
        mov al, 5 ; befb
        out dx, al ; befd
        inc dx ; befe
        mov al, 0 ; beff
        out dx, al ; bf01
        add sp, 8 ; bf02
        pop di ; bf05
        pop si ; bf06
        pop bp ; bf07
        retf ; bf08
LBF09:
        jmp short LBF53 ; bf09
        nop ; bf0b
LBF0C:
        mov dx, 3CEh ; bf0c
        mov al, 8 ; bf0f
        out dx, al ; bf11
        inc dx ; bf12
        mov al, bh ; bf13
        out dx, al ; bf15
        mov di, word ptr [bp - 6] ; bf16
        mov cx, word ptr [bp + 0Ch] ; bf19
        mov al, byte ptr [bp + 0Eh] ; bf1c
        mov dx, word ptr cs:[4E9Eh] ; bf1f
LBF24:
        mov ah, byte ptr es:[di] ; bf24
        mov byte ptr es:[di], al ; bf27
        add di, dx ; bf2a
        loop LBF24 ; bf2c
        mov dx, 3CEh ; bf2e
        mov al, 8 ; bf31
        out dx, al ; bf33
        inc dx ; bf34
        mov al, bl ; bf35
        out dx, al ; bf37
        mov di, word ptr [bp - 6] ; bf38
        inc di ; bf3b
        mov cx, word ptr [bp + 0Ch] ; bf3c
        mov al, byte ptr [bp + 0Eh] ; bf3f
        mov dx, word ptr cs:[4E9Eh] ; bf42
LBF47:
        mov ah, byte ptr es:[di] ; bf47
        mov byte ptr es:[di], al ; bf4a
        add di, dx ; bf4d
        loop LBF47 ; bf4f
        jmp short LBEE4 ; bf51
LBF53:
        mov dx, 3CEh ; bf53
        mov al, 8 ; bf56
        out dx, al ; bf58
        inc dx ; bf59
        mov al, bh ; bf5a
        out dx, al ; bf5c
        mov di, word ptr [bp - 6] ; bf5d
        mov cx, word ptr [bp + 0Ch] ; bf60
        mov al, byte ptr [bp + 0Eh] ; bf63
        mov dx, word ptr cs:[4E9Eh] ; bf66
LBF6B:
        mov ah, byte ptr es:[di] ; bf6b
        mov byte ptr es:[di], al ; bf6e
        add di, dx ; bf71
        loop LBF6B ; bf73
        mov dx, 3CEh ; bf75
        mov al, 8 ; bf78
        out dx, al ; bf7a
        inc dx ; bf7b
        mov al, bl ; bf7c
        out dx, al ; bf7e
        mov di, word ptr [bp - 6] ; bf7f
        add di, word ptr [bp - 0Ah] ; bf82
        inc di ; bf85
        mov cx, word ptr [bp + 0Ch] ; bf86
        mov al, byte ptr [bp + 0Eh] ; bf89
        mov dx, word ptr cs:[4E9Eh] ; bf8c
LBF91:
        mov ah, byte ptr es:[di] ; bf91
        mov byte ptr es:[di], al ; bf94
        add di, dx ; bf97
        loop LBF91 ; bf99
        mov dx, 3CEh ; bf9b
        mov al, 8 ; bf9e
        out dx, al ; bfa0
        inc dx ; bfa1
        mov al, 0FFh ; bfa2
        out dx, al ; bfa4
        mov di, word ptr [bp - 6] ; bfa5
        inc di ; bfa8
        mov bx, word ptr [bp + 0Ch] ; bfa9
        mov al, byte ptr [bp + 0Eh] ; bfac
        mov dx, word ptr [bp - 8] ; bfaf
        inc dx ; bfb2
LBFB3:
        mov cx, word ptr [bp - 0Ah] ; bfb3
LBFB6:
        mov ah, byte ptr es:[di] ; bfb6
        stosb ; bfb9
        loop LBFB6 ; bfba
        add di, dx ; bfbc
        dec bx ; bfbe
        jg short LBFB3 ; bfbf
        jmp near ptr $-0DDh ; bfc1
EGA_PLANAR_TEXT ENDS
        END
