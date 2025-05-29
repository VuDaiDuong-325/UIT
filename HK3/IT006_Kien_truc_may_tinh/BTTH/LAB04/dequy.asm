        .data
prompt: .asciiz "Factorial of 10 is: " 

        .text
        .globl main

main:
       
        li $a0, 10          
        jal factorial        
        
        move $s0, $v0		#L?u giá tr? $v0 vào thanh ghi $s0

        li $v0, 4          
        la $a0, prompt       
        syscall

        # In k?t qu? factorial
        li $v0, 1            
        move $a0, $s0       
        syscall

        # K?t thúc ch??ng trình
        li $v0, 10      
        syscall

# Hàm tính giai th?a n (n!)
factorial:
        # n < 1
        blt $a0, 1, base_case

        # L?u giá tr? return address và thanh ghi $a0 lên stack
        addi $sp, $sp, -8     
        sw $ra, 4($sp)        # L?u return address vào stack
        sw $a0, 0($sp)        # L?u giá tr? c?a $a0 vào stack

        addi $a0, $a0, -1     
        jal factorial          # G?i ?? quy factorial(n-1)

        # Quay l?i, ph?c h?i giá tr? $a0 và $ra t? stack
        lw $a0, 0($sp)         # L?y l?i giá tr? c?a $a0
        lw $ra, 4($sp)         # L?y l?i return address
        addi $sp, $sp, 8       # Khôi ph?c l?i stack pointer

        # Tính k?t qu?: n * factorial(n-1)
        mul $v0, $v0, $a0      # $v0 = n * factorial(n-1)

        jr $ra                 # Quay l?i hàm g?i

base_case:
        li $v0, 1             
        jr $ra                 # Quay l?i hàm g?i
