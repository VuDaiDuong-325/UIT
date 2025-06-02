.model small
.stack 100h
.data
    count db 0
    msg db 'Day fibo: $'
.code
main:
    mov ax, @data
    mov ds, ax

    mov ah, 01h
    int 21h
    sub al, '0'
    mov bl, al

    mov ah, 01h
    int 21h
    sub al, '0'
    mov bh, al
             
    mov ah, 02h
    mov dl, 13    
    int 21h
    mov dl, 10     
    int 21h


    mov ah, 09h
    lea dx, msg         
    int 21h

    mov al, bl
    mov cl, 10
    mul cl
    add al, bh
    mov count, al   

    mov cx, 0
    mov ax, 0
    mov bx, 1

print_loop:
    push ax
    call print_number
    pop ax

    mov dx, ax
    add dx, bx
    mov ax, bx
    mov bx, dx

    inc cx
    mov dl, count
    cmp cl, dl
    jl print_loop

    mov ah, 4ch
    int 21h

print_number:
    push ax
    push bx
    push cx
    push dx

    mov cx, 0
next_digit:
    mov dx, 0
    mov bx, 10
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne next_digit

print_digits:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop print_digits

    mov dl, ' '
    mov ah, 02h
    int 21h

    pop dx
    pop cx
    pop bx
    pop ax
    ret
