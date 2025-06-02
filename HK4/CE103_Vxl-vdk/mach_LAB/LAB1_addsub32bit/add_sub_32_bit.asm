name "add-sub-32bit"                       

; add and sub operation between (bx-dx) and (ax-cx)

org 100h

;print "Tong: "               
mov dx, offset msg_tong    ; Load the offset of the string "Tong: "
mov ah, 09h                ; DOS function to print string
int 21h
   
mov bx, 0001h      
mov dx, 0001h    
          
mov ax, 0001h       
mov cx, 0FFFFh

; push variables into stack
push ax
push bx
push cx
push dx


; add operation
clc 
add dx, cx
adc bx, ax  
mov di, dx
          
mov si, bx    
call print_bin 
mov dl, ' '
mov ah, 2
int 21h 

mov si, di    
call print_bin           

mov dl, 'b'
mov ah, 2
int 21h  

; newline
mov dl, 0Ah           ; Line Feed (LF)
mov ah, 02h           ; DOS function to print a character
int 21h

mov dl, 0Dh           ; Carriage Return (CR)
int 21h      

; print "Hieu: "
mov dx, offset msg_hieu    
mov ah, 09h                
int 21h

; take all variables out from the stack
pop dx
pop cx
pop bx 
pop ax

; sub
clc
sub dx, cx
sbb bx, ax  
mov di, dx                

mov si, bx    
call print_bin    
mov dl, ' '
mov ah, 2
int 21h 

mov si, di    
call print_bin


mov dl, 'b'
mov ah, 2
int 21h  

mov ah, 0
int 16h
ret


print_bin:
    mov cx, 16
print_loop:
    mov ah, 2   
    mov dl, '0'
    test si, 8000h  
    jz zero
    mov dl, '1'
zero:
    int 21h
    shl si, 1  
loop print_loop      
    ret
                
msg_tong db 'Tong: $'  
msg_hieu db 'Hieu: $'