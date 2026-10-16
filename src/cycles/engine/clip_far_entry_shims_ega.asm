        .286
CYC_EGA_CLIP_ENTRY_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CYC_EGA_CLIP_ENTRY_TEXT
        PUBLIC _fn_cycles_ega_09de0
_fn_cycles_ega_09de0 LABEL FAR
        PUSH         bp
        MOV          bp, sp
        PUSH         ds
        PUSH         si
        PUSH         di
        SUB          sp, 44h
        MOV          ax, 47A0h
        MOV          word ptr [bp-40h], ax
        MOV          ax, 336Ch
        MOV          word ptr [bp-4Ah], ax
        MOV          byte ptr [bp-42h], 10h
        MOV          byte ptr [bp-41h], 2
        JMP          near ptr $-17DAh
        PUBLIC _fn_cycles_ega_09e00
_fn_cycles_ega_09e00 LABEL FAR
        PUSH         bp
        MOV          bp, sp
        PUSH         ds
        PUSH         si
        PUSH         di
        SUB          sp, 44h
        MOV          ax, 47A0h
        MOV          word ptr [bp-40h], ax
        MOV          ax, 336Ch
        MOV          word ptr [bp-4Ah], ax
        MOV          byte ptr [bp-42h], 10h
        MOV          byte ptr [bp-41h], 2
        JMP          near ptr $-17C2h
        PUBLIC _fn_cycles_ega_0a0da
_fn_cycles_ega_0a0da LABEL FAR
        PUSH         bp
        MOV          bp, sp
        PUSH         ds
        PUSH         si
        PUSH         di
        SUB          sp, 44h
        MOV          ax, 4A9Ah
        MOV          word ptr [bp-40h], ax
        MOV          ax, 3DA8h
        MOV          word ptr [bp-4Ah], ax
        MOV          byte ptr [bp-42h], 10h
        MOV          byte ptr [bp-41h], 2
        JMP          near ptr $-0FE8h
        PUBLIC _fn_cycles_ega_0a11a
_fn_cycles_ega_0a11a LABEL FAR
        PUSH         bp
        MOV          bp, sp
        PUSH         ds
        PUSH         si
        PUSH         di
        SUB          sp, 44h
        MOV          ax, 4A9Ah
        MOV          word ptr [bp-40h], ax
        MOV          ax, 3DA8h
        MOV          word ptr [bp-4Ah], ax
        MOV          byte ptr [bp-42h], 10h
        MOV          byte ptr [bp-41h], 2
        JMP          near ptr $-0FBEh
        PUBLIC _fn_cycles_ega_0b7da
_fn_cycles_ega_0b7da LABEL FAR
        PUSH         bp
        MOV          bp, sp
        PUSH         ds
        PUSH         si
        PUSH         di
        SUB          sp, 44h
        MOV          ax, 619Ah
        MOV          word ptr [bp-40h], ax
        MOV          ax, 61AAh
        MOV          word ptr [bp-4Ah], ax
        MOV          byte ptr [bp-42h], 18h
        MOV          byte ptr [bp-41h], 4
        JMP          near ptr $-26E8h
        PUBLIC _fn_cycles_ega_0b81a
_fn_cycles_ega_0b81a LABEL FAR
        PUSH         bp
        MOV          bp, sp
        PUSH         ds
        PUSH         si
        PUSH         di
        SUB          sp, 44h
        MOV          ax, 619Ah
        MOV          word ptr [bp-40h], ax
        MOV          ax, 61AAh
        MOV          word ptr [bp-4Ah], ax
        MOV          byte ptr [bp-42h], 18h
        MOV          byte ptr [bp-41h], 4
        JMP          near ptr $-26BEh
CYC_EGA_CLIP_ENTRY_TEXT ENDS
        END
