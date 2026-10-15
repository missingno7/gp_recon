.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
EXTRN _g_840f:BYTE
EXTRN _g_83f2:BYTE
EXTRN _g_841d:BYTE
EXTRN _g_841e:BYTE
EXTRN _g_841f:BYTE
EXTRN _g_8423:BYTE
EXTRN _g_8427:BYTE
EXTRN _g_8426:BYTE
EXTRN _g_8425:BYTE
EXTRN _g_8421:BYTE
EXTRN _fn_circuit_ega_07536:NEAR
PUBLIC _grp_73e02359
_grp_73e02359 PROC NEAR
    xor ax, ax
    cmp byte ptr ds:_g_840f, 0
    je short f2
    or al, 10h
f2:
    cmp byte ptr ds:_g_83f2, 0
    je short f3
    or al, 20h
f3:
    cmp byte ptr ds:_g_841d, 0
    je short f4
    or al, 9
f4:
    cmp byte ptr ds:_g_841e, 0
    je short f5
    or al, 1
f5:
    cmp byte ptr ds:_g_841f, 0
    je short f6
    or al, 5
f6:
    cmp byte ptr ds:_g_8423, 0
    je short f7
    or al, 4
f7:
    cmp byte ptr ds:_g_8427, 0
    je short f8
    or al, 6
f8:
    cmp byte ptr ds:_g_8426, 0
    je short f9
    or al, 2
f9:
    cmp byte ptr ds:_g_8425, 0
    je short f10
    or al, 0ah
f10:
    cmp byte ptr ds:_g_8421, 0
    je short flags_done
    or al, 8
flags_done:
    or ax, ax
    jne short done
    call _fn_circuit_ega_07536
done:
    ret
_grp_73e02359 ENDP
_TEXT ENDS
END
