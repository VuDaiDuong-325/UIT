.model small
.stack 100h
.data
    msg1 db 'Nhap so N : $'
    msg2 db 0Dh, 0Ah, 'Day Fibonacci: $'
    msg_error db 0Dh, 0Ah, 'So N phai tu 10 den 24! $'
    space db ' $'      ; Khoang cach giua cac so
    n dw 0            ; Luu so N (word)
    fibo0 dw 0         ; So Fibonacci thu 1
    fibo1 dw 1         ; So Fibonacci thu 2
    fibon dw 0         ; So Fibonacci tiep theo

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Hien thi thong bao "Nhap so N"
    lea dx, msg1
    mov ah, 09h
    int 21h

    ; Nhap so N (2 chu so)
    mov ah, 01h
    int 21h
    sub al, '0'     ; Chuyen ky tu hang chuc thanh so
    mov bl, al      ; Luu hang chuc vao bl

    mov ah, 01h
    int 21h
    sub al, '0'     ; Chuyen ky tu hang don vi thanh so
    mov bh, al      ; Luu hang don vi vao bh

    ; Tinh N = hang chuc * 10 + hang don vi
    mov al, bl
    mov bl, 10
    mul bl          ; Nhan hang chuc voi 10 (ax = hang chuc * 10)
    add al, bh      ; Cong voi hang don vi
    mov ah, 0       ; Dam bao phan cao cua ax = 0
    mov n, ax       ; Luu so N
    mov cx, ax      ; Su dung cx lam bo dem

    ; Kiem tra N co nam trong khoang 10-24 khong
    cmp ax, 10
    jl invalid_input ; Neu N < 10, bao loi
    cmp ax, 24
    jg invalid_input ; Neu N > 24, bao loi
; Hien thi thong bao "Day Fibonacci: "
    lea dx, msg2
    mov ah, 09h
    int 21h

    ; Kiem tra neu N = 0 thi thoat
    cmp cx, 0
    je end_program

    ; In so Fibonacci dau tien (0)
    mov ax, fibo0
    call print_number

    ; Giam bo dem
    dec cx
    cmp cx, 0
    je end_program

    ; In khoang cach
    lea dx, space
    mov ah, 09h
    int 21h

    ; In so Fibonacci thu hai (1)
    mov ax, fibo1
    call print_number

    ; Giam bo dem
    dec cx
    cmp cx, 0
    je end_program

    ; In khoang cach
    lea dx, space
    mov ah, 09h
    int 21h

    ; Bat dau vong lap de in cac so Fibonacci tiep theo
fibo_loop:
    ; Tinh so Fibonacci tiep theo
    mov ax, fibo0
    mov bx, fibo1
    add ax, bx      ; fibn = fib0 + fib1
    mov fibon, ax    ; Luu so moi
    mov ax, fibo1
mov fibo0, ax    ; Cap nhat fib0
    mov ax, fibon
    mov fibo1, ax    ; Cap nhat fib1

    ; In so Fibonacci hien tai
    mov ax, fibon
    call print_number

    ; In khoang cach (tru lan in so cuoi cung)
    cmp cx, 1
    je skip_space
    lea dx, space
    mov ah, 09h
    int 21h
skip_space:

    ; Giam bo dem va lap lai
    loop fibo_loop   ; Giam cx va lap lai neu cx > 0

    jmp end_program

invalid_input:
    ; Hien thi thong bao loi
    lea dx, msg_error
    mov ah, 09h
    int 21h

end_program:
    ; Ket thuc chuong trinh
    mov ah, 4Ch
    int 21h
main endp

; Ham in so (ho tro so nhieu chu so)
print_number proc
    push ax
    push bx
    push cx
    push dx

    mov bx, 10
    mov cx, 0       ; Dem so chu so
convert_loop:
    mov dx, 0
    div bx          ; Chia ax cho 10, thuong trong ax, du trong dx
    push dx         ; Luu chu so (du) vao stack
    inc cx          ; Tang so chu so
    cmp ax, 0       ; Neu thuong = 0 thi dung
    jne convert_loop

print_loop:
    pop dx          ; Lay chu so tu stack
    add dl, '0'     ; Chuyen thanh ky tu
    mov ah, 02h
    int 21h         ; In ky tu
    loop print_loop

    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_number endp

end main
