; Cycles EGA far wrapper B170..B190 reconstructed from image bytes.
; Names are descriptive reconstructions, not recovered symbols.
; This standalone module starts at its mapped routine/shared entry.
        .286
EXTRN _ext_8623:NEAR
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        PUBLIC _cye_697_wrapper
_cye_697_wrapper LABEL FAR
        ; B170: 55  push bp
        PUSH         bp
        ; B171: 8B EC  mov bp, sp
        MOV          bp, sp
        ; B173: 1E  push ds
        PUSH         ds
        ; B174: 56  push si
        PUSH         si
        ; B175: 57  push di
        PUSH         di
        ; B176: 83 EC 44  sub sp, 0x44
        SUB          sp, 68
        ; B179: B8 30 5B  mov ax, 0x5b30
        MOV          ax, 23344
        ; B17C: 89 46 C0  mov word ptr [bp - 0x40], ax
        MOV          word ptr [bp - 64], ax
        ; B17F: B8 40 5B  mov ax, 0x5b40
        MOV          ax, 23360
        ; B182: 89 46 B6  mov word ptr [bp - 0x4a], ax
        MOV          word ptr [bp - 74], ax
        ; B185: C6 46 BE 18  mov byte ptr [bp - 0x42], 0x18
        MOV          byte ptr [bp - 66], 24
        ; B189: C6 46 BF 04  mov byte ptr [bp - 0x41], 4
        MOV          byte ptr [bp - 65], 4
        ; B18D: E9 93 D4  jmp 0x8623
        JMP NEAR PTR _ext_8623
_TEXT ENDS
        END
