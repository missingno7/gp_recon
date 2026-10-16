_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_66b2
_g_00c36 EQU 0c36h
_g_00c4a EQU 0c4ah
_g_05ebe EQU 5ebeh
_g_05ec2 EQU 5ec2h
_grp_66b2 PROC NEAR
        mov ax, word ptr ds:[_g_05ebe]
        mov word ptr ds:[_g_00c4a], ax
        mov ax, word ptr ds:[_g_05ec2]
        mov word ptr ds:[_g_00c36], ax
        mov bx, 0
L_66C1:
        mov ax, word ptr [bx + 0c4ah]
        mov word ptr [bx + 0d4eh], ax
        mov ax, word ptr [bx + 0c36h]
        mov word ptr [bx + 0d62h], ax
        inc bx
        inc bx
        cmp bx, 14h
        jl short L_66C1
        ret
_grp_66b2 ENDP
_TEXT ENDS
END
