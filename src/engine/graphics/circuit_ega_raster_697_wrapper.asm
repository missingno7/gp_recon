; Circuit EGA near wrapper D2A4..D2BE reconstructed from image bytes.
; Names are descriptive reconstructions, not recovered symbols.
; This standalone module starts at its mapped routine/shared entry.
        .286
EXTRN _ext_A689:NEAR
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        PUBLIC _rcega_697wrap
_rcega_697wrap LABEL NEAR
        ; D2A4: 55  push bp
        PUSH         bp
        ; D2A5: 8B EC  mov bp, sp
        MOV          bp, sp
        ; D2A7: B8 F2 D2  mov ax, 0xd2f2
        MOV          ax, 54002
        ; D2AA: 89 46 C0  mov word ptr [bp - 0x40], ax
        MOV          word ptr [bp - 64], ax
        ; D2AD: B8 02 D3  mov ax, 0xd302
        MOV          ax, 54018
        ; D2B0: 89 46 B6  mov word ptr [bp - 0x4a], ax
        MOV          word ptr [bp - 74], ax
        ; D2B3: C6 46 BE 18  mov byte ptr [bp - 0x42], 0x18
        MOV          byte ptr [bp - 66], 24
        ; D2B7: C6 46 BF 04  mov byte ptr [bp - 0x41], 4
        MOV          byte ptr [bp - 65], 4
        ; D2BB: E9 CB D3  jmp 0xa689
        JMP NEAR PTR _ext_A689
_TEXT ENDS
        END
