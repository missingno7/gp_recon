.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
CGA_MODE_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CGA_MODE_TEXT, DS:DGROUP
        EXTRN _G_9180:BYTE, _G_9182:BYTE
        PUBLIC _grp_15791916
_grp_15791916 PROC NEAR
        push di
        mov byte ptr DGROUP:[_G_9180], 1
        mov ax, 40h
        mov es, ax
        mov ax, word ptr es:[10h]
        and ax, 0FFCFh
        or ax, 20h
        mov word ptr es:[10h], ax
        mov ah, 0
        mov al, 4
        int 10h
        mov al, 3
        mov dx, 3BFh
        out dx, al
        mov al, 2
        mov dx, 3B8h
        out dx, al
        mov cx, 0Ch
        mov dx, 3B4h
        xor bx, bx
write_crtc:
        mov al, bl
        out dx, al
        inc dx
        mov al, byte ptr DGROUP:[_G_9182+bx]
        out dx, al
        dec dx
        inc bx
        loop short write_crtc
        cld
        mov ax, 0B800h
        mov es, ax
        xor di, di
        mov cx, 4000h
        xor ax, ax
        rep stosw
        mov al, 8Ah
        mov dx, 3B8h
        out dx, al
        pop di
        ret
_grp_15791916 ENDP
CGA_MODE_TEXT ENDS
        END
