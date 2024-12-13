       .8086
        PAGE    ,132
;********************************************************************
; ANTI-VIRUS.ASM - program to find files infected by the "775" virus
;               and to restore these files to their original state
;********************************************************************
CSEG    segment
        assume cs:CSEG, ds:CSEG, es:CSEG
        org 100h
START:
        mov     SIG[10],0FFh ; Completes SIG string
READ_PARAM:
        cmp     BYTE PTR cs:[80h],0
        je      FIND_MODE    ; If no parameters, "find" mode
        mov     ax,ds
        mov     es,ax
        cld
        mov     al,'q'       ; 'q' - "find & cure mode" (MODE=1)
        mov     ch,0
        mov     cl,cs:[80h]  ; Length of UPA (from PSP)
        mov     di,81h       ; Offset of UPA (from PSP)
        repne   scasb
        je      CURE_MODE
FIND_MODE:
        mov     MODE,0
        jmp     ALLOC_MEM
CURE_MODE:
        mov     MODE,1
ALLOC_MEM:
        mov     ax,ds
        mov     es,ax
        mov     bx,1100h     ; Reallocate 68 K bytes
        mov     ah,4Ah
        int     21h
        jnc     ALLOCATED
NOT_ALLOCATED:
        lea     dx,NO_MEM
        mov     ah,09h
        int     21h          ; Print a message
        jmp     TO_DOS
NO_MEM  db      10,13,'Insufficient memory to run ANTI775',10,13,'$'
 
ALLOCATED:
       lea      ax,LBL
       mov      cl,4
       shr      ax,cl
       inc      ax
       mov      bx,ds
       add      ax,bx
       mov      FSEG,ax      ; Segment of program in memory
FIND_FIRST:
        lea     dx,FMASK     ; Mask of file name
        mov     cx,00100111b ; arc,dir,vol,sys,hid,r/o
        mov     ah,4Eh
        int     21h          ; Find first .COM file
        jnc     STORE_FNAME
        jmp     EXIT
FIND_NEXT:
        mov     bx,HANDLE
        mov     ah,3Eh
        int     21h          ; Close previous file
        mov     HANDLE,0FFFFh ; Note that file was closed
        mov     ah,4Fh
        int     21h          ; Find next file
        jnc     STORE_FNAME
        jmp     EXIT
STORE_FNAME:
        mov     bx,0
NEXT_SYM:
        mov     al,BYTE PTR cs:[bx+9Eh]
        mov     FNAME[bx],al
        cmp     BYTE PTR cs:[bx+9Eh],0
        je      SET_ATTRIB
        inc     bx
        cmp     bx,13
        jng     NEXT_SYM
        jmp     ERR
SET_ATTRIB:
        lea     dx,FNAME
        mov     cx,00100000b ; arc,dir,vol,sys,hid,r/o
        mov     ax,4301h
        int     21h          ; Set file attributes
        jnc     READ_HANDLE
        jmp     ERR
READ_HANDLE:
        lea     dx,FNAME
        mov     ax,3D02h     ; Read/write mode
        int     21h
        jnc     READ_FLEN
        jmp     ERR
READ_FLEN:
        mov     HANDLE,ax    ; Store handle from ax
        mov     cx,0
        mov     dx,0         ; NULL seek position in cx:dx
        mov     bx,HANDLE
        mov     ax,4202h     ; Get program length in dx:ax
        int     21h
        mov     FLEN,ax
        cmp     dx,0
        je      SET_FSTART
        mov     FLEN,0FFFFh
SET_FSTART:
        mov     bx,HANDLE
        mov     cx,0
        mov     dx,0         ; NULL seek position in cx:dx
        mov     ax,4200h
        int     21h          ; Set seek pointer to start of file
READ_FILE:
        mov     bx,HANDLE
        mov     cx,FLEN
        mov     dx,0
        cmp     FLEN,8001h   ; If length of file<32769
        jb      READ_REST    ; Read file in one step
        mov     cx,8000h
        push    ds
        mov     dx,0
        mov     ax,FSEG
        mov     ds,ax
        mov     ah,3Fh
        int     21h          ; Read 32768 bytes from file to buffer
        pop     ds
        mov     cx,FLEN
        mov     dx,8000h
        sub     cx,8000h     ; Prepare to read the rest of the file
READ_REST:
        mov     bx,HANDLE
        push    ds
        mov     ax,FSEG
        mov     ds,ax        ; ds:dx - buffer address
        mov     ah,3Fh
        int     21h          ; read