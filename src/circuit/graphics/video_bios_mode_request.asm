.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
PUBLIC _video_bios_mode_request
_video_bios_mode_request PROC NEAR
    push bp
    mov bp, sp
    mov ax, ds
    mov es, ax
    mov ah, 10h
    mov al, 2
    mov dx, WORD PTR [bp+4]
    int 10h
    pop bp
    ret
_video_bios_mode_request ENDP
_TEXT ENDS
END
