.data	
array1:	.word 	5, 6, 7, 8, 1, 2, 3, 9, 10, 4
size1:	.word 10

array2: .byte	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
size2:	.word 16

array3: .space	8
size3:	.word 8	

mang1: 	.asciiz "Mang 1: "
mang2: 	.asciiz "Mang 2: "
mang3: 	.asciiz "Mang 3: "
enter: 	.asciiz "\n"
space:	.asciiz " "
arr_f: 	.asciiz "1: Mang 1\n2: Mang 2\n3: Mang 3\nMang can tim: "
pos_f:	.asciiz "Vi tri can lay: "
phantu: .asciiz "Phan tu can tim: "
arr_out:	.asciiz "Mang can tim khong phu hop. Vui long nhap lai mang can tim: "
pos_out: 	.asciiz "Vi tri can tim khong phu hop. Vui long nhap lai vi tri can tim: "
pos_cf:	.asciiz " ("
pos_cb:	.asciiz ") "
.text

main:	#Mang 1
	li $v0, 4
	la $a0, mang1
	syscall
	
	li $t0, 0
	lb $s0, size1
	
LOOP1:	beq $t0, $s0, EXIT1

	sll $t1, $t0, 2
	lw $t2, array1($t1)
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	addi $t0, $t0, 1
	j LOOP1
	
EXIT1:	#Mang 2
	li $v0, 4
	la $a0, enter
	syscall
	
	li $v0, 4
	la $a0, mang2
	syscall
	
	li $t0, 0		
	lb $s1, size2
	
LOOP2:	beq $t0, $s1, EXIT2

	lb $t1, array2($t0)
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	addi $t0, $t0, 1
	j LOOP2
	
EXIT2:	#Mang 3
	li $v0, 4
	la $a0, enter
	syscall
	
	li $v0, 4
	la $a0, mang3
	syscall
	
	li $t0, 0	
	lb $s2, size3
	addi $t7, $s1, -1			#size2 - 1

LOOP3:	beq $t0, $s2, EXIT3

	lb $t1, array2($t0)			#array2[i]
	
	sub $t2, $t7, $t0			#size2 - 1 - i
	lb $t3, array2($t2)			#array2[size2 - 1 - i]
	
	add $t4, $t1, $t3			#$t4 = array2[i] + array2[size2 - 1 - i]
	sb $t4, array3($t0)			#array3[i] = $t4
	
	li $v0, 1
	move $a0, $t4
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	addi $t0, $t0, 1
	j LOOP3
	
EXIT3:
	li $v0, 4
	la $a0, enter
	syscall
	
	li $v0, 4
	la $a0, arr_f
	syscall
	
	li $v0, 5
	syscall
	
	move $t6, $v0			#Mang can lay
	
	li $v0, 4
	la $a0, pos_f
	syscall
	
	li $v0, 5
	syscall
	
	move $t7, $v0			#Vi tri can lay
	
	
	#Xet mang
Mang:	beq $t6, 1, Mang1
	beq $t6, 2, Mang2
	beq $t6, 3, Mang3
	j Mang_out
	
Mang1:	addi $t1, $s0, -1
	blt $t7, 0, Vitri_out
	bgt $t7, $t1, Vitri_out
	sll $t5, $t7, 2			#Dich byte vi tri can tim
	lw $t4, array1($t5)
	
	li $v0, 4
	la $a0, phantu
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall
	
	j END
	
Mang2:	addi $t1, $s1, -1
	blt $t7, 0, Vitri_out
	bgt $t7, $t1, Vitri_out
	lb $t6, array2($t7)
	
	li $v0, 4
	la $a0, phantu
	syscall
	
	li $v0, 1
	move $a0, $t6
	syscall
	
	j END

Mang3:	addi $t1, $s2, -1
	blt $t7, 0, Vitri_out
	bgt $t7, $t1, Vitri_out
	lb $t5, array3($t7)
	
	li $v0, 4
	la $a0, phantu
	syscall
	
	li $v0, 1
	move $a0, $t5
	syscall
	
	li $v0, 4
	la $a0, pos_cf
	syscall 
	
	li $v0, 1
	move $a0, $t7
	syscall
	
	li $v0, 4
	la $a0, pos_cb
	syscall
	
	j END
	
Mang_out:	li $v0, 4
		la $a0, arr_out
		syscall
		
		li $v0, 5
		syscall
		move $t6, $v0
		
		j Mang
		
Vitri_out:	li $v0, 4
		la $a0, pos_out
		syscall
		
		li $v0, 5
		syscall
		move $t7, $v0
		
		beq $t6, 1, Mang1
		beq $t6, 2, Mang2
		j Mang3
END:
