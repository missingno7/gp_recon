_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _update_video_state_4e9b
_g_0004a EQU 004ah
_g_0006c EQU 006ch
_g_008f0 EQU 08f0h
_g_008f1 EQU 08f1h
_g_0570c EQU 570ch
_g_0570e EQU 570eh
_g_05720 EQU 5720h
_g_05ee2 EQU 5ee2h
_g_05ee6 EQU 5ee6h
_g_05ee9 EQU 5ee9h
_g_05eea EQU 5eeah
_g_05ef0 EQU 5ef0h
_g_05f3a EQU 5f3ah
_g_05f3b EQU 5f3bh
_g_05f3c EQU 5f3ch
_g_05f3d EQU 5f3dh
_g_05f3e EQU 5f3eh
_g_05f44 EQU 5f44h
_g_05f46 EQU 5f46h
_g_05fd8 EQU 5fd8h
_g_08b7e EQU 8b7eh
_g_096ce EQU 96ceh
EXTRN _FN_CIRCUIT_EGA_05562:NEAR
EXTRN _FN_CIRCUIT_EGA_055B6:NEAR
_update_video_state_4e9b PROC NEAR
        xor bh, bh
        mov bl, byte ptr ds:[_g_008f0]
        and bl, 0fh
        and al, 30h
        or al, byte ptr [bx + 8f4h]
        mov byte ptr ds:[_g_008f1], al
        cmp word ptr ds:[_g_05ef0], 7
        je short L_4EE9
        cmp word ptr ds:[_g_0004a], 0
        jne short L_4F0F
        cmp byte ptr ds:[_g_0006c], 0
        je short L_4EC5
        jmp short L_4F14
        nop
L_4EC5:
        test al, 30h
        jne short L_4F0C
        cmp byte ptr ds:[_g_05f3a], 1
        jne short L_4F0C
        cmp byte ptr ds:[_g_05f3d], 1
        je short L_4F0C
        mov byte ptr ds:[_g_05f3a], 0
        mov cx, word ptr ds:[_g_05ee2]
        call _FN_CIRCUIT_EGA_055B6
        call _FN_CIRCUIT_EGA_05562
        jmp near ptr L_501D
L_4EE9:
        mov al, 5
        mov byte ptr ds:[_g_008f1], 5
        mov cx, word ptr ds:[_g_05720]
        cmp word ptr ds:[_g_05ee2], cx
        jg short L_4EC5
        cmp byte ptr ds:[_g_05f3d], 1
        je short L_4EC5
        cmp byte ptr ds:[_g_05f3b], 1
        jle short L_4EC5
        or al, 20h
        jmp short L_4EC5
L_4F0C:
        jmp short L_4F65
        nop
L_4F0F:
        mov byte ptr ds:[_g_008f1], 1
L_4F14:
        cmp byte ptr ds:[_g_096ce], 0
        je short L_4F55
        and al, 0fh
        mov cx, word ptr ds:[_g_05ee2]
        cmp cx, word ptr ds:[_g_0570e]
        jl short L_4F36
        cmp byte ptr ds:[_g_05f3d], 1
        je short L_4F52
        mov word ptr ds:[_g_05ee6], 32h
        or al, 10h
L_4F36:
        cmp cx, word ptr ds:[_g_05720]
        jg short L_4F52
        cmp byte ptr ds:[_g_05f3d], 1
        je short L_4F52
        cmp byte ptr ds:[_g_05f3b], 1
        jle short L_4F52
        mov word ptr ds:[_g_05ee6], 32h
        or al, 20h
L_4F52:
        jmp near ptr L_4EC5
L_4F55:
        xor ax, ax
        mov byte ptr ds:[_g_008f1], 0
        mov byte ptr ds:[_g_008f0], 0
        jmp near ptr L_4EC5
L_4F64:
        ret
L_4F65:
        mov bl, al
        and bx, 0fh
        test al, 30h
        je short L_4F9A
        cmp byte ptr ds:[_g_096ce], 0
        je short L_4F64
        mov byte ptr ds:[_g_05f3a], 1
        mov byte ptr ds:[_g_05eea], 1
        mov word ptr ds:[_g_05ee6], 4bh
        cmp byte ptr ds:[_g_05ee9], 0
        je short L_4F9D
        cmp word ptr ds:[_g_05ef0], 0
        jne short L_4F9D
        cmp byte ptr ds:[_g_08b7e], 1
        jne short L_4F9D
L_4F9A:
        jmp short L_4FF4
        nop
L_4F9D:
        mov dl, 0
        mov bl, al
        xor bh, bh
        shr bl, 1
        shr bl, 1
        shr bl, 1
        shr bl, 1
        mov cl, byte ptr [bx + 5f61h]
        cmp cl, dl
        je short L_4FED
        mov al, byte ptr ds:[_g_05f3b]
        add al, cl
        cmp al, byte ptr ds:[_g_0570c]
        ja short L_4FED
        mov dl, 1
        cmp byte ptr ds:[_g_05f3e], 1
        je short L_4FED
        cmp byte ptr ds:[_g_05f3d], 1
        je short L_4FED
        xor ah, ah
        mov byte ptr ds:[_g_05f3b], al
        mov bx, ax
        shl bx, 1
        shl bx, 1
        mov ax, word ptr [bx + 57a6h]
        mov cx, word ptr [bx + 57a8h]
        mov word ptr ds:[_g_05f44], ax
        mov word ptr ds:[_g_05f46], cx
        mov byte ptr ds:[_g_05f3d], 1
L_4FED:
        mov byte ptr ds:[_g_05f3e], dl
        jmp short L_5005
        nop
L_4FF4:
        mov byte ptr ds:[_g_05f3e], 0
        cmp byte ptr ds:[_g_05f3d], 0
        jne short L_501D
        mov byte ptr ds:[_g_05f3a], 0
L_5005:
        xor bh, bh
        mov bl, byte ptr ds:[_g_008f1]
        and bl, 0fh
        mov al, byte ptr [bx + 5f49h]
        mov byte ptr ds:[_g_05fd8], al
        mov dl, byte ptr [bx + 5f58h]
        mov byte ptr ds:[_g_05f3c], dl
L_501D:
        ret
_update_video_state_4e9b ENDP
_TEXT ENDS
END
